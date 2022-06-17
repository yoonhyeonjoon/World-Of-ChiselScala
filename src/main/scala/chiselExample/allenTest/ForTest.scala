package chiselExample.allenTest

import Chisel.Valid
import chisel3._
import chisel3.util.{Counter, Decoupled, log2Ceil}
import chiselExample.mouduleTester.ValidReceiver
import runOption.ComplexRunner.generating

class CountWhenReady(n: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val in = Flipped(Decoupled(UInt(5.W)))
    val out =  Decoupled(UInt(5.W))
  })

  io.in <> io.out


}



object ForTest extends App
{
  generating(new CountWhenReady(5))

}













