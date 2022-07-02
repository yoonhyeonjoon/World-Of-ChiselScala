package chiselExample.problems

import Chisel.{Decoupled, log2Ceil}
import chisel3._
import chisel3.internal.firrtl.Width
import chisel3.util.DecoupledIO
import runOption.ComplexRunner.generating


//960 x 480 x 24bits
//=> 960 x (480 x 24) bits
case class IntellectualCCTVParams(
           videoWidth:Int = 960, videoHeight:Int = 480, colorDomain:Int = 3,
            colorScale:Int = 8/**256bit*/, hardfixFrameCoefficient:Int, hardfixSensitivityThreshold:Int)
{
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val inputBits: Int = colorDomain*colorScale
  val outputBits: Int = bitSize(videoWidth*videoHeight*colorDomain*colorScale)
}

class IntellectualCCTV(intellectualCCTVParams:IntellectualCCTVParams) extends Module {

  val videoFrame:Int = intellectualCCTVParams.videoHeight
  val dataSize: Width = (intellectualCCTVParams.videoWidth * intellectualCCTVParams.inputBits).W
  val bufferSize:Int = 10000

  class VolumeIntegratorBundle extends Bundle {
    val videoInput: Vec[UInt] = Input(Vec(videoFrame, UInt(dataSize)))
    val getResult: Bool = Input(Bool())
    val AlertOutput: Vec[UInt] = Output(Vec(videoFrame, UInt(dataSize)))
//    val Output2: DecoupledIO[Vec[UInt]] = Decoupled(Vec(videoFrame, UInt(dataSize)))
  }

  val io: VolumeIntegratorBundle = IO(new VolumeIntegratorBundle())

  val voxel:Seq[UInt] = Seq.fill(videoFrame)(RegInit(0.U((bufferSize*intellectualCCTVParams.colorScale).W)))

  voxel.zip(io.videoInput).foreach(it => {

    val setR = it._2
    it._1 := it._1 + it._2

  })

  io.AlertOutput <> voxel

//  voxel(0).suggestName("hello")
//  io.AlertOutput := 1.U


}

object IntellectualCCTV extends App {
  generating(new IntellectualCCTV(IntellectualCCTVParams(hardfixFrameCoefficient = 5, hardfixSensitivityThreshold = 3)))

}