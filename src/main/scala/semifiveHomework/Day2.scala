import chisel3._
import chisel3.util._
import chisel3.tester._
import chisel3.tester.RawTester.test

class Cal(n: Int) extends Module {
  val io = IO(new Bundle{
      val mode = Input(UInt(2.W))
      val a = Input(SInt(n.W))
      val b = Input(SInt(n.W))
      val c = Output(SInt(n.W))
  })
  io.c := 0.S
  when (io.mode === 0.U) {io.c := io.a + io.b}
  .elsewhen(io.mode === 1.U) {io.c := io.a - io.b}
  .elsewhen(io.mode === 2.U) {io.c := io.a * io.b}
  .elsewhen(io.mode === 3.U) {io.c := io.a / io.b}
}

object Test extends App{
  println(getVerilogString(new Cal(4)))
}