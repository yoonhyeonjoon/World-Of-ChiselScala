package chiselExample.simple

import chisel3._
import chisel3.stage.ChiselStage
import chisel3.tester.{testableClock, testableData}
import chisel3.util.{Counter, Decoupled, Queue}
import chiseltest.RawTester.test



class SimpleQueue(maxVal: Int, numEntries: Int, pipe: Boolean, flow: Boolean) extends Module {

  val io = IO(new Bundle {
    val en  = Input(Bool())
    val count = Output(UInt())
    val outputTest = Output(UInt(5.W))
//    val outChecker = Output(UInt())
  })

  val hello: UInt = "b101011011101111".U
  io.outputTest := hello(5,0)

  private val q = Module(new Queue(UInt(), numEntries, pipe=pipe, flow=flow))
  val (count, wrap) = Counter(q.io.enq.fire, maxVal)
  q.io.enq.valid := io.en
  q.io.enq.bits := count

  q.io.deq.ready := io.en

  val regs = Reg(UInt())
//  val regs = Mem(1, UInt(4.W))
//  io.count := q.io.deq.bits
  regs := q.io.deq.bits

  when(regs =/= 0.U)
  {
    io.count := 1.U
  }
  .otherwise{
    io.count := 2.U
  }



}

object SimpleQueue extends App {

  (new ChiselStage).emitVerilog(new SimpleQueue(4,3, pipe=false, flow=false))


//  test(new SimpleQueue(4,3,pipe=false,flow=false)) { c =>
//    c.io.en.poke(true.B)
////    c.io.out.ready.poke(false.B)
//    for (cycle <- 0 until 4) {   // Fill up queue
////      println(s"f count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()} // ${c.io.outChecker.peek()}")
//      println(s"f count:${c.io.count.peek()}")
//      c.clock.step()
//    }
//
//    println()
//    c.io.en.poke(false.B)
////    c.io.out.ready.poke(true.B)
//    for (cycle <- 0 until 4) {   // Drain queue
////      println(s"d count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()} // ${c.io.outChecker.peek()}")
//      println(s"f count:${c.io.count.peek()}")
//      c.clock.step()
//    }
//    println()
//    c.io.en.poke(true.B)
//    for (cycle <- 0 until 4) {   // Simultaneous
////      println(s"s count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()} // ${c.io.outChecker.peek()}")
//      println(s"f count:${c.io.count.peek()}")
//      c.clock.step()
//    }
//  }

}
