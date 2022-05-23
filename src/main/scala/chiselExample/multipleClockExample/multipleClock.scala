package chiselExample.multipleClockExample

import chisel3._
import chisel3.tester.{testableClock, testableData}
import chisel3.util.random._
import chisel3.util.{Decoupled, Queue}
import chiseltest.RawTester.test
import functional.MockClockGenerator
import runOption.ComplexRunner.generating

import scala.util.Random

class ChildModule extends Module {
  val io = IO(new Bundle{
    val in = Input(Bool())
  })
}


class OutletQueue(numEntries: Int/*, pipe: Boolean, flow: Boolean*/) extends Module {

  val iClock = Module(new MockClockGenerator(2))
  val iClock2 = Module(new MockClockGenerator(4))

  val io = IO(new Bundle {
    val en  = Input(UInt(2.W))
    val input = Input(UInt(100.W))
    val count = Output(UInt(100.W))
    val count2 = Output(UInt(100.W))
    val out = Decoupled(UInt())
    val out2 = Output(UInt(100.W))
  })

  io.count := iClock.io.clock
  io.count2 := iClock2.io.clock

  val queue = withClock(iClock2.io.clock.asClock/*, iClock.io.resetB*/) {  Module(new Queue(UInt(), numEntries)) }

  val ranWire = WireInit(100.U)
  val setMaxWidth = 10
  ranWire := FibonacciLFSR.maxPeriod(setMaxWidth)

  when(io.en === 0.U)
  {
//    printf("[[[by randomgen : %d / %d (clk : %d, cnt : %d): Queue(deq) ready/valid: %d, %d  ]]]", ranWire, iClock2.io.clock, queue.io.count,  queue.io.deq.ready, queue.io.deq.valid)
//    printf("[[[bit : %d, bit<<2 : %d]]]", queue.io.enq.bits, queue.io.enq.bits<<ranWire)
    queue.io.enq.valid := true.B
    queue.io.enq.bits := ranWire
  }
  .elsewhen(io.en === 1.U){
    queue.io.enq.valid := true.B
    queue.io.enq.bits := io.input
    printf("queue operating by input : ")
  }
  .otherwise
  {
    queue.io.enq.valid := false.B
    queue.io.enq.bits := ranWire
    printf("queue off : ")
  }

  val regs = Reg(UInt())
  regs := queue.io.deq.bits
  io.out2 := regs

  io.out <> queue.io.deq


}


object multipleClock extends App {

  generating(new OutletQueue(10))
  test(new OutletQueue(10)) { c =>
        c.io.en.poke(0.U)
    for (cycle <- 0 until 400) {
//      SubClockCycling(cycle, 4, c.iClock.io.clockB) // if(cycle%2 == 0) c.io.clockB.poke(true.B) else  c.io.clockB.poke(false.B)
            println(
                s"clock1 : ${cycle} :  " +
//                  s"${Console.RED} clock2 : ${c.io.count.peek()} ${Console.RESET}" +
                  s"${Console.GREEN} clock2 : ${c.io.count2.peek()} ${Console.RESET}" +
                  s"${if(c.io.out.valid.peek().toString().contains("true") ) Console.MAGENTA else Console.RED} " +
                  s"  / output : ${c.io.out.bits.peek()} ${Console.RESET}"
            )

              val rangen = Random.nextInt(10)
//              println(s"${Console.WHITE} rangen : $rangen ${Console.RESET}")
              if(rangen == 1)
              {
                c.io.out.ready.poke(true.B)
              }
              else
              {
                c.io.out.ready.poke(false.B)
              }

              c.clock.step()
            }

      //      c.io.en.poke(false.B)
    }


//  generating(new MultiClock)
//    test(new MultiClock) { c =>
//
//      //    c.io.out.ready.poke(false.B)
//      for (cycle <- 0 until 100) {
//
//        SubClockCycling(cycle, 4, c.io.clockB) // if(cycle%2 == 0) c.io.clockB.poke(true.B) else  c.io.clockB.poke(false.B)
//
//        println(f"$cycle / ${c.io.clockB.peek()}")
//
//
//        //        println(
//        //          s"f ${cycle} inner:${c.io.count.peek()} / " +
//        //            s"${if(c.io.out.valid.peek().toString().contains("true") ) Console.GREEN else Console.RED} " +
//        //            s"valid:${c.io.out.valid.peek()} ${Console.RESET}" +
//        //            s"output : ${c.io.out.bits.peek()}")
//        //
//        ////        c.clock.step()
//        //      }
//
//        //      c.io.en.poke(false.B)
//      }
//    }
}