package chiselExample.practiceNote

import Chisel.Decoupled
import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util.{DeqIO, EnqIO}

class MynewTest extends Module{

//  val io = IO(new Bundle {
//    val in = Flipped(Decoupled(UInt(8.W)))
//    val out = Decoupled(UInt(8.W))
//  })
//

  class IModule extends Bundle{
      val in1 = EnqIO(UInt(5.W))
      val out1 = DeqIO(UInt(5.W))

      val vecT = Input(Vec(15,UInt(20.W)))
      val vecR = Flipped(vecT)

      val in = Flipped(Decoupled(UInt(8.W)))
      val out = Decoupled(UInt(8.W))

  }

  private val io = IO(new IModule())

  io.in <> io.out
  io.in1 <> io.out1
  io.vecT <> io.vecR
//  dontTouch(io.deq)
//  dontTouch(io.deq2)
////  dontTouch(io.enq)
//  dontTouch(io.enq2)

}

object MynewTest extends App {
  (new ChiselStage).emitVerilog(new MynewTest())

}
