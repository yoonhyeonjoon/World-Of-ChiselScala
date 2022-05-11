package chiselExample.exampleModule.queue.asyncExample

import chisel3.util.{Counter, Decoupled, MuxLookup}
import chisel3._
import chiselExample.exampleModule.queue.asyncExample.runner.AsyncCrossingDemoUtil

// Transmitting module
class TransmitModule extends Module {
  val io = IO(new Bundle {
    val data_out = Decoupled(UInt(10.W))
//    val counterCheckout = Output(UInt(10.W))
  })

  io.data_out.valid := false.B
  io.data_out.bits := DontCare

  val counter = Counter(AsyncCrossingDemoUtil.values.length + 1)

  when (counter.value < AsyncCrossingDemoUtil.values.length.U) {

    val candidateValue = MuxLookup(counter.value, 0.U,
      AsyncCrossingDemoUtil.values.zipWithIndex.map {
        case (value: Int, index: Int) => (index.U, value.U)
      })
    io.data_out.enq(candidateValue)
    // Advance to the next item when data is being transferred on this cycle.
    when (io.data_out.fire) {
      counter.inc()
    }.otherwise{
      counter.value := counter.value
    }
  }.otherwise{
    counter.value := 0.U
  }



}
