package mouduleTester.exampleModule.modulize.ReusableModulizeExample1

import chisel3._

class Mag extends Bundle {
  val m = UInt(4.W)
}

class OutMod(a: Int) extends Module {
  val io = IO(Output(new Mag))
  io.m := a.U
}
