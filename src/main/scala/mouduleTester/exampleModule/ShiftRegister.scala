package mouduleTester.exampleModule

import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import layered.stage.ElkStage


class DelayNCycles0(n: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(Bool())
    val out = Output(Bool())
  })
  require(n > 0)
  val regs: Seq[Bool] = Seq.fill(n)(Reg(Bool()))
  regs.head := io.in
  for (i <- 1 until n)
    regs(i) := regs(i-1)
  io.out := regs(n-1)
}

class DelayNCycles(n: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(Bool())
    val out = Output(Bool())
  })
  require(n >= 0)
  var lastConn = io.in
  for (i <- 0 until n)
    lastConn = RegNext(lastConn)
  io.out := lastConn
}

class DelayNCycles2(n: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(Bool())
    val out = Output(Bool())
  })
  require(n >= 0)
  def helper(n: Int, lastConn: Bool): Bool = {
    if (n == 0) lastConn
    else helper(n-1, RegNext(lastConn))
  }
  io.out := helper(n, io.in)
}

object DelayNCycles extends App{
//  (new ChiselStage).emitVerilog(new DelayNCycles(5))

  val targetDir = "test_run_dir/gcd"
  (new ElkStage).execute(
    Array("-td", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new DelayNCycles(5)))
  )


}