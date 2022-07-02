package nathan.histogram_final

import Chisel.MuxLookup
import chisel3._
import chisel3.util.{RegEnable, log2Ceil}
import functional.transmitter.ElementTransmitModule
import runOption.ComplexRunner.generating
import yohan.yohan_Histogram.{DomainParams, Domainchanger}

import scala.util.Random.nextGaussian

class MyCounter2(maxVal: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val count = Output(UInt(log2Ceil(maxVal+1).W))
  })
  io.count := RegEnable(Mux(io.count < maxVal.U, io.count + 1.U, 0.U), 0.U, io.en)
}


class Domainchanger(numIn: Int,numOut: Int) extends Module{
  val io: histogramIO = IO(new histogramIO(numIn,numOut))
  val TotalSumEachInput = RegInit(VecInit(Seq.fill(numOut)(0.U(DomainParams(numIn,numOut).outputBits.W))))
  val Count = Module(new MyCounter2(DomainParams(numIn,numOut).inputBits))
  val NumOutindex: Seq[UInt] = Seq.tabulate(numOut){i => i.U}
  val SumEnable = Seq.tabulate(numOut){i => i.U}

  Count.io.en := io.en

  val PairForSearch = NumOutindex.zip(SumEnable)
  val tmp : UInt = MuxLookup(io.in(Count.io.count),0.U,PairForSearch)

  io.out.zipWithIndex.foreach({ case(outValue, outIndex) =>
    outValue := RegEnable( outValue + 1.U, 0.U, tmp === outIndex.U )
  })

}


class histogramIO(numIn: Int,numOut: Int) extends Bundle {

  val en = Input(Bool())
  val in = Input(Vec(numIn,UInt(DomainParams(numIn,numOut).inputBits.W)))
  val out = Output(Vec(numOut,UInt(DomainParams(numIn,numOut).outputBits.W)))

  require (numIn > 0 && numOut > 0)

}

case class DomainParams(inputNumber : Int, outputNumber : Int){
  def bitSize(numb : Int) = log2Ceil(numb + 1)
  val inputBits: Int = bitSize(inputNumber)
  val outputBits: Int = bitSize(outputNumber)
}


//object TestHistogram extends App {
//  val x = getVerilogString(new histogram(1000,100))
//  println(x)
//}



class Testabler extends Module{

  class TestableBundle extends Bundle {
    val en = Input(Bool())
    val out: Vec[UInt] = Output(Vec(100, UInt(1000.W))) //counting number depends on inputNumber.
  }

  val testableBundle:TestableBundle = IO(new TestableBundle())
  val domainChanger = Module(new Domainchanger(1000, 100))
  val transmit: Seq[ElementTransmitModule[UInt]] = Seq.fill(1000)(Module(new ElementTransmitModule[UInt](Seq(java.lang.Math.max(50+nextGaussian()*4, 0).toInt.U))))

  domainChanger.io.en := testableBundle.en
//  domainChanger.io.in.valid := true.B
  transmit.zipWithIndex.foreach{ case (aGenerator, index) =>
    aGenerator.io.generatedDecoupledOutput.ready := true.B
    domainChanger.io.in(index) := aGenerator.io.generatedSimpleOutput
  }

  //  domainChanger.io.out.ready := true.B
  testableBundle.out.zip(domainChanger.io.out).foreach { case (out, in) => out := in}
}

object TestModule extends App{
  generating(new Testabler())
}