package semifiveHomework.mason

import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util._

class MyWave(n: Int, m: Int) extends Module { // n : 1000 m : 1000
  val io = IO(new Bundle {
    val in = Input(Vec(n, UInt(m.W)))
    val vol = Input(UInt(n.W))
    val out = Output(UInt(m.W))
  })

  val count = RegInit(0.U(log2Ceil(m).W))
  val i_cnt = RegInit(0.U(log2Ceil(n).W))

  val s_reg = Reg(Vec(n, UInt(log2Ceil(m).W)))
  val result = Wire(UInt(4.W))

  require(n > 0)

  var total = io.in(0)

  for (i <- 0 until n ) {
    i_cnt := i_cnt + 1.U
    total = io.in(i) + total
  }
  io.out := (0 until n).foldLeft(io.in){(lastccc,j) => RegNext(lastccc)}

  // need to make up below...
  // decoder + muxing adder then divide..
  // refer to drawio file


//  switch (io.vol) {
//    is ("b00".U) { result := "b0001".U}
//    is ("b01".U) { result := "b0010".U}
//    is ("b10".U) { result := "b0100".U}
//    is ("b11".U) { result := "b1000".U}
//    }
}

object Wave extends App {
  println("Starting generate")
  (new ChiselStage).emitVerilog(new MyWave( 4, 4) )
}
