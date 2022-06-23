package nathanlee

import chisel3._
import chisel3.util._

class calculator(n: Int) extends Module {
  val io = IO(new Bundle {
    val mode = Input(UInt(2.W))
    val in_data1 = Input(UInt(n.W))
    val in_data2 = Input(UInt(n.W))
    val out_data = Output(UInt((n+1).W))
  })

  val answer = RegInit(0.U(log2Ceil(n+1).W))

    when (io.mode===0.U){
      answer := io.in_data1 +& io.in_data2
    }
    .elsewhen (io.mode===1.U){
      answer := io.in_data1 - io.in_data2
    }
    .elsewhen (io.mode===2.U){
      answer := io.in_data2 * io.in_data1
    }
    .otherwise{
      answer := io.in_data2 / io.in_data1
    }

    io.out_data := answer
}

object Test3_hw extends App {
  println(getVerilogString(new calculator(2)))
//  visualize(() => new DelayNCycles2(2))
}