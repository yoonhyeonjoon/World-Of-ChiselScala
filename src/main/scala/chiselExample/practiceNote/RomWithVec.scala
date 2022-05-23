package chiselExample.practiceNote

import chisel3.stage.ChiselStage
import chisel3.{Bool, Bundle, Input, Output, RawModule, UInt, VecInit, fromBooleanToLiteral, fromIntToWidth}


class DivByXTable(x: Int) extends RawModule {
  val io = IO(new Bundle {
    val in  = Input(UInt(4.W))
    val out = Output(Bool())
  })
  var results = Seq[Bool]()
  for (i <- 0 to 15) {
    results = results :+ (i % x == 0).B
  }
  val table = VecInit(results)
  io.out := table(io.in)

}

object DivByXTable extends App {

  (new ChiselStage).emitVerilog(new DivByXTable(3))

//  test(new DivByXTable(3)) { c =>
//    c.io.in.poke(15.U)
//    val ff = 1
//  }

}