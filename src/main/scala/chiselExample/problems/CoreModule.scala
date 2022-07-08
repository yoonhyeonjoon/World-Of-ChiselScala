package chiselExample.problems

import Chisel.Decoupled
import chisel3._
import chisel3.tester.{testableClock, testableData}
import chisel3.util.{Cat, DecoupledIO, Enum, is, switch}
import chiseltest.RawTester.test
import runOption.ComplexRunner.generating

import java.awt.image.BufferedImage
import java.io.File
import javax.imageio.ImageIO


/* 0:up / 1:right / 2:down / 3:left */
case class CoreModuleParams(coreId:Int, numberOfLinkers:Int = 4)
class CoreModule(coreModuleParams:CoreModuleParams) extends Module {

  class CoreModuleBundle extends Bundle {
    val intialSetter : Bool = Input(Bool())
    val inFlux: Vec[DecoupledIO[Bool]] = Vec(coreModuleParams.numberOfLinkers, Flipped(Decoupled(Bool())))
    val outFlux: Vec[DecoupledIO[Bool]] = Vec(coreModuleParams.numberOfLinkers, Decoupled(Bool()))
    val outputLooker: Bool = Output(Bool())
  }

  val io: CoreModuleBundle = IO(new CoreModuleBundle())

  val myState:Bool = RegInit(io.intialSetter)

  val neighbors: Seq[Bool] = Seq.fill(coreModuleParams.numberOfLinkers)(Reg(Bool()))
  val calculateMode :: inoutMode :: Nil = Enum(2)
  val state: UInt = RegInit(inoutMode)

  io.inFlux.foreach{ aFlux => aFlux.ready := false.B }
  io.outFlux.foreach{ aFlux =>
    aFlux.valid := false.B
    aFlux.bits := false.B
  }

  switch(state){
    /**연산모드**/
    is(calculateMode) {
      //주변과 수송신 금지
      io.inFlux.foreach{ aFlux =>
        aFlux.ready := false.B
      }
      io.outFlux.foreach{ aFlux =>
        aFlux.valid := false.B
        aFlux.bits := false.B
      }

      //연산
      val neighborSum = neighbors.foldLeft(0.U){ (prev, next) => prev +& next.asUInt }


      when(neighborSum === 0.U){ when(myState === true.B){ myState := false.B }.otherwise{ myState := false.B }}
        .elsewhen(neighborSum === 1.U){ when(myState === true.B){ myState := true.B  }.otherwise{ myState := false.B }}
        .elsewhen(neighborSum === 2.U){ when(myState === true.B){ myState := true.B  }.otherwise{ myState := true.B  }}
        .elsewhen(neighborSum === 3.U){ when(myState === true.B){ myState := true.B  }.otherwise{ myState := false.B }}
        .elsewhen(neighborSum === 4.U){ when(myState === true.B){ myState := false.B }.otherwise{ myState := true.B  }}
        .otherwise{ /*default*/ }

      state := inoutMode
    }

    /**인아웃 모드**/
    is(inoutMode){
      // 주변 state 수신
      io.inFlux.zipWithIndex.foreach{ aFlux =>
        val idx = aFlux._2
        aFlux._1.ready := true.B
        when(aFlux._1.fire){
          neighbors(idx) := aFlux._1.bits
          state := calculateMode //if at least one fire is detected, then mode should be changed to calculateMode
        }
      }
      // 내 state 전송
      io.outFlux.foreach{ aFlux =>
        aFlux.valid := myState
        aFlux.bits := true.B
      }

    }
  }

  io.outputLooker := myState

}

