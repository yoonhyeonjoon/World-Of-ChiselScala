// Demo of an asynchronous FIFO in Chisel (using the rocket-chip AsyncQueue).
package chiselExample.queue.asyncExample.runner

import chisel3._
import chisel3.tester.testableClock
import chiselExample.queue.asyncExample.{ReceiveModule, TransmitModule}
import chiseltest.RawTester.test
import chiseltest.internal.Context
import freechips.rocketchip.util.{AsyncQueue, AsyncQueueParams}
import functional.ClockDivider
import runOption.ComplexRunner.generating

class AsyncCrossing extends Module {

  class AsyncCrossingIO extends Bundle {
      val value_out: UInt = Output(UInt(10.W))
  }

  val io: AsyncCrossingIO = IO(new AsyncCrossingIO)

  val tx_clock: Clock = ClockDivider(clock, 4)
  val rx_clock: Clock = ClockDivider(clock, 12)

  val tx: TransmitModule = withClockAndReset(clock = tx_clock, reset = reset) { Module(new TransmitModule) }
  val rx: ReceiveModule = withClockAndReset(clock = rx_clock, reset = reset) { Module(new ReceiveModule) }

  io.value_out := rx.io.value_out

  val async_crossing: AsyncQueue[UInt] = Module(new AsyncQueue(UInt(10.W), AsyncQueueParams.singleton()))

  async_crossing.io.enq_clock := tx_clock
  async_crossing.io.deq_clock := rx_clock
  async_crossing.io.enq <> tx.io.data_out
  async_crossing.io.deq <> rx.io.data_in

  async_crossing.io.enq_reset := DontCare
  async_crossing.io.deq_reset := DontCare

}

object AsyncCrossing extends App{

  generating(new AsyncCrossing())

  test(new AsyncCrossing()) { c =>
      Context().backend.setTimeout(c.clock, 10000)

      //${AsyncCrossingDemoUtil.values}
      for (cycle <- 0 until 9900)   //while (next_index < AsyncCrossingDemoUtil.values.length)
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