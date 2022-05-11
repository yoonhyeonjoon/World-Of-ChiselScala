// Demo of an asynchronous FIFO in Chisel (using the rocket-chip AsyncQueue).
package chiselExample.exampleModule.queue.asyncExample.runner

import chisel3._
import chisel3.tester.testableClock
import chiselExample.exampleModule.queue.asyncExample.{ReceiveModule, TransmitModule}
import chiseltest.RawTester.test
import chiseltest.internal.{Context, ThreadedBackend}
import freechips.rocketchip.util.{AsyncQueue, AsyncQueueParams}
import functional.ClockDivider
import runOption.ComplexRunner.generating

object AsyncCrossingDemoUtil {
//  def values: Seq[Int] = Seq(1,2,4,8,16,32,64,128)
def values: Seq[Int] =
  Seq(2, 3, 5, 7,11, 13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,
    149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269,271,277,281,283,293,
    307,311,313,317,331,337,347,349,353,359,367,373,379,383,389,397,401,409,419,421,431,433,439,443,449,457,461,463,
    467,479,487,491,499,503,509,521,523,541,547,557,563,569,571,577,587,593,599,601,607,613,617,619,631,641,643,647,
    653,659,661,673,677,683,691,701,709,719,727,733,739,743,751,757,761,769,773,787,797,809)
   /* ((0 to 7) map ( v => (v * 2) + 1)) ++ ((0 to 7) map (_ * 2))*/
}



class AsyncCrossingDemo extends Module {

  class AsyncCrossingIO extends Bundle {
      val value_out: UInt = Output(UInt(10.W))
  }

  val io: AsyncCrossingIO = IO(new AsyncCrossingIO)

  // 10000MHz simulation clock
  // Divide by 8 -> 1250MHz TX clock
  // Divide by 4 -> 2500MHz RX clock
  val tx_clock: Clock = ClockDivider(clock, 4)
  val rx_clock: Clock = ClockDivider(clock, 12)
//  val clock16 = dontTouch(ClockDivider(clock, 16))

  val tx: TransmitModule = withClockAndReset(clock = tx_clock, reset = reset) { Module(new TransmitModule) }
  val rx: ReceiveModule = withClockAndReset(clock = rx_clock, reset = reset) { Module(new ReceiveModule) }

  io.value_out := rx.io.value_out

  val async_crossing: AsyncQueue[UInt] = Module(new AsyncQueue(UInt(10.W), AsyncQueueParams.singleton()))

  async_crossing.io.enq_clock := tx_clock
  async_crossing.io.enq <> tx.io.data_out
  async_crossing.io.deq_clock := rx_clock
  rx.io.data_in <> async_crossing.io.deq

  async_crossing.io.enq_reset := DontCare
  async_crossing.io.deq_reset := DontCare

}

object AsyncCrossingDemo extends App{

  generating(new AsyncCrossingDemo())

  test(new AsyncCrossingDemo()) { c =>
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