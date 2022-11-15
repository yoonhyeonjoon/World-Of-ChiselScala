//package semifiveHomework.sino
//
//import Chisel.log2Ceil
//import chisel3.internal.firrtl.Width
//import chisel3.stage.ChiselStage
//import chisel3.{UInt, _}
////(960 x 480) x 24bits
////=> 960 x (480 x 24) bits
//case class IntellectualCCTVParams(
//                                   videoWidth:Int = 50,
//                                   videoHeight:Int = 50,
//                                   colorDomain:Int = 3,
//                                   colorScale:Int = 8 /**256bit*/,
//                                   hardfixFrameCoefficient:Int =50 ,        // 누적시킬 프레임 수
//                                   hardfixL1NormSensitivityThreshold:Int = 20,  //norm 변화 1,0 판단 척도
//                                   hardfixFrameSensitivityThreshold:Int = 15  //normsen 갯수를 통해 바뀌었는지 1,0
//                                 )
//{
//  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
//  val inputBits: Int = colorDomain*colorScale                               // 3(rgb, 세영역) x 8 (r, g, b  | 각각의 비트)
//  val outputBits: Int = bitSize(videoWidth*videoHeight*colorDomain*colorScale)  // 한프레임의 bitsize
//}
//
//class IntellectualCCTV(intellectualCCTVParams:IntellectualCCTVParams) extends Module {
//
//  val videoLines:Int = intellectualCCTVParams.videoHeight       //50
//  val videoWidth:Int = intellectualCCTVParams.videoWidth      //50
//  val lineDataSize: Width = (intellectualCCTVParams.videoWidth * intellectualCCTVParams.inputBits).W   // row 한줄  50 * 24bits 1200bit
//
//  class VolumeIntegratorBundle extends Bundle {
//    val videoInput: Vec[Vec[UInt]] = Input{Vec(videoLines, Vec(videoWidth,UInt(intellectualCCTVParams.inputBits.W)))} // row 한 줄(24bit)를 vec하여 height만큼  50(세로갯수만큼) (50x 24)을 할당
//    val getResult: Bool = Input(Bool())
//    val AlertOutput: Bool = Output(Bool())
//    val Output2: Vec[Vec[UInt]] = Output{Vec(videoLines, Vec(videoWidth,UInt(intellectualCCTVParams.inputBits.W)))}
//  }
//
//
//  // clk을 위한 counter
//  class MyCounter(maxVal: Int) extends Module {
//    val io = IO(new Bundle {
//      val en  = Input(Bool())
//      val out = Output(UInt())
//    })
//    val count = RegInit(0.U(log2Ceil(maxVal+1).W))
//    when (io.en) {
//      when (count < maxVal.U) {
//        count := count + 1.U
//      } .otherwise {
//        count := 0.U
//      }
//    }
//    io.out := count
//  }
//  val io = IO(new VolumeIntegratorBundle)
//  val count = Module(new MyCounter(intellectualCCTVParams.hardfixFrameCoefficient-1))
//  val countforl1 = Module(new MyCounter(intellectualCCTVParams.hardfixFrameCoefficient)) // videoinput의 마지막 프레임을 얻기위한 counter
//  val frame = Module(new MyCounter(maxVal = 49))
//  val framerow = Module(new MyCounter(maxVal = 49))
//
//
//  // RGB 를 위한 각각 reg
//  val redreg: Vec[Vec[UInt]] = Reg(Vec(intellectualCCTVParams.hardfixFrameCoefficient, Vec(intellectualCCTVParams.videoHeight, UInt(8.W))))
//  /* 30장 x 8bit짜리 50개*/
//  val bluereg: Vec[Vec[UInt]] = Reg(Vec(intellectualCCTVParams.hardfixFrameCoefficient, Vec(intellectualCCTVParams.videoHeight, UInt(8.W))))
//  /* 30장 x 8bit짜리 50개*/
//  val greenreg: Vec[Vec[UInt]] = Reg(Vec(intellectualCCTVParams.hardfixFrameCoefficient, Vec(intellectualCCTVParams.videoHeight, UInt(8.W)))) /* 30장 x 8bit짜리 50개*/
//
//
//
//
//  //reg,green,bule 값만 분리해서 할당 을 50장 반복
//  0 until 50 foreach { index_Height =>
//    0 until 50 foreach { index_Width =>
//      redreg(frame.count)(index_Height.U)(index_Width.U) := io.videoInput(index_Height.U)(index_Width.U)(23, 15)
//      greenreg(frame.count)(index_Height.U)(index_Width.U) := io.videoInput(index_Height.U)(index_Width.U)(15, 8)
//      bluereg(frame.count)(index_Height.U)(index_Width.U) := io.videoInput(index_Height.U)(index_Width.U)(7, 0)
//    }
//  }
//
//
//
//  // 각각의 l1norm을 위한 R,G,B register 값
//  val lred: Vec[Vec[UInt]] = Reg(Vec(intellectualCCTVParams.hardfixFrameCoefficient, Vec(intellectualCCTVParams.videoHeight, UInt(8.W))))
//  val lgreen: Vec[Vec[UInt]] = Reg(Vec(intellectualCCTVParams.hardfixFrameCoefficient, Vec(intellectualCCTVParams.videoHeight, UInt(8.W))))
//  val lblue: Vec[Vec[UInt]] = Reg(Vec(intellectualCCTVParams.hardfixFrameCoefficient, Vec(intellectualCCTVParams.videoHeight, UInt(8.W))))
//
//
//  //마지막 프레임 R,G,B 값 저장
//  0 until 50 foreach { index_Height =>
//    0 until 50 foreach { index_Width =>
//      lred(countforl1.count)(index_Height.U)(index_Width.U) := io.videoInput(index_Height.U)(index_Width.U)(23, 15)
//      lgreen(countforl1.count)(index_Height.U)(index_Width.U) := io.videoInput(index_Height.U)(index_Width.U)(15, 8)
//      lblue(countforl1.count)(index_Height.U)(index_Width.U) := io.videoInput(index_Height.U)(index_Width.U)(7, 0)
//    }
//  }
//
//
//  val alertpixel: UInt = RegInit(0.U)
//  val alert: UInt = RegInit(0.U)
//
//
//  // 24bit 속 8bit 각각의 R,G,B 값의 누적합산 과 그에 대한   // 누적평균계수만큼 linedatasize R값, G값, B값 각각 Average
//
//  val rsumAverage: Vec[Vec[UInt]] = Reg(Vec(intellectualCCTVParams.hardfixFrameCoefficient, Vec(intellectualCCTVParams.videoHeight, UInt(8.W))))
//  val gsumAverage: Vec[Vec[UInt]] = Reg(Vec(intellectualCCTVParams.hardfixFrameCoefficient, Vec(intellectualCCTVParams.videoHeight, UInt(8.W))))
//  val bsumAverage: Vec[Vec[UInt]] = Reg(Vec(intellectualCCTVParams.hardfixFrameCoefficient, Vec(intellectualCCTVParams.videoHeight, UInt(8.W))))
//
//  0 until 50 foreach { index_Height =>
//    0 until 50 foreach { index_Width =>
//      rsumAverage(count.io.out)(index_Height)(index_Width) := (redreg(count.io.out).reduce {
//        _ +& _
//      }) / (intellectualCCTVParams.hardfixFrameCoefficient.U)
//      gsumAverage(count.io.out)(index_Height)(index_Width) := (greenreg(count.io.out).reduce {
//        _ +& _
//      }) / (intellectualCCTVParams.hardfixFrameCoefficient.U)
//      bsumAverage(count.io.out)(index_Height)(index_Width) := (bluereg(count.io.out).reduce {
//        _ +& _
//      }) / (intellectualCCTVParams.hardfixFrameCoefficient.U)
//    }
//  }
//
//
//  val l1: Vec[Vec[UInt]] = Reg(Vec(intellectualCCTVParams.hardfixFrameCoefficient, Vec(intellectualCCTVParams.videoHeight, UInt(8.W))))
//
//  // clk 이 50장을 넘어가면 l1norm 연산
//  when(count.io.out > intellectualCCTVParams.hardfixFrameCoefficient.U + 1.U) {
//    l1 := ((lred(count.io.out) - rsumAverage(count.io.out)).abs + (lgreen - gsumAverage).abs + (lblue - bsumAverage).abs).U
//    ) /(intellectualCCTVParams.colorDomain.U)
//
//
//
//
//
//    // l1 은 비교대상프레임의 |rgb 평균값 - 전 프레임들의 rgb 평균값|
//    when(l1 > intellectualCCTVParams.hardfixL1NormSensitivityThreshold.U) {
//      alertpixel := alertpixel + 1 //normsensitivity를 넘기면 +1 아니면 유지
//
//    }.otherwise {
//      alertpixel := alertpixel
//    }
//
//    alert := alertpixel
//
//
//  }
//
//  when (alert > intellectualCCTVParams.hardfixFrameSensitivityThreshold.U) {
//    when (io.getResult) {
//      io.Output2 := io.videoInput (count.io.out)
//    }
//  }
//
//
//}
//
//
//
//
//
//object test232 extends App {
//  (new ChiselStage).emitVerilog(new IntellectualCCTV(IntellectualCCTVParams()))
//}
