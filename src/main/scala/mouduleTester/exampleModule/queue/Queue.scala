package mouduleTester.exampleModule.queue

import Chisel.Decoupled
import chisel3._
import chisel3.stage.ChiselStage
import chisel3.tester.{testableClock, testableData}
import chisel3.util.{Counter, Queue}
import chiseltest.RawTester.test
import chiseltest.experimental.expose
import mouduleTester.ValidReceiver


class CountIntoQueue(maxVal: Int, numEntries: Int, pipe: Boolean, flow: Boolean) extends Module {

  val io = IO(new Bundle {
    val en  = Input(Bool())
    val out = Decoupled(UInt())
    val count = Output(UInt())
  })

  private val q = Module(new Queue(UInt(), numEntries, pipe=pipe, flow=flow))
  val (count, wrap) = Counter(q.io.enq.fire, maxVal)
  q.io.enq.valid := io.en
  q.io.enq.bits := count

  io.out <> q.io.deq
  io.count := count // for visibility
}

object CountIntoQueue extends App {

  (new ChiselStage).emitVerilog(new CountIntoQueue(4,3,pipe=false,flow=false))


  test(new CountIntoQueue(4,3,pipe=false,flow=false)) { c =>
    c.io.en.poke(true.B)
    c.io.out.ready.poke(false.B)
    for (cycle <- 0 until 4) {   // Fill up queue
      println(s"f count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
      c.clock.step()
    }

    println()
    c.io.en.poke(false.B)
    c.io.out.ready.poke(true.B)
    for (cycle <- 0 until 4) {   // Drain queue
      println(s"d count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
      c.clock.step()
    }
    println()
    c.io.en.poke(true.B)
    for (cycle <- 0 until 4) {   // Simultaneous
      println(s"s count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
      c.clock.step()
    }
  }

}
