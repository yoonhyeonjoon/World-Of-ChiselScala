package functional.delayer

import chisel3._

class GripperInDelayNCycles[T <: Data](data:T, cycle:Int) extends Module {

  class DelayNCyclesBundle() extends Bundle {
    val in: T = Input(data)
    val out: Vec[T] = Output(Vec(cycle, data))
  }

  val delayedBundle: DelayNCyclesBundle = new DelayNCyclesBundle
  val io:DelayNCyclesBundle = IO(delayedBundle)
  var lastConn:T = io.in
  for (i <- 0 until cycle) {
    io.out(i) := lastConn
    lastConn = RegNext(lastConn)
  }

}