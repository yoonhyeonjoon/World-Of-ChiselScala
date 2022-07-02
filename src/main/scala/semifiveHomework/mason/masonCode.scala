package semifiveHomework.mason

import functional.transmitter.ElementTransmitModule
import runOption.ComplexRunner.generating
import scala.util.Random.nextGaussian
import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util._

class Testabler extends Module {

  class TestableBundle extends Bundle {
    val out: Vec[UInt] = Output(Vec(100, UInt(1000.W))) //counting number depends on inputNumber.
  }

  val testableBundle:TestableBundle = IO(new TestableBundle())
  val domainChanger = Module(new Domainchanger(1000, 100))
  val transmit: Seq[ElementTransmitModule[UInt]] = Seq.fill(1000)(Module(new ElementTransmitModule[UInt](Seq(java.lang.Math.max(50+nextGaussian()*4, 0).toInt.U))))

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

class Domainchanger(n:Int, m:Int) extends Module { // n : 1000 m : 100
  val io = IO(new Bundle {
    val in  = Input  (Vec(n, UInt(log2Ceil(m).W)))
    val out = Output (Vec(m, UInt(log2Ceil(n).W)))
  })
  val count = RegInit(0.U(log2Ceil(m).W))
  val j_cnt = RegInit(0.U(log2Ceil(m).W))
  val i_cnt = RegInit(0.U(log2Ceil(n).W))
  for(i <- 0 until n){
    i_cnt := i_cnt + 1.U
    for(j <- 0 until m){
      j_cnt := j_cnt + 1.U
      when (io.in(i) === j_cnt) {
        count := count + 1.U
        io.out(j) := count
      }
        .otherwise{
          io.out(j) := count
        }
    }
  }
}

object MasonHistogram extends App {
  println("Starting generate")
  (new ChiselStage).emitVerilog(new Domainchanger(10, 10) )
}

