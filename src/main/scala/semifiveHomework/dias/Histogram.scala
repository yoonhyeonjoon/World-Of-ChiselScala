package semifiveHomework.dias.histogram

import chisel3._
import chisel3.util._
import chisel3.stage._
import functional.transmitter.ElementTransmitModule
import runOption.ComplexRunner.generating
import semifiveHomework.dias.histogram2.{DomainParams, Domainchanger}

import scala.util.Random.nextGaussian


class Testabler extends Module{

  class TestableBundle extends Bundle {
    val out: Vec[UInt] = Output(Vec(100, UInt(1000.W))) //counting number depends on inputNumber.
  }

  val testableBundle:TestableBundle = IO(new TestableBundle())
  val domainChanger = Module(new semifiveHomework.dias.histogram.Domainchanger(semifiveHomework.dias.histogram.DomainParams(inputNumber=1000, outputNumber = 100)))
  val transmit: Seq[ElementTransmitModule[UInt]] = Seq.fill(1000)(Module(new ElementTransmitModule[UInt](Seq(java.lang.Math.max(50+nextGaussian()*4, 0).toInt.U))))

  domainChanger.io.in.valid := true.B
  transmit.zipWithIndex.foreach{ case (aGenerator, index) =>
    aGenerator.io.generatedDecoupledOutput.ready := true.B
    domainChanger.io.in.bits(index) := aGenerator.io.generatedSimpleOutput
  }

  domainChanger.io.out.ready := true.B
  testableBundle.out.zip(domainChanger.io.out.bits).foreach { case (out, in) => out := in}
}

object TestModule extends App{
  generating(new Testabler())
}

case class DomainParams(inputNumber : Int, outputNumber : Int){
  def bitSize(numb : Int) = log2Ceil(numb + 1)
  val inputBits: Int = bitSize(inputNumber)
  val outputBits: Int = bitSize(outputNumber)
}

class Domainchanger(domainParams : DomainParams) extends Module {

  class DomainchangerBundle extends Bundle {
    val in: DecoupledIO[Vec[UInt]] = Flipped(Decoupled(Vec(domainParams.inputNumber, UInt(domainParams.outputBits.W)))) //input size depends on outputNumber
    val out = Decoupled(Vec(domainParams.outputNumber, UInt(domainParams.inputBits.W)))//counting number depends on inputNumber.
  }

  val io : DomainchangerBundle = IO(new DomainchangerBundle())

  io.out.valid := io.in.valid
  io.in.ready := io.out.ready

  val reg = RegInit(VecInit(Seq.fill(domainParams.outputNumber)(0.U(domainParams.inputNumber.W))))
  //val reg = Reg(Vec(domainParams.outputNumber, UInt(10.W)))

  val in_check = io.in.bits.zipWithIndex.map{ x => (x._2.U, x._1) }
  val counter = Counter(domainParams.inputNumber)
  val check = MuxLookup(counter.value, 0.U, in_check)

  when(io.in.fire) { counter.inc() }.otherwise { counter.reset() }

  io.out.bits.zipWithIndex.foreach{case (out, idx) =>
    when(check === idx.U){ reg(idx) := reg(idx) + 1.U}.otherwise{reg(idx) := reg(idx)}
    //out := reg(idx)
  }
  io.out.bits := reg
}


 object test1212 extends App{
   (new ChiselStage).emitVerilog(new Domainchanger(DomainParams(1000,100)))
 }
