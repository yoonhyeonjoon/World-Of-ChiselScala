package chiselExample.practiceNote

import chisel3._
import chisel3.util.log2Ceil


case class CounterParams5(limit: Int, start: Int = 0) {
  def width = log2Ceil(limit + 1)
}

class MyCounter5(cp: CounterParams5) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val out = Output(UInt(cp.width.W))
  })

  val io2 = IO(new Bundle {
    val en  = Input(Bool())
    val in = Output(UInt(cp.width.W))
  })

  io.out := io2.in

  val count = RegInit(cp.start.U(cp.width.W))
  when (io.en) {
    when (count < cp.limit.U) {
      count := count + 1.U
    } .otherwise {
      count := cp.start.U
    }
  }
  io.out := count
}