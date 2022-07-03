package chiselExample.problems

import Chisel.{Decoupled, log2Ceil}
import chisel3._
import chisel3.internal.firrtl.Width
import chisel3.util.{Cat, Counter, DecoupledIO}
import runOption.ComplexRunner.generating


//960 x 480 x 24bits
//=> 960 x (480 x 24) bits
case class IntellectualCCTVParams(
                                   videoWidth:Int = 960,
                                   videoHeight:Int = 8,
                                   colorDomain:Int = 3,
                                   colorScale:Int = 8/**256bit*/,
                                   hardfixFrameCoefficient:Int = 50,
                                   hardfixL1NormSensitivityThreshold:Int,
                                   hardfixFrameSensitivityThreshold:Int
                                 )
{
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val inputBits: Int = colorDomain*colorScale
  val outputBits: Int = bitSize(videoWidth*videoHeight*colorDomain*colorScale)
}

class IntellectualCCTV(intellectualCCTVParams:IntellectualCCTVParams) extends Module {

  val videoLines:Int = intellectualCCTVParams.videoHeight
  val videoWidth:Int = intellectualCCTVParams.videoWidth
  val lineDataSize: Width = (intellectualCCTVParams.videoWidth * intellectualCCTVParams.inputBits).W


  class VolumeIntegratorBundle extends Bundle {
    val videoInput: Vec[UInt] = Input(Vec(videoLines, UInt(lineDataSize)))
    val getResult: Bool = Input(Bool())
//    val AlertOutput: Vec[UInt] = Output(Vec(vidoeLines, UInt(lineDataSize)))
//    val Output2: DecoupledIO[Vec[UInt]] = Decoupled(Vec(videoFrame, UInt(dataSize)))
    val OutputR: Vec[UInt] = Output(Vec(videoLines, UInt()))
    val OutputG: Vec[UInt] = Output(Vec(videoLines, UInt()))
    val OutputB: Vec[UInt] = Output(Vec(videoLines, UInt()))
//    val OutputGround: Vec[UInt] = Output(Vec(videoLines*videoWidth, UInt()))
  }

  val io: VolumeIntegratorBundle = IO(new VolumeIntegratorBundle())

  case class Pixel(colors:Seq[UInt])
  val videoSeq: Seq[Seq[Pixel]] = Seq.tabulate(intellectualCCTVParams.videoHeight){ heightIndex =>
    val pixelSeq: Seq[Pixel] = Seq.tabulate(intellectualCCTVParams.videoWidth){ widthIndex =>
      val colorSeq: Seq[UInt] = Seq.tabulate(intellectualCCTVParams.colorDomain){ colorOrder =>
        WireInit(
          UInt(
            intellectualCCTVParams.colorScale.W), io.videoInput(heightIndex) >> (intellectualCCTVParams.colorDomain*intellectualCCTVParams.colorScale*widthIndex + intellectualCCTVParams.colorScale*colorOrder)
        ).asUInt
      }
      Pixel(colorSeq)
    }
    pixelSeq
  }

  val voxels: Seq[Seq[Vec[UInt]]] = //domain, widthxlines
    Seq.fill(intellectualCCTVParams.colorDomain)(
      Seq.fill(videoWidth * videoLines)(
        RegInit(VecInit(
          Seq.fill(intellectualCCTVParams.hardfixFrameCoefficient)(
            RegInit(0.U((intellectualCCTVParams.hardfixFrameCoefficient*intellectualCCTVParams.colorScale).W)))
      )))
    )

  val evalCounter: (UInt, Bool) = Counter(true.B, intellectualCCTVParams.hardfixFrameCoefficient)

  voxels.zipWithIndex.foreach{ zipSet => {
    val aColorDomained = zipSet._1
    val idx = zipSet._2
    for (yy <- 0 until videoLines) {
      for (xx <- 0 until videoWidth) {
        aColorDomained(yy*videoWidth + xx)(evalCounter._1) := videoSeq(yy)(xx).colors(idx)
      }
    }
  }}

  val gapShower: Seq[UInt] = Seq.fill(videoLines*videoWidth)(Wire(UInt()))

  voxels.zipWithIndex.foreach{ zipSet =>
    val aColorDomained = zipSet._1
    val idx = zipSet._2
    for (yy <- 0 until videoLines) {
      for (xx <- 0 until videoWidth) {
        val aCummulative = aColorDomained(yy*videoWidth + xx).reduce{ _ +& _ }
        val aCurrent = videoSeq(yy)(xx).colors(idx)
        val comparator = Wire(UInt())
        when(aCummulative > aCurrent) {
          comparator := aCummulative - aCurrent
        }.otherwise{
          comparator := aCurrent - aCummulative
        }
        when(intellectualCCTVParams.hardfixL1NormSensitivityThreshold.U < comparator){
          gapShower(yy*videoWidth + xx) := 1.U
        }.otherwise{
          gapShower(yy*videoWidth + xx) := 0.U
        }
      }
    }
  }

  for (yy <- 0 until videoLines) {
    for (xx <- 0 until videoWidth) {
//      io.OutputGround(yy*videoWidth + xx) := gapShower(yy*videoWidth + xx)
    }
  }




  for (yy <- 0 until videoLines) {
    var containerR = 0.U
    var containerG = 0.U
    var containerB = 0.U
    for (xx <- 0 until videoWidth) {
      containerR = voxels(0)(yy*videoWidth + xx).reduce{ _ +& _ }
      containerG = voxels(1)(yy*videoWidth + xx).reduce{ _ +& _ }
      containerB = voxels(2)(yy*videoWidth + xx).reduce{ _ +& _ }
    }

    io.OutputR(yy) := containerR
    io.OutputG(yy) := containerG
    io.OutputB(yy) := containerB

  }


}

object IntellectualCCTV extends App {
  generating(new IntellectualCCTV(IntellectualCCTVParams(hardfixFrameCoefficient = 5, hardfixL1NormSensitivityThreshold = 20, hardfixFrameSensitivityThreshold = 35)))

}