package chiselExample.practiceNote

import chisel3._
import chisel3.tester.{testableClock, testableData}
import chiseltest.RawTester.test


object LastCExecute extends App {

  class LastC extends Module {
    val io = IO(new Bundle {
      val x   = Input(Bool())
      val y   = Output(UInt())
    })
    val w = Wire(UInt())
    w := 1.U
    when (io.x) {
      w := 7.U
    }
    io.y := w
  }


  test(new LastC()) { c =>
    c.io.x.poke(true.B)
    c.clock.step()
    c.io.x.poke(false.B)
    c.clock.step()
    println(s"out:${c.io.x.peek()} v:${c.io.y.peek()}")


  }


}