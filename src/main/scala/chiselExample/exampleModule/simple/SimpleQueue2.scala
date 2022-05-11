package chiselExample.exampleModule.simple

import Chisel.Decoupled
import chisel3._
import chisel3.stage.ChiselStage
import chisel3.tester.{testableClock, testableData}
import chisel3.util.{Counter, DecoupledIO, Queue}
import chiseltest.RawTester.test

class SimpleQueue2(maxVal: Int, numEntries: Int, pipe: Boolean, flow: Boolean) extends Module {

  class simpleQueueIO extends Bundle {
    val en: Bool = Input(Bool())
    val qin: UInt = Input(UInt(5.W))
    val qout: DecoupledIO[UInt] = Decoupled(UInt())
    val den: UInt = Output(UInt())
  }

  val io: simpleQueueIO = IO(new simpleQueueIO)

  private val q = Module(new Queue(UInt(), numEntries, pipe=pipe, flow=flow))
  val temp_r: UInt = RegInit(0.U(2.W))
  q.io.enq.valid := io.en
  q.io.enq.bits := io.qin
  io.qout <> q.io.deq
  io.den := temp_r

}


object SimpleQueue2 extends App {

  (new ChiselStage).emitVerilog(new SimpleQueue2(4,3, pipe=false, flow=false))


  test(new SimpleQueue2(4,3,pipe=false,flow=false)) { c =>
    c.io.en.poke(true.B)
    for (cycle <- 0 until 4) {   // Fill up queue
      println(s"f count:${c.io.den.peek()}")
      c.clock.step()
    }

    println()
    c.io.en.poke(false.B)
    for (cycle <- 0 until 4) {   // Drain queue
      println(s"f count:${c.io.den.peek()}")
      c.clock.step()
    }
    println()
    c.io.en.poke(true.B)
    for (cycle <- 0 until 4) {   // Simultaneous
      println(s"f count:${c.io.den.peek()}")
      c.clock.step()
    }
  }

}