//case class CoreModuleReWorkerParams(coreSqaureNumber:Int=5, numberOfLinkers:Int = 4)
//class CoreReWorkerModule(coreModuleReWorkerParams:CoreModuleReWorkerParams) extends Module {
//
//  /**    5 x 5 model ordering
//   *
//   *             0    1      2    3     4
//   *            ^^   ^^     ^^   ^^    ^^
//   *            ||   ||     ||   ||    ||
//   *       --------------------------------
//   *       -                               -
//   * 19<=  -                               - => 5
//   *       -                               -
//   * 18<=  -                               - => 6
//   *       -                               -
//   * 17<=  -                               - => 7
//   *       -                               -
//   * 16<=  -                               - => 8
//   *       -                               -
//   * 15<=  -                               - => 9
//   *       -                               -
//   *       --------------------------------
//   *           ||   ||    ||    ||   ||
//   *           vv   vv    vv    vv   vv
//   *           14   13    12    11   10
//   */
//
//  class CoreModuleReWorkerBundle extends Bundle {
//    val intialSetters: Vec[Bool] = Input(Vec(coreModuleReWorkerParams.coreSqaureNumber, Bool()))
//    val inFluxes: Vec[DecoupledIO[Bool]] = Vec(coreModuleReWorkerParams.coreSqaureNumber*coreModuleReWorkerParams.numberOfLinkers, Flipped(Decoupled(Bool())))
//    val outFluxes: Vec[DecoupledIO[Bool]] = Vec(coreModuleReWorkerParams.coreSqaureNumber*coreModuleReWorkerParams.numberOfLinkers, Decoupled(Bool()))
//    val outputLookers: Vec[Bool] = Output(Vec(coreModuleReWorkerParams.coreSqaureNumber, Bool()))
//  }
//
//  val io: CoreModuleReWorkerBundle = IO(new CoreModuleReWorkerBundle())
//
//  val reWorker: Seq[CoreModule] = Seq.tabulate(coreModuleReWorkerParams.coreSqaureNumber * coreModuleReWorkerParams.coreSqaureNumber) { id =>
//    Module(new CoreModule(CoreModuleParams(coreId = id)))
//  }
//
//  reWorker.zip(io.intialSetters).foreach{ aZipper => aZipper._2 := aZipper._1.io.intialSetter  }
//
//}


case class NetworkerParams(width:Int=100, height:Int=100)
class NetWorker(networkerParams: NetworkerParams) extends Module {

  class NetWorkerBundle extends Bundle {
    val initialSetterSet : UInt = Input(UInt((networkerParams.width * networkerParams.height).W))
    val frameOutput : UInt = Output(UInt((networkerParams.width * networkerParams.height).W))
  }

  val io: NetWorkerBundle = IO(new NetWorkerBundle())

  val network: Seq[CoreModule] = Seq.tabulate(networkerParams.width * networkerParams.height) { id =>
    Module(new CoreModule(CoreModuleParams(coreId = id)))
  }

  network.zipWithIndex.foreach{ aNet => aNet._1.io.intialSetter := io.initialSetterSet(aNet._2)}

  //  0:up / 1:right / 2:down / 3:left

  for (yy <- 0 until networkerParams.height) {
    //Ring Connection
    // <Left>
    for (xx <- 1 until networkerParams.width) {
      network(yy*networkerParams.width + xx).io.inFlux(3).valid := network(yy*networkerParams.width + xx-1).io.outFlux(1).valid
      network(yy*networkerParams.width + xx).io.inFlux(3).bits := network(yy*networkerParams.width + xx-1).io.outFlux(1).bits
      network(yy*networkerParams.width + xx).io.outFlux(3).ready := network(yy*networkerParams.width + xx-1).io.inFlux(1).ready
    }
    //First - Last Connection
    network(yy*networkerParams.width + 0).io.inFlux(3).valid := network((yy+1)*networkerParams.width - 1).io.outFlux(1).valid
    network(yy*networkerParams.width + 0).io.inFlux(3).bits := network((yy+1)*networkerParams.width - 1).io.outFlux(1).bits
    network(yy*networkerParams.width + 0).io.outFlux(3).ready := network((yy+1)*networkerParams.width - 1).io.inFlux(1).ready

    // <Right>
    for (xx <- 0 until (networkerParams.width - 1)) {
      network(yy*networkerParams.width + xx).io.inFlux(1).valid := network(yy*networkerParams.width + xx+1).io.outFlux(3).valid
      network(yy*networkerParams.width + xx).io.inFlux(1).bits := network(yy*networkerParams.width + xx+1).io.outFlux(3).bits
      network(yy*networkerParams.width + xx).io.outFlux(1).ready := network(yy*networkerParams.width + xx+1).io.inFlux(3).ready
    }
    //Last - First Connection
    network((yy+1)*networkerParams.width - 1).io.inFlux(1).valid := network(yy*networkerParams.width + 0).io.outFlux(3).valid
    network((yy+1)*networkerParams.width - 1).io.inFlux(1).bits := network(yy*networkerParams.width + 0).io.outFlux(3).bits
    network((yy+1)*networkerParams.width - 1).io.outFlux(1).ready := network(yy*networkerParams.width + 0).io.inFlux(3).ready

  }


