package aaron.histogram

import chisel3._
import chisel3.util._
import functional.transmitter.ElementTransmitModule
import runOption.ComplexRunner.generating

import scala.util.Random.nextGaussian
//import functional.transmitter.ElementTransmitModule

case class DomainParams(inputNumber : Int, outputNumber : Int){
  def bitSize(numb : Int) = log2Ceil(numb + 1)
  val inputBits: Int = bitSize(inputNumber) // 1000넣으면 10bit
  val outputBits: Int = bitSize(outputNumber) // 100넣으면 7bit
}

class Domainchanger(domainParams : DomainParams) extends Module {

  class DomainchangerBundle extends Bundle {
    val in: DecoupledIO[Vec[UInt]] = Flipped(Decoupled(Vec(domainParams.inputNumber, UInt(domainParams.outputBits.W)))) // 1000 7bit vec
    val out: Vec[UInt] = Output(Vec(domainParams.outputNumber, UInt(domainParams.inputBits.W))) // 100 10bit vec
  }
  val io: DomainchangerBundle = IO(new DomainchangerBundle)
  val counter: Counter = Counter(domainParams.inputNumber+1)
  val outputReg: Seq[UInt] = Seq.fill(domainParams.outputNumber)(RegInit(0.U(domainParams.inputBits.W)))

  when(io.in.fire){ //ready valid
    counter.inc() // counter next clock wrap
  } .otherwise {
    counter.reset() // counter reset
  }

  val NowValue: UInt = MuxLookup(counter.value, 0.U, {
    val nowValue = io.in.bits.zipWithIndex.map{ case(inputValue: UInt, inputIndex: Int) => (inputIndex.U, inputValue)
    }
    nowValue
  }) //in.bits.zwi.map depends on counter.value

  when(reset.asBool === true.B) {
    counter.reset()
    io.in.ready := false.B
    outputReg.map { Reg => Reg := 0.U }
  }.otherwise{
    io.in.ready := true.B
  }

  outputReg.zipWithIndex.foreach{ case( x, y ) =>
    when(y.U === NowValue & io.in.fire){
      x := x + 1.U
    }.otherwise{
      x := x
    }
    io.out(y) := x
  }
}


class Testabler extends Module{

  class TestableBundle extends Bundle {
    val out: Vec[UInt] = Output(Vec(100, UInt(1000.W))) //counting number depends on inputNumber.
  }

  val testableBundle:TestableBundle = IO(new TestableBundle())
  val domainChanger = Module(new Domainchanger( DomainParams(1000, 100)))
  val transmit: Seq[ElementTransmitModule[UInt]] = Seq.fill(1000)(Module(new ElementTransmitModule[UInt](Seq(java.lang.Math.max(50+nextGaussian()*4, 0).toInt.U))))

  domainChanger.io.in.valid := true.B
  transmit.zipWithIndex.foreach{ case (aGenerator, index) =>
    aGenerator.io.generatedDecoupledOutput.ready := true.B
    domainChanger.io.in.bits(index) := aGenerator.io.generatedSimpleOutput
  }

  //  domainChanger.io.out.ready := true.B
  testableBundle.out.zip(domainChanger.io.out).foreach { case (out, in) => out := in}
}

object TestModule extends App{
  generating(new Testabler())
}