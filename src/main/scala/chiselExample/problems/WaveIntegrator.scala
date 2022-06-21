package chiselExample.problems

import Chisel.log2Ceil
import chisel3._
import chisel3.tester.{testableClock, testableData}
import chiseltest.RawTester.test
import runOption.ComplexRunner.generating


case class VolumeIntegratorParams(maxWaveHeight:Int, inputNumber:Int, timemainFactor:Int, maxOptionIs:Int=1000){
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val inputBits: Int = bitSize(inputNumber)
  val outputBits: Int = bitSize(maxWaveHeight)
}

class VolumeIntegrator(volumeIntegratorParams:VolumeIntegratorParams) extends Module {

  class VolumeIntegratorBundle extends Bundle {
    val in: Vec[UInt] = Input(Vec(volumeIntegratorParams.inputNumber, UInt(volumeIntegratorParams.outputBits.W)))
    val option: UInt = Input(UInt(volumeIntegratorParams.outputBits.W))
    val out: UInt = Output(UInt(volumeIntegratorParams.outputBits.W))
    val outChecker : UInt = Output(UInt(100.W))
    val outDelayedChecker : UInt = Output(UInt(100.W))
  }

  class GripperInDelayNCycles[T <: Data](data:T, gripper:Int)(cycle:Int = gripper) extends Module {

    class DelayNCyclesBundle() extends Bundle {
      val in: T = Input(data)
      val out: T = Output(data)
    }

    val delayedBundle: DelayNCyclesBundle = new DelayNCyclesBundle
    val io:DelayNCyclesBundle = IO(delayedBundle)
    var lastConn:T = io.in
    for (i <- 0 until cycle) {
      lastConn = RegNext(lastConn)
      if(i == gripper) io.out := lastConn
    }
  }

  val io: VolumeIntegratorBundle = IO(new VolumeIntegratorBundle)
  val maxBitSize: Int = volumeIntegratorParams.bitSize(volumeIntegratorParams.inputNumber*volumeIntegratorParams.maxWaveHeight*volumeIntegratorParams.timemainFactor)
  val stateSaver: UInt = RegInit(0.U(maxBitSize.W))
  val currentInputSum: UInt = io.in.reduce{_+&_}

  val delayed: GripperInDelayNCycles[UInt] = Module(new GripperInDelayNCycles(data=UInt(), gripper=volumeIntegratorParams.timemainFactor)(cycle=volumeIntegratorParams.maxOptionIs))
  delayed.io.in := currentInputSum
  when(stateSaver + currentInputSum > delayed.io.out)
  {
    stateSaver := stateSaver + currentInputSum - delayed.io.out
  }.otherwise{
    stateSaver := stateSaver + delayed.io.out
  }


  val scale: UInt = (volumeIntegratorParams.inputNumber*volumeIntegratorParams.timemainFactor).U
  io.out := stateSaver / scale
  printf("stateSaver : %d + %d - %d, / %d => io.out = %d \n", stateSaver, currentInputSum, delayed.io.out, scale, io.out)

  io.outChecker := stateSaver
  io.outDelayedChecker := delayed.io.out
  
}

object VolumeIntegrator extends App{
  generating(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 10,inputNumber = 5, timemainFactor = 4)))


  test(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 10,inputNumber = 5, timemainFactor = 4))) { c =>

    c.io.in(0).poke(5.U)
    c.io.in(1).poke(1.U)
    c.io.in(2).poke(2.U)
    c.io.in(3).poke(3.U)
    c.io.in(4).poke(4.U) // = 15
    c.clock.step()

    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())

    c.io.in(0).poke(2.U)
    c.io.in(1).poke(3.U)
    c.io.in(2).poke(4.U)
    c.io.in(3).poke(5.U)
    c.io.in(4).poke(6.U) //20
    c.clock.step()
    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())

    c.io.in(0).poke(1.U)
    c.io.in(1).poke(1.U)
    c.io.in(2).poke(2.U)
    c.io.in(3).poke(3.U)
    c.io.in(4).poke(4.U) // = 11
    c.clock.step()
    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())

    c.io.in(0).poke(4.U)
    c.io.in(1).poke(3.U)
    c.io.in(2).poke(4.U)
    c.io.in(3).poke(5.U)
    c.io.in(4).poke(6.U) //22
    c.clock.step()
    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())

    c.io.in(0).poke(4.U)
    c.io.in(1).poke(5.U)
    c.io.in(2).poke(6.U)
    c.io.in(3).poke(7.U)
    c.io.in(4).poke(8.U) //30
    c.clock.step()
    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())


    c.io.in(0).poke(8.U)
    c.io.in(1).poke(3.U)
    c.io.in(2).poke(4.U)
    c.io.in(3).poke(5.U)
    c.io.in(4).poke(6.U) //26
    c.clock.step()

    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())

    c.io.in(0).poke(5.U)
    c.io.in(1).poke(5.U)
    c.io.in(2).poke(6.U)
    c.io.in(3).poke(7.U)
    c.io.in(4).poke(8.U) //31
    c.clock.step()
    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())

    c.io.in(0).poke(4.U)
    c.io.in(1).poke(1.U)
    c.io.in(2).poke(2.U)
    c.io.in(3).poke(3.U)
    c.io.in(4).poke(4.U)// = 14
    c.clock.step()
    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())

    c.io.in(0).poke(1.U)
    c.io.in(1).poke(3.U)
    c.io.in(2).poke(4.U)
    c.io.in(3).poke(5.U)
    c.io.in(4).poke(6.U) //19
    c.clock.step()
    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())

    c.io.in(0).poke(3.U)
    c.io.in(1).poke(1.U)
    c.io.in(2).poke(2.U)
    c.io.in(3).poke(3.U)
    c.io.in(4).poke(4.U)// = 13
    c.clock.step()
    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())

    c.io.in(0).poke(1.U)
    c.io.in(1).poke(3.U)
    c.io.in(2).poke(4.U)
    c.io.in(3).poke(5.U)
    c.io.in(4).poke(5.U) //18
    c.clock.step()
    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())

    c.io.in(0).poke(4.U)
    c.io.in(1).poke(1.U)
    c.io.in(2).poke(2.U)
    c.io.in(3).poke(5.U)
    c.io.in(4).poke(4.U)// = 16
    c.clock.step()
    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())

  }



}