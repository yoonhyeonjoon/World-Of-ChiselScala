import chisel3._
import chisel3.util._


class MyPMux(n: Int) extends Module {
  val io = IO(new Bundle {
    val in0 = Input(SInt(n.W))
    val out = Output(SInt(n.W))
  })
  io.out := Mux(io.in0<0.S, -io.in0, io.in0)
}


class RegLand extends Module {
  val io = IO(new Bundle {
    val in  = Input(Bool())
    val en  = Input(Bool())
    val out = Output(Bool())
  })
  val r = Reg(Bool())
  //     val r = RegInit(0.B)
  r := io.in
  io.out := r
  //     io.out := RegNext(io.in, 0.B)
  //     io.out := RegEnable(io.in, 0.B, io.en)
}

object Test3 extends App {
  println(getVerilogString(new MyPMux(8)))
}


