package semifiveHomework.thomas

import Chisel.log2Ceil
import chisel3._
import chisel3.stage.ChiselStage
//import chisel3.stage.ChiselStage
//import chisel3.tester.{testableClock, testableData}


case class envSetting(wave_MaxValue:Int, input_EA:Int, clock_EA:Int){
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val inputBits  : Int = bitSize(input_EA)
  val outputBits : Int = bitSize(wave_MaxValue)
}

class topIntegration(parameter : envSetting) extends Module {

  class top extends Bundle {
    val in                : Vec[UInt] = Input(Vec(parameter.input_EA, UInt(parameter.outputBits.W)))
    val out               : UInt      = Output(UInt(parameter.outputBits.W))
    val outChecker        : UInt      = Output(UInt(100.W))
    val outDelayedChecker : UInt      = Output(UInt(100.W))
  }

  val io              : top  = IO(new top)
  val maxBitSize      : Int  = parameter.bitSize(parameter.input_EA * parameter.wave_MaxValue * parameter.clock_EA)
  val stateSaver      : UInt = RegInit(0.U(maxBitSize.W))
  val currentInputSum : UInt = io.in.reduce{_+&_}

  class delayModule[T <: Data](data:T)(delayedCycle:Int) extends Module {

    class DelayNCyclesBundle() extends Bundle {
      val in  : T = Input(data)
      val out : T = Output(data)
    }

    val delayedBundle = new DelayNCyclesBundle
    val io:DelayNCyclesBundle = IO(delayedBundle)
    var lastConn:T = io.in
    for (i <- 0 until delayedCycle) {
      lastConn = RegNext(lastConn)
    }
    io.out := lastConn
  }

  val delayed = Module(new delayModule(data=UInt())(delayedCycle = parameter.clock_EA))
  delayed.io.in := currentInputSum
  // Total Sum Movement
  when(stateSaver + currentInputSum > delayed.io.out)
  {
    stateSaver := stateSaver + currentInputSum - delayed.io.out
  }.otherwise{
    stateSaver := stateSaver + delayed.io.out
  }

  val Scale : UInt = (parameter.input_EA * parameter.clock_EA).U
  io.out := stateSaver / Scale  //stateSavor : Total Wave Height Sum, Scale : Number of Wave
  io.outChecker        := stateSaver
  io.outDelayedChecker := delayed.io.out

}

object myTest2 extends App{
  println("Starting generate")
  (new ChiselStage).emitVerilog(new topIntegration( envSetting(100, 10, 10 )) ) //height max value, input EA, clock EA
}




