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

  val redreg: Vec[Vec[UInt]] = Reg(Vec(15, Vec(15, UInt(8.W))))
  val count1 = RegInit(0.U(3.W))

  io.out := count1//io.in(9, 1)

}

object ForTest extends App
{
  generating(new Tester(5))
}













