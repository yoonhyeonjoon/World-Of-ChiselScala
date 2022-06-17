package chiselExample.queue

import Chisel.Decoupled
import chisel3._
import chisel3.tester.{testableClock, testableData}
import chisel3.util.Queue
import chisel3.util.random.FibonacciLFSR
import chiseltest.RawTester.test
import runOption.ComplexRunner.generating

//class InnerModule extends Module(){
//  val io = IO(new Bundle {
//    val intermediateDecoupled = Flipped((Decoupled(UInt()))
//    val intermediateDecoupledOut = Decoupled(UInt())
//  })
//}

class CountIntoQueue(maxVal: Int, numEntries: Int, pipe: Boolean, flow: Boolean) extends Module {

  val io = IO(new Bundle {
    val en  = Input(Bool())
    val out = Decoupled(UInt())
    val count = Output(UInt())
  })

  val queue = Module(new Queue(UInt(), numEntries, pipe=pipe, flow=flow))

  val ranWire = WireInit(100.U)

  when(io.en)
  {
    ranWire := FibonacciLFSR.maxPeriod(5)

    val switch = WireInit(Bool(), true.B)
    when(ranWire % 3.U === 0.U)
    {
      switch := true.B
    }.otherwise
    {
      switch := false.B
    }
    queue.io.enq.valid := switch
  }.otherwise
  {
    queue.io.enq.valid := io.en
  }

  queue.io.enq.bits := ranWire

  io.out <> queue.io.deq
  io.count := ranWire // for visibility


}





object CountIntoQueue extends App {


  generating(new CountIntoQueue(4,5,pipe=false,flow=false))


  test(new CountIntoQueue(4,5,pipe=false,flow=false)) { c =>
//    c.io.out.ready.poke(false.B)
    for (cycle <- 0 until 100) {   // Fill up queue

      if(cycle == 20) c.io.en.poke(true.B)

      c.io.out.ready.poke(true.B)
      println(
        s"f ${cycle} inner:${c.io.count.peek()} / " +
          s"${if(c.io.out.valid.peek().toString().contains("true") ) Console.GREEN else Console.RED} " +
          s"valid:${c.io.out.valid.peek()} ${Console.RESET}" +
          s"output : ${c.io.out.bits.peek()}")
      c.clock.step()
    }

    println()
    c.io.en.poke(false.B)

//    println()
//    c.io.en.poke(true.B)
//    for (cycle <- 0 until 4) {   // Simultaneous
////      println(s"s count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()} // ${c.io.outChecker.peek()}")
//      c.clock.step()
//    }
  }

}
