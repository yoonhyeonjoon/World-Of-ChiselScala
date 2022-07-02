package sinho.sinho_histogram


import chisel3._
import chisel3.util._
import functional.transmitter.ElementTransmitModule
import runOption.ComplexRunner.generating

import scala.util.Random.nextGaussian



case class DomainParams(inputNumber : Int, outputNumber : Int){
  def bitSize(numb : Int) = log2Ceil(numb + 1)
  val inputBits: Int = bitSize(inputNumber)
  val outputBits: Int = bitSize(outputNumber)
}



class Domainchanger(domainParams : DomainParams) extends Module {


  class DomainchangerBundle extends Bundle {
    val in: DecoupledIO[Vec[UInt]] = Flipped(Decoupled(Vec(domainParams.inputNumber, UInt(domainParams.outputBits.W)))) //input size depends on outputNumber
    val out: Vec[UInt] = Output(Vec(domainParams.outputNumber, UInt(domainParams.inputBits.W))) //counting number depends on inputNumber.
  }


  val io: DomainchangerBundle = IO(new DomainchangerBundle)

  val counter: Counter = Counter(domainParams.inputNumber + 1)


  val Flippedarg: IndexedSeq[(UInt, UInt)] = io.in.bits.zipWithIndex.map{
    case (inputvalue: UInt, inputIndex: Int) => (inputIndex.U, inputvalue)
  }

  val candidateValue: UInt = MuxLookup(counter.value, 0.U, Flippedarg)


  val readyReg: Bool = RegInit(true.B)

  val outreg: Seq[UInt] = Seq.fill(domainParams.outputNumber)(RegInit(UInt(domainParams.inputBits.W), 0.U))

  when(io.in.fire) {
    //    printf("increase %d %d\n", caseMatcher.value, io.in.ready)
    counter.inc()
  }
    .otherwise {
      //    printf("reseted %d %d\n", caseMatcher.value, io.in.ready)
      counter.reset()
    }



  outreg.zip(io.out).zipWithIndex.foreach { case (value, index) =>
    when(index.U === candidateValue) {
    outreg(index) := outreg(index) + 1.U
    }.otherwise{
      outreg(index) := outreg(index)
    }
      value._2 := value._1
    }


  when(reset.asBool === true.B){
    counter.reset()
    io.in.ready := false.B
    outreg.map{ aReg => aReg := 0.U}
  }.otherwise{
    io.in.ready := true.B
  }

  io.in.ready := readyReg


}


class Testabler extends Module{

  class TestableBundle extends Bundle {
    val out: Vec[UInt] = Output(Vec(100, UInt(1000.W))) //counting number depends on inputNumber.
  }

  val testableBundle:TestableBundle = IO(new TestableBundle())
  val domainChanger: Domainchanger = Module(new Domainchanger(DomainParams(1000, 100)))
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