  for (xx <- 0 until networkerParams.width) {

    // <Up>
    for (yy <- 1 until networkerParams.height) {
      network(yy * networkerParams.width + xx).io.inFlux(0).valid := network((yy-1) * networkerParams.width + xx).io.outFlux(2).valid
      network(yy * networkerParams.width + xx).io.inFlux(0).bits := network((yy-1) * networkerParams.width + xx).io.outFlux(2).bits
      network(yy * networkerParams.width + xx).io.outFlux(0).ready := network((yy-1) * networkerParams.width + xx).io.inFlux(2).ready
    }

    //First-Last Connection
    network(0 * networkerParams.width + xx).io.inFlux(0).valid := network((networkerParams.height-1) * networkerParams.width + xx).io.outFlux(2).valid
    network(0 * networkerParams.width + xx).io.inFlux(0).bits := network((networkerParams.height-1) * networkerParams.width + xx).io.outFlux(2).bits
    network(0 * networkerParams.width + xx).io.outFlux(0).ready := network((networkerParams.height-1) * networkerParams.width + xx).io.inFlux(2).ready

    // <Down>
    for (yy <- 0 until networkerParams.height-1) {
      network(yy * networkerParams.width + xx).io.inFlux(2).valid := network((yy+1) * networkerParams.width + xx).io.outFlux(0).valid
      network(yy * networkerParams.width + xx).io.inFlux(2).bits := network((yy+1) * networkerParams.width + xx).io.outFlux(0).bits
      network(yy * networkerParams.width + xx).io.outFlux(2).ready := network((yy+1) * networkerParams.width + xx).io.inFlux(0).ready
    }

    //Last-First Connection
    network((networkerParams.height - 1) * networkerParams.width + xx).io.inFlux(2).valid  := network((0) * networkerParams.width + xx).io.outFlux(0).valid
    network((networkerParams.height - 1) * networkerParams.width + xx).io.inFlux(2).bits   := network((0) * networkerParams.width + xx).io.outFlux(0).bits
    network((networkerParams.height - 1) * networkerParams.width + xx).io.outFlux(2).ready := network((0) * networkerParams.width + xx).io.inFlux(0).ready
  }

  val aTarget: UInt = WireInit(network.head.io.outputLooker.asUInt)
  val networkFrame: UInt = network.zipWithIndex.foldLeft(aTarget){ (previous, target) =>
    if(target._2 != 0) {
      Cat(previous, target._1.io.outputLooker.asUInt)
    }
    else{
      previous
    }
  }

  io.frameOutput := networkFrame

}


object PaddingZero {
  def padLeftZeros(inputString: String, length: Int): String = {
    import scala.collection.mutable
    if (inputString.length >= length) return inputString
    val sb: mutable.StringBuilder = new mutable.StringBuilder
    while ( {
      sb.length < length - inputString.length
    }) sb.append('0')
    sb.append(inputString)
    sb.toString
  }
}


object CoreModule extends App{


  /**Mode for Coore Unit**/
  def temporExtractor(uintStr : Any): String ={
    val get = uintStr.toString.split('(')(1).split(')')(0)
    if(get == "0") "calculateMode"
    else "inoutMode"
  }
  //  generating(new CoreModule(CoreModuleParams(0)))
    generating(new NetWorker(NetworkerParams()))

