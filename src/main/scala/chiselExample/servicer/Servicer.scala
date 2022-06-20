package chiselExample.servicer

import chisel3._


case class CoreParams(width : Int)

class Core(val coreParams: CoreParams) extends Module {

  object Piper {
    def apply() = new Piper()
  }

  class Piper extends Bundle {
    val input: Option[UInt] = Option(Input(UInt(coreParams.width.W)))
    val output: Option[UInt] = Option(Output(UInt(coreParams.width.W)))
  }

  val upDirection: Option[Piper] = Option(Piper())
  val downDirection: Option[Piper] = Option(Piper())
  val leftDirection: Option[Piper] = Option(Piper())
  val rightDirection: Option[Piper] = Option(Piper())

  val processingMode : Bool = Bool()
  val chargingMode : Bool = Bool()
  val coreServicer: UInt = Reg(UInt(10.W))
  val battery: UInt = Reg(UInt(7.W))

  val vu: UInt = if(upDirection.isDefined)    { upDirection.get.input.get}    else{ 0.U }
  val vd: UInt = if(downDirection.isDefined)  { downDirection.get.input.get}  else{ 0.U }
  val vl: UInt = if(leftDirection.isDefined)  { leftDirection.get.input.get}  else{ 0.U }
  val vr: UInt = if(rightDirection.isDefined) { rightDirection.get.input.get} else{ 0.U }

//  val aggregator = WireInit(vu + vd + vl + vr)
//
//  when(processingMode == true.B){
//
//  }.otherwise{
//
//  }
//
//
//  when(chargingMode == true.B)
//  {
//    coreServicer := coreServicer + aggregator
//    when(battery < 100.U){
//      battery := battery + 1.U
//    }.otherwise{
//      chargingMode := false.B
//    }
//  }.otherwise
//  {
//    when(battery <= 3.U)
//    {
//      coreServicer := coreServicer + aggregator
//      chargingMode := true.B
//    }.otherwise
//    {
//      coreServicer := coreServicer + aggregator - 4.U
//      battery := battery - 3.U
//    }
//  }
//
//
//  val coreServicerTransfer: UInt = RegNext(coreServicer)
//
//  if(upDirection.isDefined) {
//    coreServicerTransfer
//  }
//  else
//  {
//
//  }
//
//  if(downDirection.isDefined)  {
//    downDirection.input.get
//  }
//  else{
//    0.U
//  }
//  if(leftDirection.isDefined)  {leftDirection.input.get} else{ 0.U }
//  if(rightDirection.isDefined) {rightDirection.input.get}else{ 0.U }
//


}

