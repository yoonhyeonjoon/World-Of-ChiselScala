package mouduleTester.exampleModule.multipleClockExample

import chisel3._
import chisel3.tester.{testableClock, testableData}
import chiseltest.RawTester.test
import functional.ClockHelper.Tester.SubClockCycling
import functional.MockClockGenerator
import runOption.ComplexRunner.generating

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
//    val out = Decoupled(UInt())
  })

  io.count := iClock.io.clock
  io.count2 := iClock2.io.clock

////  val queue = withClock(iClock.io.clockB.asClock/*, iClock.io.resetB*/) {  Module(new Queue(UInt(), numEntries)) }
//  val queue =  Module(new Queue(UInt(), numEntries))
//
//  val ranWire = WireInit(100.U)
//
//  ranWire := FibonacciLFSR.maxPeriod(100)
//  when(io.en === 0.U)
//  {
//    queue.io.enq.valid := true.B
//    queue.io.enq.bits := ranWire
//  }
//  .elsewhen(io.en === 1.U){
//    queue.io.enq.valid := true.B
//    queue.io.enq.bits := io.input
//  }
//  .otherwise
//  {
//    queue.io.enq.valid := false.B
//    queue.io.enq.bits := ranWire
//  }
//
//  io.out <> queue.io.deq

}


object multipleClock extends App {

  generating(new OutletQueue(5))
  test(new OutletQueue(5)) { c =>
    //    c.io.out.ready.poke(false.B)
    for (cycle <- 0 until 400) {
//      SubClockCycling(cycle, 4, c.iClock.io.clockB) // if(cycle%2 == 0) c.io.clockB.poke(true.B) else  c.io.clockB.poke(false.B)
            println(
                s"f clock1 : ${cycle} :  " +
                  s"${Console.RED} clock2 : ${c.io.count.peek()} ${Console.RESET}" +
                  s"${Console.GREEN} clock3 : ${c.io.count2.peek()} ${Console.RESET}"
            )

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