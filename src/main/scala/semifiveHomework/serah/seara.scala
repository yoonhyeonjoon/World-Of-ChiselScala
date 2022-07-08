package serah.histogram

import chisel3._
import chisel3.util._
import functional.transmitter.ElementTransmitModule
import runOption.ComplexRunner.generating

import scala.util.Random.nextGaussian


class Testabler extends Module{

  class TestableBundle extends Bundle {
    val out: Vec[UInt] = Output(Vec(100, UInt(1000.W))) //counting number depends on inputNumber.
  }

  val testableBundle:TestableBundle = IO(new TestableBundle())
  val domainChanger:Domainchanger = Module(new Domainchanger(DomainParams(inputNumber=1000, outputNumber = 100)))
  val transmit:Seq[ElementTransmitModule[UInt]] = Seq.fill(1000)(Module(new ElementTransmitModule[UInt](Seq(java.lang.Math.max(50+nextGaussian()*4, 0).toInt.U))))

  domainChanger.io.in.valid := true.B
  transmit.zipWithIndex.foreach{ case (aGenerator, index) =>
    aGenerator.io.generatedDecoupledOutput.ready := true.B
    domainChanger.io.in.bits(index) := aGenerator.io.generatedSimpleOutput
  }

  testableBundle.out.zip(domainChanger.io.out).foreach { case (out, in) => out := in}

}

object TestModule extends App{

  generating(new Testabler())
}



case class DomainParams(inputNumber : Int, outputNumber : Int){
  def bitSize(numb : Int) = log2Ceil(numb + 1) // 1000넣으면 10비트, 100 넣으면 7비트
  val inputBits: Int = bitSize(inputNumber)
  val outputBits: Int = bitSize(outputNumber)
}



class Domainchanger(domainParams: DomainParams) extends Module {

  class DomainchangerBundle extends Bundle {
    val in: DecoupledIO[Vec[UInt]] = Flipped(Decoupled(Vec(domainParams.inputNumber, UInt(domainParams.outputBits.W)))) //input size depends on outputNumber
    val out: Vec[UInt] = Output(Vec(domainParams.outputNumber, UInt(domainParams.inputBits.W))) //counting number depends on inputNumber.
  }


  val io: DomainchangerBundle = IO(new DomainchangerBundle())

  val connectReg: Seq[UInt] = Seq.fill(domainParams.outputNumber)(RegInit(0.U(domainParams.inputBits.W)))
  val counter: Counter = Counter(domainParams.inputNumber + 1)

  when(io.in.fire) { //ready valid
    counter.inc() // counter next clock wrap
  }.otherwise {
    counter.reset() // counter reset
  }

  when(reset.asBool === true.B) {
    counter.reset()
    io.in.ready := false.B
    connectReg.map { Reg => Reg := 0.U }
  }.otherwise {
    io.in.ready := true.B
  }


  val connect = MuxLookup(counter.value, 0.U, io.in.bits.zipWithIndex.map { case (value: UInt, index: Int) => (index.U, value) })

  connectReg.zipWithIndex.foreach({ case (xvalue: UInt, xindex) =>
    when(xindex.U === connect) {
      xvalue := xvalue + 1.U
    }.otherwise {
      xvalue := xvalue
    }
  })

  io.out.zipWithIndex.foreach({ case (x, y) =>
    x := connectReg(y)
  })

}


