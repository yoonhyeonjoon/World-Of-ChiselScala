import chisel3._
import chisel3.util._
import chisel3.stage._

class Calculator(l: Int, n: Int) extends Module {
  val io = IO(new Bundle {
    val s = Input(UInt(l.W))
    val in0 = Input(UInt(n.W))
    val in1 = Input(UInt(n.W))
    val out = Output(UInt(n.W))
  })

  val adder :: substractor :: multiplier :: dividor = Enum(4)

  when(io.s === adder) {
    io.out := io.in0 +& io.in1
  }.elsewhen(io.s === substractor) {
    io.out := io.in0 - io.in1
  }.elsewhen(io.s === multiplier) {
    io.out := io.in0 * io.in1
  }.otherwise {
    io.out := io.in0 / io.in1
  }
}

println(getVerilogString(new Calculator(2, 8)))
