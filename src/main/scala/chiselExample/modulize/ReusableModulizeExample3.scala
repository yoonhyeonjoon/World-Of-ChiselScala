package chiselExample.modulize

import chisel3._

class SignMag3(n: Int) extends Bundle {
  val x: UInt = Output(UInt(n.W))
  val s: Bool = Output(Bool())
  // No longer necessary
  // override def cloneType = (new SignMag(n)).asInstanceOf[this.type]
}

class OutMod3(n: Int, a: Int) extends Module {
  val io: SignMag3 = IO(Output(new SignMag3(8)))
  io.x := a.U
  io.s := false.B
}

