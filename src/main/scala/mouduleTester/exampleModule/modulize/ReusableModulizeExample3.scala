package mouduleTester.exampleModule.modulize.ReusableModulizeExample3
import chisel3._

class SignMag(n: Int) extends Bundle {
  val x: UInt = Output(UInt(n.W))
  val s: Bool = Output(Bool())
  // No longer necessary
  // override def cloneType = (new SignMag(n)).asInstanceOf[this.type]
}

class OutMod(n: Int, a: Int) extends Module {
  val io: SignMag = IO(Output(new SignMag(8)))
  io.x := a.U
  io.s := false.B
}

