package chiselExample.mouduleTester

import chisel3._
import chisel3.stage.ChiselStage
import chisel3.tester.{testableClock, testableData}
import chisel3.util._
import chiseltest.RawTester.test

class CountIntoQueue(maxVal: Int, numEntries: Int, pipe: Boolean, flow: Boolean) extends Module {
  val io = IO(new Bundle {
    val en: Bool = Input(Bool())
    val out: DecoupledIO[UInt] = Decoupled(UInt())
    val count: UInt = Output(UInt())
  })
  val q: Queue[UInt] = Module(new Queue(UInt(), numEntries, pipe=pipe, flow=flow))
  val (count, wrap) = Counter(q.io.enq.fire, maxVal)
//  val tempD: UInt = Reg(UInt())
//  val tempB: Bool = Reg(Bool())
//  q.io.enq.valid := io.en
//  q.io.enq.bits := count
//  io.out <> q.io.deq
//  tempD := q.io.deq.bits
//  tempB := q.io.deq.ready
//  io.count := count // for visibility

  q.io.enq.valid := io.en
  q.io.enq.bits := count
  io.out <> q.io.deq
  io.count := count // for visibility

}




object QuestTester extends App{

  (new ChiselStage).emitVerilog(new CountIntoQueue(3,1,false,false))


  test(new CountIntoQueue(3,1,false, true)) { c =>
    c.io.en.poke(true.B)
    c.io.out.ready.poke(false.B)
    for (cycle <- 0 until 4) {   // fill up queue
      println(s"f count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
      c.clock.step()
    }
    println()
    c.io.en.poke(false.B)
    c.io.out.ready.poke(true.B)
    for (cycle <- 0 until 4) {   // drain queue
      println(s"d count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
      c.clock.step()
    }
    println()
    c.io.en.poke(true.B)
    for (cycle <- 0 until 3) {   // simultaneous
      println(s"d count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
      c.clock.step()
    }
  }

}
