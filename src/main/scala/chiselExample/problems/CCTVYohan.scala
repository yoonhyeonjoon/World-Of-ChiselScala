package chiselExample.problems.yohan

import chisel3._
import chisel3.experimental._
import chisel3.internal.firrtl.Width
import chisel3.stage.ChiselStage
import chisel3.util._
import chisel3.util._
import chisel3._
import chisel3.internal.firrtl.Width
import chisel3.stage.ChiselStage
import chisel3.tester.{testableClock, testableData}
import chiselExample.problems.{IntellectualCCTVReal, IntellectualCCTVRealParams}
import chiselExample.problems.IntellectualCCTVRealUsage.{frames, iterator, numIterator, videoHeight}
import chiselExample.problems.imageProcesser.ImageLoader
import chiseltest.RawTester.test

import java.awt.Color
import java.awt.image.BufferedImage
import java.io.File
import javax.imageio.ImageIO
import scala.collection.mutable
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration
import scala.concurrent.{Await, Future}
import scala.reflect.io
import scala.util.Random


//(960 x 480) x 24bits
//=> 960 x (480 x 24) bits
case class IntellectualCCTVParams(
                                   videoWidth:Int = 8,
                                   videoHeight:Int = 4,
                                   colorDomain:Int = 3,
                                   colorScale:Int = 8 /**256bit*/,
                                   hardfixFrameCoefficient:Int = 2,
                                   hardfixL1NormSensitivityThreshold:Int = 20,
                                   hardfixFrameSensitivityThreshold:Int = 15
                                 )
{
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val oneFrame: Int = videoWidth*videoHeight
  val oneFrameColor: Int = oneFrame*colorDomain
  val pixel: Int = colorDomain*colorScale
  val inputBit : Int = pixel + 1
  val outputBit : Int = pixel + 1
  val getTime: Int = 50
}

class IntellectualCCTV(intellectualCCTVParams:IntellectualCCTVParams) extends Module {

  class VolumeIntegratorBundle extends Bundle {
    val videoInput: UInt = Input((UInt(intellectualCCTVParams.inputBit.W)))
    val getResult: Bool = Input(Bool())
    val AlertOutput: Bool = Output(Bool())
    val Output2: UInt = Output(UInt(intellectualCCTVParams.outputBit.W))
  }
  val io: VolumeIntegratorBundle = IO(new VolumeIntegratorBundle())

  //////////////////////////////////////////////////////////////////////// fsm Code

  object StateGet extends ChiselEnum {
    val sIdle, sGet = Value
  }
  val stateGet: StateGet.Type = RegInit(StateGet.sIdle)
  val counterGet: Counter = Counter(intellectualCCTVParams.getTime)
  switch(stateGet){
    is(StateGet.sIdle){
      counterGet.reset()
      io.AlertOutput := false.B
    }
    is(StateGet.sGet){
      counterGet.inc()
      io.AlertOutput := true.B
      when(counterGet.value === (intellectualCCTVParams.getTime-1).U){
        stateGet := StateGet.sIdle
      }
    }
  }

  object State extends ChiselEnum {
    val sIdle, sReset, sResult ,sAction, sDiff, sCharge, sRead = Value
  }
  val state: State.Type = RegInit(State.sIdle)

  val chargeIn = WireInit(false.B)
  val diffThreshold = WireInit(false.B)
  val actionWriteMem = WireInit(false.B)
  val resultCountMem = WireInit(false.B)

  switch(state){
    is(State.sIdle){
      when( io.videoInput === "h1_fff_fff_fff".U & chargeIn === false.B ){
        state := State.sCharge
      }.elsewhen(io.videoInput === "h1_fff_fff_fff".U){
        state := State.sRead
      }.elsewhen(io.getResult === true.B){
        state := State.sResult
      }
    }
    is(State.sCharge){
      when(io.videoInput === "h1_000_000_000".U){
        state := State.sIdle
      }
    }
    is(State.sRead){
      when(io.videoInput === "h1_000_000_000".U){
        state := State.sDiff
      }
    }
    is(State.sDiff){
      when(diffThreshold === true.B ) {
        state := State.sAction
      }.otherwise{
        state := State.sIdle
      }
    }
    is(State.sAction){
      when(actionWriteMem === true.B){
        state := State.sIdle
      }
    }
    is(State.sResult){
      when(resultCountMem === true.B){
        state := State.sReset
      }
    }
    is(State.sReset){
      state := State.sIdle
    }
  }

  //////////////////////////////////////////////////////////////////////// action Code
  //////////////////////////////////////////////////////////////////////// action Code