  def getBinary(idx:Int, input:String): Unit = {
    val width = 100
    val height = 100
    val output = new BufferedImage(width, height, BufferedImage.TYPE_BYTE_BINARY)

    val filtered = input.split('(')(1).split(')')(0)
    val binaried = BigInt.apply(filtered).toString(2)
    val padded = PaddingZero.padLeftZeros(binaried, 100*100)
//    println(padded)
    for (idx <- 0 until padded.length)
    {
      val idxWidth = width - (idx % width) - 1
      val idxHeight = height - (idx / width) - 1
      output.setRGB(idxWidth, idxHeight, if(padded(idx) == '1') 0 else (255*255*255*255) & 0xffffff)
    }

    //Error가 난다면, 아래 imgSet/ .. 의 경로를 최상위 패키지에 생성하거나 imgSet를 빼시면됩니다.
    ImageIO.write(output, "jpg", new File(s"imgSet/test${idx}.jpg"))
  }



//  test(new NetWorker(NetworkerParams())){ c =>
//    c.io.initialSetterSet.poke("b0110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111000011111111000000000000000000000000000000000000000000000000000000000000000000000000000000001111000000000000000111110000000000000000000000000000000000000000001111111100000000000000000000000011100000000000000000000001110000000000000000000000000000000000000001100000011000000000000000000001111000000000000000000000000000111000000000000000001100000000000000011100000000110000000000000001111000000000000000000000000000000000111100000000000111111100000000000011000000000001100000000000111100000000000000000000000000000000000000011100000000110000011000000000011000000000000011000011111110000000000000000000000000000000000000000000011100001110000000110000000001000000000000000111111000000000000000000000000000000000000000000000000000011101100000000001000000000100000000000000011110000000000000000000000000000000000000000000000000000000011000000000000100000000010000000000111111100111111000000000000000000000000000000000000000000000000000111000000000010000000001000000001110000000000000000000000000000000000000000000000000000000000000000000110000000001000000000100000001100000000000000000000000000000000000000000000000000000000000000000000001100000000100000000010000011100000000000000000000000000000000000000000000000000000000000000000000000010000000110000000001000011000000000000000000000000000000000000000000000000000000000000000000000000000100000010000000000100011000000000000000000000000000000000000000000000000000000000000000000000000000011000001000000000010001000000000000000000000000000000000000000000000000000000000000000000000000000000100000100000000001101100000000000000000000000000000000000000000000001111000000000000000000000000000011000110000000000011100000000000000000000000000000000000000000000001100100000000000000000000000000000110110000000000001100000000000000000000000000000000000000000000001100011000000000000000000000000000001110000000000000110000000000000000011000000000000000000000000001100000110000000000000000000000000000110000000000000110000000000000000011110000000000000000000000001100000000110000000000000000000000000001000000000000010000000000000000011001000000000000000000000001100000000001100000000000000000000000000110000000000001000000000000000011000110000000000000000000000100000000000011000000000000000000000000001000000000001100000000000000011000001000000000000000000000110000000000000110000000000000000000000000100000000000100000000000000011000000110000000000000000000110000000000000001100000000000000000000000011000000000010000000000000011000000001100000000000000000110000000000000000011000000000000000000000000100000000011000000000000001000000000010000000000000000010000000000000000000110000000000000000000000010000000001000000000000001100000000001100000000000000011000000000000000000001000000000000000000000001000000000100000000000000100000000000011000000000000011000000000000000000000110000000000000000000000100000000010000000000000110000000000000110000000000001000000000000000000000001100000000000000000000011000000001000000000000110000000000000001000000000001100000000000000000000000010000000000000000000000100000001100000000000010000000000000000110000000000100000000000000000000000001100000000000000000000010000000100000000000011000000000000000001100000000110000000000000000000000000011000000000000000000001000000010000000000001000000000000000000000000000010000000000000000000000000000100000000000000000000100000001000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000010000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000001000000000000000000000000000000000001010000000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000001111100000000000000000000000000000000000000000000000000001000000010000000000000000000000000000000000101110000000000000000000000000000000000000000000000000000100000001000000000000000000000000000000000110001100000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000010000010000000000000000000000000000000000000000000000000011000000010000000000000000000000000000000011000001000000000000000000000000000000000000000000000000001000000001100000000000000000000000000000011000000010000000000000000000000000000000000000000000000000100000000010000000000000000000000000000001000000001000000000000000000000000000000000000000000000000010000000001000000000000000000000000000001100000000110000000000000000000000000000000000000000000000001000000000100000000000000000000000000000111111111111000000000000000000000000000000000000000000000001000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000110000000000000000000000011111111111111111111111110000000000000000000000000000000001100000000000000001000000000000000011111111000000000000000000000001111110000000000000000000000000000100000000000000000110000000001111111000000000000000000000000000000000001111000000000000000000000000110000000000000000001000000000110000000000000000000000000000000000000000000011000000000000000000000010000000000000000000110000000001100000000000000000000000000000000000000000000110000000000000000000011000000000000000000001000000000011000000000000000000000000000000000000000000001101000000000000000001000000000000000000000110000000000110000000000000000000000000000000000000000000011100000000000000001100000000000000000000001000000000001100000000000000000000000000000000000000000000100000000000000000100000000000000000000000110000000000011000000000000000000000000000000000000000000110000000000000000010000000000000000000000001000000000000110000000000000000000000000000000000000000110000000000000000011000000000000000000000000110000000000001100000000000000000000000000000000000000110000000000000000011000000000000000000000000001100000000000011100000000000000000000000000000000001110000000000000000001000000000000000000000000000011000000000000011110000000000000000000000000000011100000000000000000001100000000000000000000000000000100000000000000001110000000000000000000000000111000000000000000000001100000000000000000000000000000001000000000000000001111111100000000001111111100000000000000000000001100000000000000000000000000000000110000000000000000000000011111111111100000000000000000000000000001100000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000011100000000000000000000000000000000000000000000000011110000000000000000000000000000000000000000001111000000000000000000000000000000000000000000000000000001110000000000000000000000000000000000000011100000000000000000000000000000000000000000000000000000000001111100000000000000000000000000000001111000000000000000000000000000000000000000000000000000000000000000011111000000000000000000000000111100000000000000000000000000000000000000000000000000000000000000000000000111111000000000000000011110000000000000000000000000000000000000000000000000000000000000000000000000000000111111100000001111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000".U)
//    c.reset.poke(true.B)
//    c.clock.step()
//    c.clock.step()
//    c.reset.poke(false.B)
//    c.clock.step()
//    (1 to 999).foreach{idx =>
//      println(s"processed : ${idx}")
//      getBinary(idx, c.io.frameOutput.peek().toString())
//      c.clock.step()
//    }
//  }


