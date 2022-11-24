package grammarForChisel

import Chisel.Mux
import chisel3.stage.ChiselStage
import chisel3.{Bundle, Input, Module, Output, UInt, fromIntToLiteral, fromIntToWidth}

class MuxExample extends Module  {

  val io = IO(new Bundle {
    val in  = Input(UInt(10.W))
    val out =  Output(UInt())
  })

  val get = Mux(io.in > 2.U, 1.U, 10.U)(3, 2)

  io.out := get
}


object MuxExample extends App  {

  (new ChiselStage).emitVerilog(new MuxExample())

}