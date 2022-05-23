package chiselExample.queue.agilehwQueue

import chisel3._
import chisel3.util.Decoupled

class QueueIO(bitWidth: Int) extends Bundle {
  val enq = Flipped(Decoupled(UInt(bitWidth.W)))
  val deq = Decoupled(UInt(bitWidth.W))
}