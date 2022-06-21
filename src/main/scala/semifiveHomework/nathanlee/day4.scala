import chisel3._
import chisel3.util._


class DelayNCycles(n: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(Bool())
    val out = Output(Bool())
  })
  require(n > 0)
  val regs = Seq.fill(n)(Reg(Bool()))
  regs(0) := io.in
  for (i <- 1 until n)
    regs(i) := regs(i-1)
  io.out := regs(n-1)
}

class DelayNCyclesForTraffic(n: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(2.W))
    val out = Output(UInt(2.W))
  })
  var lastConn = io.in
  for (i <- 0 until n)
    lastConn = RegNext(lastConn)
  io.out := lastConn
}

class MyCounter(maxVal: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val out = Output(UInt())
  })
  val count = RegInit(0.U(log2Ceil(maxVal+1).W))
  val nextVal = Mux(count < maxVal.U, count + 1.U, 0.U)
  count := Mux(io.en, nextVal, count)
  io.out := count
}


//class CombLogic extends Module {
//  val io = IO(new Bundle {
//    val a   = Input(Bool())
//    val b   = Input(Bool())
//    val c   = Input(Bool())
//    val out = Output(Bool())
//  })
//  io.out := (io.a && io.b) || ~io.c
//}





object Test4 extends App {
  println(getVerilogString(new DelayNCycles2(2)))
//  visualize(() => new DelayNCycles2(2))
}