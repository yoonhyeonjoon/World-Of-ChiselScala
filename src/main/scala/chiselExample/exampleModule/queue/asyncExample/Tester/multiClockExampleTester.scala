// Demo of an asynchronous FIFO in Chisel (using the rocket-chip AsyncQueue).
package chiselExample.exampleModule.queue.asyncExample.Tester

import chisel3._
import chisel3.tester.{testableClock, testableData}
import chisel3.util._
import chiselExample.exampleModule.queue.asyncExample.ClockDivider
import chiseltest.RawTester.test
import runOption.ComplexRunner.generating

object AsyncCrossingDemoUtil {
  /**
   * Values to send across the AsyncQueue.
   *
   * @return 1,3,5,...,15,0,2,4,...,14
   */
//  def values: Seq[Int] = ((0 to 7) map ( v => (v * 2) + 1)) ++ ((0 to 7) map (_ * 2))
    def values: Seq[Int] = Seq(1,3,7,13,17,19,31,37,1,3,7,13,17,19,31,37)
}
//
//// Transmitting module
//class TransmitModule extends Module {
//  val io = IO(new Bundle {
//    val data_out = Decoupled(UInt(10.W))
//  })
//
//  io.data_out.valid := false.B
//  io.data_out.bits := DontCare
//
//  val counter = Counter(AsyncCrossingDemoUtil.values.length + 1)
//
//  counter.reset()
//
//  when (counter.value < AsyncCrossingDemoUtil.values.length.U) {
//    // Enqueue the current value
////    printf("counter :>> %d \n", counter.value)
//
//    val candidateValue = MuxLookup(counter.value, 0.U,
//      AsyncCrossingDemoUtil.values.zipWithIndex.map {
//        case (value: Int, index: Int) => (index.U, value.U)
//      })
////    printf("counter :>>>> %d / %d \n", counter.value, candidateValue)
//    io.data_out.enq(candidateValue)
//
//    // Advance to the next item when data is being transferred on this cycle.
//    when (io.data_out.fire) {
//      counter.inc()
//    }
//  }
//
//
//}

class AsyncCrossingDemo2 extends Module {
  val io = IO(new Bundle {
    val value_out = Output(UInt(10.W))
  })

  val tx_clock = ClockDivider(clock, 4)
  val tx = withClockAndReset(clock = tx_clock, reset = reset) { Module(new TransmitModule) }


  tx.io.data_out.ready := true.B
  io.value_out := tx.io.data_out.bits
}

object AsyncCrossingDemo2 extends App {
//
//  test(new TransmitModule()) { c =>
//
//    c.io.data_out.ready.poke(true.B)
//    for (cycle <- 0 until 15) {   // Fill up queue
////      println(s"f count:${c.io.data_out.bits.peek()}")
//      c.clock.step()
//    }
//  }

  generating(new AsyncCrossingDemo2())

  test(new AsyncCrossingDemo2()) { c =>

      // Recall: 10000MHz simulation clock, 33MHz RX clock, 172MHz TX clock
      // 303 simulation cycles per RX clock
      // AsyncCrossingDemoUtil.values.length*33 cycles
      //step((AsyncCrossingDemoUtil.values.length + 1) * 303 * 10)

      // Basically step through until the RX has read out all the values.
      var next_index: Int = 0
      var prev_value = c.io.value_out.peek()

      println("len : " + AsyncCrossingDemoUtil.values.length)
      //${AsyncCrossingDemoUtil.values}
      for (cycle <- 0 until 999)   //while (next_index < AsyncCrossingDemoUtil.values.length)
      {
        c.clock.step()
//        val value = c.io.checkerValue.peek()
//        println(s"f count:> ${c.exposePeeker2.peek()}")
//        println(
//          s"$value / ${c.exposePeeker.peek()}"
////            //          s"uint : ${c.exposeSwitch2.peek()} " +
////            s"${Console.GREEN} ${c.io.input.bits.peek()}  ${Console.RESET}" +
////            s"${Console.RED} output : ${c.io.output.bits.peek()} ${Console.RESET}"
//        )
//        if (value != prev_value) {
////          assert(value == AsyncCrossingDemoUtil.values(next_index).asUInt)
//          next_index += 1
//        }
//        prev_value = value
      }

    }


}