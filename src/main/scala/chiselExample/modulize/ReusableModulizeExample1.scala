package chiselExample.modulize

import chisel3._

class Mag1 extends Bundle {
  val m = UInt(4.W)
}

class OutMod1(a: Int) extends Module {
  val io = IO(Output(new Mag1))
  io.m := a.U
}
