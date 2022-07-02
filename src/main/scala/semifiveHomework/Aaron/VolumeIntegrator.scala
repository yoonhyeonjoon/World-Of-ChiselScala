package semifiveHomework.Aaron

import chisel3._
import chisel3.util._
import runOption.ComplexRunner.generating

//-------------------------------------------------------------------------------------------------------------------//


case class VolumeIntegratorParams(maxWaveHeight:Int, inputNumber:Int, timemainFactor:Int, maxOptionIs:Int=1000){
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val outputBits: Int = bitSize(maxWaveHeight)
  val maxBit : Int = bitSize(inputNumber*timemainFactor*maxWaveHeight)
  val divNum: Int = inputNumber * timemainFactor
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
  val addInput: UInt = io.in.reduce{ _ +& _ }
  val VIO: GripperInDelayNCycles[UInt] = Module(new GripperInDelayNCycles(data=UInt(), gripper = volumeIntegratorParams.timemainFactor)(cycle=volumeIntegratorParams.maxOptionIs))
  VIO.io.in := addInput
  val currentState: UInt = RegInit(0.U(volumeIntegratorParams.maxBit.W))

  currentState := currentState + VIO.io.out
  io.out := currentState / volumeIntegratorParams.divNum.U
}

object VolumeIntegrator extends App{
  generating(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 10,inputNumber = 5, timemainFactor = 4)))
}
