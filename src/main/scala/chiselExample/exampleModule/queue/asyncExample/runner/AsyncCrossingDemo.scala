// Demo of an asynchronous FIFO in Chisel (using the rocket-chip AsyncQueue).
package chiselExample.exampleModule.queue.asyncExample.runner

import chisel3._
import chisel3.tester.testableClock
import chiselExample.exampleModule.queue.asyncExample.Tester.TransmitModule
import chiselExample.exampleModule.queue.asyncExample.{ClockDivider, ReceiveModule, TransmitModule}
import chiseltest.RawTester.test
import freechips.rocketchip.util.{AsyncQueue, AsyncQueueParams}
import runOption.ComplexRunner.generating

object AsyncCrossingDemoUtil {
//  def values: Seq[Int] = Seq(1,2,4,8,16,32,64,128)
def values: Seq[Int] = Seq(1,3,7,13,17,19,31,37,1,3,7,13,17,19,31,37)
   /* ((0 to 7) map ( v => (v * 2) + 1)) ++ ((0 to 7) map (_ * 2))*/
}



class AsyncCrossingDemo extends Module {
  val io = IO(new Bundle {
    // Output values received
    val value_out = Output(UInt(10.W))
//    val txChecker = Output(UInt(10.W))
    val rxChecker = Output(UInt(10.W))
//    val txClockChecker = Output(Bool())
    val rxClockChecker = Output(Bool())
  })

  val io2 = IO(new Bundle {
    val value_out = Output(UInt(10.W))
  })
  val tx_clock2 = ClockDivider(clock, 4)
  val tx2 = withClockAndReset(clock = tx_clock2, reset = reset) { Module(new TransmitModule) }
  tx2.io.data_out.ready := true.B
  io2.value_out := tx2.io.data_out.bits

  // 10000MHz simulation clock
  // Divide by 8 -> 1250MHz TX clock
  // Divide by 4 -> 2500MHz RX clock
  val tx_clock = ClockDivider(clock, 4)
  val rx_clock = ClockDivider(clock, 12)
  val clock16 = dontTouch(ClockDivider(clock, 16))

//  io.txClockChecker := tx_clock.asBool
  io.rxClockChecker := rx_clock.asBool

  // An alternative way to use withClockAndReset
  val tx = withClockAndReset(clock = tx_clock, reset = reset) { Module(new TransmitModule) }
  val rx = withClockAndReset(clock = rx_clock, reset = reset) { Module(new ReceiveModule) }

  // Pull the output.
  io.value_out := rx.io.value_out
//  io.txChecker := tx.io.data_peeker
  io.rxChecker := rx.io.data_picker
  val async_crossing = Module(new AsyncQueue(UInt(10.W), AsyncQueueParams.singleton()))
  async_crossing.io.enq_clock := tx_clock
  async_crossing.io.enq <> tx.io.data_out
  async_crossing.io.deq_clock := rx_clock
  rx.io.data_in <> async_crossing.io.deq

  async_crossing.io.enq_reset := DontCare
  async_crossing.io.deq_reset := DontCare

}

object AsyncCrossingDemo extends App {

  generating(new AsyncCrossingDemo())

  test(new AsyncCrossingDemo()) { c =>

      // Recall: 10000MHz simulation clock, 33MHz RX clock, 172MHz TX clock
      // 303 simulation cycles per RX clock

      println("len : " + AsyncCrossingDemoUtil.values.length)
      //${AsyncCrossingDemoUtil.values}
      for (cycle <- 0 until 900)   //while (next_index < AsyncCrossingDemoUtil.values.length)
      {
        c.clock.step()
//        if(c.io.value_out.peek().toString() !=  "UInt<10>(0)" || c.io.txChecker.peek().toString() !=  "UInt<10>(0)" || c.io.rxChecker.peek().toString() !=  "UInt<10>(0)")
//        {
////          println(s"$cycle txClock:${c.io.txClockChecker.peek().toString().split("Bool")(1)} /  rxClock:${c.io.rxClockChecker.peek().toString().split("Bool")(1)}  "
////          + s"$cycle output:${c.io.value_out.peek().toString().split(">")(1)} /  tx : ${c.io.txChecker.peek().toString().split(">")(1)} /  rx : ${c.io.rxChecker.peek().toString().split(">")(1)}")
//        }
      }

    }


}