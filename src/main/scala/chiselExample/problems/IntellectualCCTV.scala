package chiselExample.problems

import Chisel.log2Ceil
import chisel3._
import chisel3.internal.firrtl.Width
import chisel3.tester.{testableClock, testableData}
import chisel3.util.Counter
import chiselExample.problems.imageProcesser.ImageLoader
import chiseltest.RawTester.test
import runOption.ComplexRunner.generating

import scala.collection.mutable
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{Await, Future}

//(960 x 480) x 24bits
//=> 960 x (480 x 24) bits
case class IntellectualCCTVParams(
                                   videoWidth:Int = 5,
                                   videoHeight:Int = 5,
                                   colorDomain:Int = 3,
                                   colorScale:Int = 8 /**256bit*/,
                                   hardfixFrameCoefficient:Int = 50,
                                   hardfixL1NormSensitivityThreshold:Int = 20,
                                   hardfixFrameSensitivityThreshold:Int = 15
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
    val AlertOutput: Bool = Output(Bool())
//    val Output2: Vec[UInt] = Output(Vec(videoLines, UInt(lineDataSize)))
    val OutputGround: Vec[UInt] = Output(Vec(videoLines*videoWidth, UInt()))
  }

  val io: VolumeIntegratorBundle = IO(new VolumeIntegratorBundle())

  val regs = Mem(10000, UInt(intellectualCCTVParams.outputBits.W))

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
    Seq.fill(videoWidth * videoLines)(
      Seq.fill(intellectualCCTVParams.colorDomain)(
        RegInit(VecInit(
          Seq.fill(intellectualCCTVParams.hardfixFrameCoefficient)(
            RegInit(0.U((intellectualCCTVParams.hardfixFrameCoefficient*intellectualCCTVParams.colorScale).W)))
      )))
    )

  val evalCounter: (UInt, Bool) = Counter(true.B, intellectualCCTVParams.hardfixFrameCoefficient)

  for (yy <- 0 until videoLines) {
    for (xx <- 0 until videoWidth) {
      voxels(yy*videoWidth + xx).zipWithIndex.foreach{ aPixelSet =>
        aPixelSet._1(evalCounter._1) := videoSeq(yy)(xx).colors(aPixelSet._2)
      }
    }
  }

  val gapShower: Seq[UInt] = Seq.fill(videoLines*videoWidth)(Wire(UInt()))

  for (yy <- 0 until videoLines) {
    for (xx <- 0 until videoWidth) {

      val comparator = Seq.fill(intellectualCCTVParams.colorDomain)(Wire(UInt()))

      voxels(yy*videoWidth + xx).zipWithIndex.foreach{ aPixelSet =>
          val aPixelColorDomained = aPixelSet._1
          val idx = aPixelSet._2

          val aCummulative = aPixelColorDomained.reduce{ _ +& _ }
          val aCurrent = videoSeq(yy)(xx).colors(idx)

          when(aCummulative > aCurrent)
          {
            comparator(idx) := aCummulative - aCurrent
          }
          .otherwise
          {
            comparator(idx) := aCurrent - aCummulative
          }

        }

        val l1Norm = comparator.reduce{ _ +& _ }

        when(intellectualCCTVParams.hardfixL1NormSensitivityThreshold.U < l1Norm){
          gapShower(yy*videoWidth + xx) := 1.U
        }.otherwise{
          gapShower(yy*videoWidth + xx) := 0.U
        }

      val frameSensitivity = gapShower.reduce{ _ +& _ }

      when(intellectualCCTVParams.hardfixFrameSensitivityThreshold.U < frameSensitivity){
        io.AlertOutput := true.B
      }.otherwise{
        io.AlertOutput := false.B
      }

      when(io.AlertOutput === true.B){

      }
    }
  }

  for (yy <- 0 until videoLines) {
    for (xx <- 0 until videoWidth) {
      io.OutputGround(yy*videoWidth + xx) := gapShower(yy*videoWidth + xx)
      printf("current(%d,%d) = %d \n", xx.U, yy.U, gapShower(yy*videoWidth + xx))
    }
  }

}



object IntellectualCCTV extends App {

//  generating(new IntellectualCCTV(IntellectualCCTVParams(hardfixFrameCoefficient = 5, hardfixL1NormSensitivityThreshold = 20, hardfixFrameSensitivityThreshold = 35)))

  val getResult: Bool = Input(Bool())

  // 주의!! 해당 테스트 예제는 colorDomain = 3(R,G,B), scale 8bits에 hardfix 되어있습니다
  val colorDomain:Int = 3
  val colorScale:Int = 8

  /***Image Load***/
  var frames : Array[Seq[Seq[mutable.Buffer[Int]]]] = Array()
  var videoHeight:Int = 0
  var videoWidth:Int = 0

  val aFuturable = Future {
    new ImageLoader().loadImages(
      folderPath = "src/main/scala/chiselExample/problems/imageProcesser/imageSet",
      scaleFactor = 2,
      response = { (getInfo, response) =>
        frames = response.map(_._2)
        videoHeight = getInfo._1
        videoWidth = getInfo._2
      })
  }

  Await.result(aFuturable, Duration.Inf)
  /***Image Load Complete***/


    test(new IntellectualCCTV(IntellectualCCTVParams(
      videoHeight = videoHeight,
      videoWidth = videoWidth,
      hardfixFrameCoefficient = 5,
      hardfixL1NormSensitivityThreshold = 20,
      hardfixFrameSensitivityThreshold = 35)
    )) { c =>

      c.io.getResult.poke(false.B)

      frames.foreach{ aFrame =>

        for (yy <- 0 until videoHeight) {
          var aCompress = "b"
          for (xx <- 0 until videoWidth) {
            aCompress += "%08d".format(aFrame.head(yy)(xx).toBinaryString.toInt) /*+ getZero(num = 24*xx)   */  //R
            aCompress += "%08d".format(aFrame(1)(yy)(xx).toBinaryString.toInt)   /*+ getZero(num = 8+24*xx) */  //G
            aCompress += "%08d".format(aFrame(2)(yy)(xx).toBinaryString.toInt)   /*+ getZero(num = 16+24*xx)*/  //B
          }
//          c.io.videoInput(yy).poke(aCompress.U)
        }
        c.clock.step()

      }

    }

}

