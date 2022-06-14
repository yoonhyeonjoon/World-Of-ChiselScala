package semifiveHomework.ellie

import chisel3._
import chisel3.util._


class MyCounter(maxVal: Int) extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt())
  })

  val count = RegInit(0.U(log2Ceil(maxVal+1).W))
  when (count < maxVal.U) {
    count := count + 1.U
  }.otherwise {
    count := 0.U
  }
  io.out := count
}

class Traffic extends Module {
  val io = IO(new Bundle {
    val light = Output(UInt())
  })
  val green :: yellow :: red :: Nil = Enum(3)

  val state = Module(new MyCounter(7))
  val cnt = state.io.out

  when(cnt >= 2.U){
    io.light := yellow
  }.elsewhen(cnt >= 3.U){
    io.light := red
  }.otherwise{
    io.light := green
  }
}
object s extends App {
  println(getVerilogString(new Traffic()))
}