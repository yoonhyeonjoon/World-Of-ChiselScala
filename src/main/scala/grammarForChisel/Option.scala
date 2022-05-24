package grammarForChisel

import chisel3._

class MaybePair(n: Int, hasY: Boolean) extends Bundle {
  val x = Output(UInt(n.W))
  val y: Option[UInt] = if (hasY) Some(Output(UInt(n.W))) else None
}

class OutMod(n: Int, a: Int, useY: Boolean) extends Module {
  val io = IO(Output(new MaybePair(8, useY)))
  io.x := a.U
  if (useY) //     if (io.y.isDefined)
    io.y.get := a.U
}

object OutMod extends App {

  val ff1 = Seq.fill(4)(0)
  val ff2 = Seq.tabulate(4)(i => i)
  val ff3 = Seq.tabulate(4)(_*2)
  val pp = 1
}