  val baseCount: Counter = Counter(intellectualCCTVParams.oneFrame)
  val baseCountMem: Counter = Counter(intellectualCCTVParams.oneFrame)

  ////////////////////////////////////////////////////////  base Reg
  val inVideoPixel: UInt = io.videoInput(intellectualCCTVParams.pixel-1 , 0)
  val basePixel: Vec[UInt] = RegInit(VecInit(
    Seq.fill(intellectualCCTVParams.oneFrame*intellectualCCTVParams.hardfixFrameCoefficient)(0.U(intellectualCCTVParams.pixel.W))))
  val regEnable: Vec[Bool] = VecInit( Seq.fill(intellectualCCTVParams.oneFrame)(false.B))

  println(basePixel)



  regEnable.zipWithIndex.foreach({ case( value, index) =>
    when(value === true.B){
      basePixel(index) := inVideoPixel
      for(i <- 0 until  intellectualCCTVParams.hardfixFrameCoefficient){
        basePixel(i+1+index) := basePixel(i+index)
      }
    }
  })

  val sumReg: Seq[UInt] = VecInit(Seq.fill(intellectualCCTVParams.oneFrameColor)( 0.U((intellectualCCTVParams.colorScale).W)))
  println(sumReg)
  for( i <- 0 until intellectualCCTVParams.oneFrame){
    val nowReg: Seq[UInt] = (0 until intellectualCCTVParams.hardfixFrameCoefficient).map({ x =>
      basePixel(i+x*intellectualCCTVParams.oneFrame)
    })
    for (ii <- 0 until intellectualCCTVParams.colorDomain){
      sumReg(i*intellectualCCTVParams.colorDomain + ii) := nowReg.map({ value =>
        value((ii+1)*intellectualCCTVParams.colorScale - 1, ii*intellectualCCTVParams.colorScale)
      }).reduce(_+&_)/intellectualCCTVParams.hardfixFrameCoefficient.U
    }
  }

  ////////////////////////////////////////////////////////  Charge Reg
  when(basePixel.last =/= 0.U){
    chargeIn := true.B
  }

  ////////////////////////////////////////////////////////  Diff Reg
  val diffReg: Vec[UInt] = RegInit(VecInit(Seq.fill(intellectualCCTVParams.oneFrame)(0.U(1.W))))
  val diffValue: Vec[UInt] = VecInit(Seq.fill(intellectualCCTVParams.colorDomain)( 0.U((intellectualCCTVParams.colorScale).W )))
  //  val diffValue = WireInit(0.U((intellectualCCTVParams.pixel+intellectualCCTVParams.colorDomain).W))
  val absDiffValue: Vec[UInt] = VecInit(Seq.fill(intellectualCCTVParams.colorDomain)( 0.U((intellectualCCTVParams.colorScale).W)))

  val tmpSumReg: Vec[UInt] = VecInit(Seq.fill(intellectualCCTVParams.colorDomain)(0.U(intellectualCCTVParams.colorScale.W)))
  val now_av: UInt = MuxLookup(baseCount.value, 0.U, (0 until intellectualCCTVParams.oneFrame).map({ x =>
    ( 0 until intellectualCCTVParams.colorDomain).foreach({ xx =>
      tmpSumReg(xx) := (sumReg(x*intellectualCCTVParams.colorDomain + xx) << intellectualCCTVParams.colorScale)
    })
    (x.U, Cat(tmpSumReg) )
  }))

  ////////////////////////////////////////////////////////  Mem
  val memAll: SyncReadMem[UInt] = SyncReadMem(intellectualCCTVParams.oneFrame*1000, UInt(intellectualCCTVParams.oneFrame.W))
  val memNow: Counter = Counter(1000)
  val memRead: Counter = Counter(1000)

  (0 until intellectualCCTVParams.colorDomain).foreach({ x =>
    val indexHead = (x+1)*intellectualCCTVParams.colorScale-1
    val indexLast = x*intellectualCCTVParams.colorScale
    diffValue(x) := inVideoPixel(indexHead, indexLast) - now_av(indexHead, indexLast) // (indexHead, indexLast)
    when(diffValue.head === 1.U){
      absDiffValue(x) := ~diffValue(x)
    }
  })

  io.Output2 := 0.U
  io.AlertOutput := false.B

