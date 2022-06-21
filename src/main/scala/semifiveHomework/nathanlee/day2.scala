import chisel3._
import chisel3.util._



class LastC extends Module {
  val io = IO(new Bundle {
    val x   = Input(Bool())
    val y   = Output(UInt())
  })
//  val w = Wire(UInt())
  io.y := 1.U
  when (io.x) {
    io.y := 7.U
  }
}

object Test extends App {
  println("HELLO, WORLD")
  println(getVerilogString(new LastC))
}