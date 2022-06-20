package chiselExample.practiceNote

import Chisel.log2Ceil
import chisel3._
import chisel3.util._
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
  val currentInputSum: UInt = io.in.reduce{_+_}
  stateSaver := stateSaver + currentInputSum

  val delayed: GripperInDelayNCycles[UInt] = Module(new GripperInDelayNCycles(data=UInt(), gripper=volumeIntegratorParams.timemainFactor)(cycle=volumeIntegratorParams.maxOptionIs))
  delayed.io.in := stateSaver
  io.out := (delayed.io.out - currentInputSum) / (volumeIntegratorParams.inputNumber*volumeIntegratorParams.timemainFactor).U

}

object VolumeIntegrator extends App{
  generating(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 10,inputNumber = 5, timemainFactor = 4)))



}