  switch(state){
    is(State.sIdle){
      baseCount.reset()
      baseCountMem.reset()
      memRead.reset()
    }
    is(State.sCharge){
      baseCount.inc()
      regEnable.zipWithIndex.foreach({ case( value, index) =>
        when(index.U(intellectualCCTVParams.oneFrame.W) === baseCount.value){
          value := true.B
        }.otherwise{
          value := false.B
        }
      })
    }
    is(State.sRead){
      baseCount.inc()
      regEnable.zipWithIndex.foreach({ case( value, index) =>
        when(index.U(intellectualCCTVParams.oneFrame.W) === baseCount.value){
          value := true.B
        }.otherwise{
          value := false.B
        }
      })
      (0 until intellectualCCTVParams.oneFrame).foreach({ x =>
        diffReg(x) := 0.U
        when(x.U === baseCount.value){
          when(absDiffValue.reduce(_+&_) >= intellectualCCTVParams.hardfixFrameSensitivityThreshold.U ){
            diffReg(x) := 1.U
          }
        }
      })
    }
    is(State.sDiff){
      diffThreshold := false.B
      when( diffReg.reduce(_+&_) > intellectualCCTVParams.hardfixL1NormSensitivityThreshold.U ){
        diffThreshold := true.B
        stateGet := StateGet.sGet
        memNow.inc()
      }
    }
    is(State.sAction){
      baseCountMem.inc()
      actionWriteMem := false.B
      when( baseCountMem.value === intellectualCCTVParams.oneFrame.U){
        actionWriteMem := true.B
      }

      val now_Reg = MuxLookup(baseCountMem.value, 0.U, basePixel.zipWithIndex.map({ case( value, index) =>
        (index.U, value)
      }))

      memAll.write(baseCountMem.value, now_Reg + (memNow.value-1.U)*intellectualCCTVParams.oneFrame.U)
    }
    is(State.sResult){
      memRead.inc()
      io.Output2 := memAll.read(memRead.value)
      when(memRead.value === memNow.value*intellectualCCTVParams.oneFrame.U){
        resultCountMem := true.B
      }
    }
  }

}




object yohan_IntellectualCCTV extends App {

  //  generating(new IntellectualCCTV(IntellectualCCTVParams(hardfixFrameCoefficient = 5, hardfixL1NormSensitivityThreshold = 20, hardfixFrameSensitivityThreshold = 35)))

  val getResult: Bool = Input(Bool())

  // 주의!! 해당 테스트 예제는 colorDomain = 3(R,G,B), scale 8bits에 hardfix 되어있습니다
  val colorDomain:Int = 3
  val colorScale:Int = 8

  /***Image Load***/
  var frames : Array[Seq[Seq[mutable.Buffer[Int]]]] = Array()
  var videoHeight:Int = 25
  var videoWidth:Int = 25

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


  test(new IntellectualCCTVReal(IntellectualCCTVRealParams(
    videoHeight = videoHeight,
    videoWidth = videoWidth,
    hardfixFrameCoefficient = 5,
    hardfixL1NormSensitivityThreshold = 20,
    hardfixFrameSensitivityThreshold = 35)
  )) { c =>

    c.io.getResult.poke(false.B)

    //Image Waves..
    val setPacketBlockSize = 1 //size가 1이면 (1 + 24)bit, 2이면 (1 + 24*2)bit이 전송됨
    frames.foreach{ aFrame =>

      //simulated recess timing, noise
      for(p <- 0 until 5 + Random.nextInt(10)) { //5 ~ 15 random blank
        val noiseSignal = ("b" + numIterator(1+(setPacketBlockSize*24) ,2))
        c.io.videoInput.poke(noiseSignal.U)
        c.clock.step()
      }

      //Start Signal
      val startSignal = "b" + "1" + iterator(24*setPacketBlockSize,"1")
      c.io.videoInput.poke(startSignal.U)
      c.clock.step()

      var aCompress = "b1"
      var counter = 0
      for (aPacket <- 0 until videoHeight*videoWidth) {
        counter = counter + 1
        val xx = aPacket % videoWidth
        val yy = aPacket / videoWidth

        aCompress += "%08d".format(aFrame.head(yy)(xx).toBinaryString.toInt) /*+ getZero(num = 24*xx)   */  //R
        aCompress += "%08d".format(aFrame(1)(yy)(xx).toBinaryString.toInt)   /*+ getZero(num = 8+24*xx) */  //G
        aCompress += "%08d".format(aFrame(2)(yy)(xx).toBinaryString.toInt)   /*+ getZero(num = 16+24*xx)*/  //B

        if(counter % setPacketBlockSize == 0) {
          counter = 0 //side-effect init
          c.io.videoInput.poke(aCompress.U)
          c.clock.step()
          aCompress = "b1" //It should be ordered at last in this block(procedure style)
        }

      }

      //Start Signal
      val endSignal = "b" + "1" + iterator(24*setPacketBlockSize,"0")
      c.io.videoInput.poke(endSignal.U)
      c.clock.step()

    }

  }

}