package chiselExample.servicer

import Chisel.switch
import chisel3._
import chisel3.util._
import chiselExample.ringRouter.{RingNetworkParams, RingNetworkV1}
import runOption.ComplexRunner.generating


class HistogrammerCore() extends Module {

  /**
   *
   *  "-" means data:Int, dataSize
   *
   * ---------------    ^^
   * ---------------    i
   * ---------------    n
   * ---------------    p
   * ---------------    u
   * ---------------    t
   * ---------------    s
   * ---------------    i
   * ---------------    z
   * ---------------    e
   * ---------------    vv
   *   < length >
   * clk flow ->->
   */

  case class CoreParams(inputSize:Int, dataSize:Int=20, length:Int, maximumHistValue:Int=10000){
    def bitSize(value:Int): Int = log2Ceil(value + 1)
  }

  class CoreDataBox(p: CoreParams) extends Bundle {
    val addr: UInt = UInt(p.bitSize(p.length).W)
    val data: UInt = UInt(p.bitSize(p.dataSize).W)
  }

  object CoreIO {
    val basicParams: CoreParams = CoreParams(inputSize = 100, dataSize=20, length = 100, maximumHistValue = 20)
    def apply(coreParams:CoreParams = basicParams) = new CoreIO(coreParams)
  }

  class CoreIO(coreParams:CoreParams) extends Bundle {
    val input: DecoupledIO[Vec[CoreDataBox]] = Flipped(Decoupled(Vec(coreParams.inputSize, new CoreDataBox(coreParams))))
    val output: DecoupledIO[Vec[UInt]] = Decoupled(Vec(coreParams.dataSize, UInt(coreParams.bitSize(coreParams.maximumHistValue).W)))
  }

  val io: CoreIO = IO(CoreIO())
  val processing :: receiving :: transmitting :: idle :: Nil = Enum(4)

  val container: Seq[UInt] = Seq.fill(CoreIO.basicParams.dataSize)(Reg(UInt(CoreIO.basicParams.bitSize(CoreIO.basicParams.maximumHistValue).W)))
  //Vec(CoreIO.basicParams.dataSize, Reg(UInt(CoreIO.basicParams.bitSize(CoreIO.basicParams.maximumHistValue).W))) <= it's illegal

  val inValids = Wire(Vec(CoreIO.basicParams.dataSize, Bool()))
  val chosenOH = PriorityEncoderOH(inValids)

  val state: UInt = RegInit(idle)
  val next_state = WireInit(idle)
  state := next_state
  switch(state) {
    is (processing) {


      next_state := idle
    }
    is (receiving) {
      when(io.input.fire){
        io.input.bits.map{ abits =>
            when(0.U < abits.addr && abits.addr <= 100.U){


              for (i <- 0 until 4){
                 if(i.U == abits.data)
                   container(i) := abits
              }

            }
        }
      }


      next_state := idle
    }
    is (transmitting) {

      next_state := idle
    }
    is (idle) {

      next_state := idle
    }
  }


  io.input.ready := true.B
  io.output.valid := true.B
  for (i <- container.indices)
    io.output.bits(i) := container(i)


}



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




object HistogrammerCore extends App {
  //  generating(new RingRouterV1(RingNetworkParams(2, UInt(5.W)), 0))
  generating(new HistogrammerCore())
}
