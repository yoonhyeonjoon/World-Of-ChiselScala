package chiselExample.exampleModule.queue.asyncExample

import chisel3.util.Decoupled
import chisel3._

// Receiving module
class ReceiveModule extends Module {
  val io = IO(new Bundle {
    val data_in = Flipped(Decoupled(UInt(10.W)))
    val value_out = Output(UInt(10.W))
    val data_picker = Output(UInt(10.W))
  })
  // RX is always ready
  io.data_in.ready := true.B
  // When data is transmitted, update output.
  val output: UInt = RegInit(0.U)
  io.value_out := output


  //  printf("ReceiveModule state valid Check :-> %d \n", io.data_in.valid)
  when(io.data_in.fire) {
    output := io.data_in.bits
    io.data_picker := io.data_in.bits
    //    printf("recieve :->> val : %d \n", output)
  }.otherwise{
    io.data_picker := 0.U
  }
}
