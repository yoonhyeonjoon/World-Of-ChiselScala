package chiselExample.allenTest

import Chisel.Valid
import chisel3._
import chisel3.util.{Counter, Decoupled, log2Ceil}
import chiselExample.mouduleTester.ValidReceiver
import runOption.ComplexRunner.generating

class Tester(n: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(10.W))
    val out =  Output(UInt())
  })

  io.out := io.in(9, 1)
}

object ForTest extends App
{
  generating(new Tester(5))
}