  //  test(new CoreModule(CoreModuleParams(0))){ c =>
  //
  //
  //    println("OutputPicker State 1 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
  //    c.io.intialSetter.poke(true.B)
  //    c.reset.poke(true.B)
  //
  //
  //    c.clock.step()
  //    println("OutputPicker State 2 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
  //    c.reset.poke(false.B)
  //
  //    c.io.inFlux(0).valid.poke(true.B)
  //    c.io.inFlux(0).bits.poke(true.B)
  //
  //    c.io.inFlux(1).valid.poke(true.B)
  //    c.io.inFlux(1).bits.poke(true.B)
  //
  //    c.io.inFlux(2).valid.poke(true.B)
  //    c.io.inFlux(2).bits.poke(true.B)
  //
  //    c.io.inFlux(3).valid.poke(true.B)
  //    c.io.inFlux(3).bits.poke(true.B)
  //
  //    c.clock.step()
  //    println("OutputPicker State 3 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
  //
  //
  //    c.clock.step()
  //    println("OutputPicker State 4 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
  //
  //    c.io.inFlux(0).valid.poke(false.B)
  //    c.io.inFlux(0).bits.poke(true.B)
  //
  //    c.io.inFlux(1).valid.poke(true.B)
  //    c.io.inFlux(1).bits.poke(true.B)
  //
  //    c.io.inFlux(2).valid.poke(false.B)
  //    c.io.inFlux(2).bits.poke(true.B)
  //
  //    c.io.inFlux(3).valid.poke(false.B)
  //    c.io.inFlux(3).bits.poke(true.B)
  //
  //    c.clock.step()
  //    println("OutputPicker State 5 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
  //
  //    c.io.inFlux(0).valid.poke(false.B)
  //    c.io.inFlux(0).bits.poke(true.B)
  //
  //    c.io.inFlux(1).valid.poke(false.B)
  //    c.io.inFlux(1).bits.poke(true.B)
  //
  //    c.io.inFlux(2).valid.poke(false.B)
  //    c.io.inFlux(2).bits.poke(true.B)
  //
  //    c.io.inFlux(3).valid.poke(false.B)
  //    c.io.inFlux(3).bits.poke(true.B)
  //
  //    c.clock.step()
  //    println("OutputPicker State 6 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
  //
  //    c.clock.step()
  //    println("OutputPicker State 7 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
  //
  //    c.clock.step()
  //
  //  }
}

