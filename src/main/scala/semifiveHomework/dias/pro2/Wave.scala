package semifiveHomework.dias.pro2

import chisel3._
import chisel3.util._
import chisel3.stage._

import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import scala.math._


case class VolumeIntegratorParams(maxWaveHeight: Int, inputNumber: Int, timemainFactor: Int){
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val outputBits: Int = bitSize(maxWaveHeight)
}

class VolumeIntegrator(volumeIntegratorParams:VolumeIntegratorParams) extends Module {

  class VolumeIntegratorBundle extends Bundle {
    val in: Vec[UInt] = Input(Vec(volumeIntegratorParams.inputNumber, UInt(volumeIntegratorParams.outputBits.W)))
    //val option: UInt = Input(UInt(volumeIntegratorParams.outputBits.W))
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
  val io : VolumeIntegratorBundle = IO(new VolumeIntegratorBundle())


  //counter
  val countOn = true.B
  val (counterValue, counterWrap) = Counter(countOn, 100000)

  //shift register & sum register
  val reg = VecInit(
    Seq.iterate(
      io.in.map{ x => x }.reduce{(a,b) => a +& b}, volumeIntegratorParams.timemainFactor+1
    )(util.RegEnable(_, countOn)).drop(1)
  )

  //output
  when(counterValue > (volumeIntegratorParams.timemainFactor-2).U)
  {
    io.out := (reg.reduce{(a,b) => a +& b} / volumeIntegratorParams.timemainFactor.U)
  }
  .otherwise{io.out := 0.U}




}
object test4223 extends App{
  println("start")
  (new ChiselStage).emitVerilog(new VolumeIntegrator(VolumeIntegratorParams(10,10,4)))
  println("done")
}

