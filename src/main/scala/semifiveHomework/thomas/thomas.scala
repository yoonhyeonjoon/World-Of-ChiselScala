package thmoas

import chisel3._
import chisel3.stage._
import chisel3.tester.{testableClock, testableData}
import chisel3.util._
import functional.transmitter.ElementTransmitModule
import nathan.histogram_final.Domainchanger
import runOption.ComplexRunner.generating

import scala.util.Random.nextGaussian


case class DomainParams(inputNumber : Int, outputNumber : Int){
  def bitSize(numb : Int) = log2Ceil(numb + 1)
  val inputBits:  Int = bitSize(inputNumber)
  val outputBits: Int = bitSize(outputNumber)
}

class Domainchanger(domainParams : DomainParams) extends Module {

  class DomainchangerBundle extends Bundle {
    val in : DecoupledIO[Vec[UInt]] = Flipped(Decoupled(Vec(domainParams.inputNumber, UInt(domainParams.outputBits.W)))) //input size depends on outputNumber
    val out: Vec[UInt]              = Output(Vec(domainParams.outputNumber, UInt(domainParams.inputBits.W))) //counting number depends on inputNumber.
  }
  val io      : DomainchangerBundle = IO(new DomainchangerBundle)
  val readyReg: Bool      = RegInit(true.B)
  val count   : Counter   = Counter(domainParams.inputNumber+1)
  val Detect  : Seq[UInt] = Seq.fill(domainParams.outputNumber)(RegInit(UInt(domainParams.inputBits.W), 0.U))

  io.in.ready := readyReg

  when(io.in.fire){
    count.inc()
  }.otherwise{
    count.reset()
  }

  val candidateValue: UInt = MuxLookup(count.value, 0.U, {
    val switching = io.in.bits.zipWithIndex.map { case (inputValue: UInt, inputIndex: Int) =>
      (inputIndex.U, inputValue)
    }
    switching  })

  Detect.zip(io.out).zipWithIndex.foreach { case (value, index) =>
    when((io.in.fire) & (Detect(index) === candidateValue)){
      Detect(index) := Detect(index) + 1.U
    }.otherwise{
      readyReg := false.B
    }
    value._2 := value._1
  }

  when(reset.asBool === true.B){
    count.reset()
    io.in.ready := false.B
    Detect.map{ x => x := 0.U}
  }.otherwise{
    io.in.ready := true.B
  }

}


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