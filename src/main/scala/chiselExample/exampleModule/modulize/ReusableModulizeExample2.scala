package chiselExample.exampleModule.modulize.ReusableModulizeExample2

import chisel3._

class Mag extends Bundle {
  val m: UInt = Output(UInt(4.W))
}

class SignMag extends Mag {
  val s: Bool = Output(Bool())
}

class PairSignMag extends Bundle {
  val nums: Vec[SignMag] = Vec(2, new SignMag)
}

class OutMod(a: Int, b: Int) extends Module {
  val io: PairSignMag = IO(new PairSignMag)
  io.nums(0).m := a.U
  io.nums(0).s := false.B
  io.nums(1).m := b.U
  io.nums(1).s := false.B
}

object ReusableModulizeExample2 extends App {


}