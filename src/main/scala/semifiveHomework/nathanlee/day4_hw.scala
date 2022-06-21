import chisel3._
import chisel3.util._

class traffic extends Module{
  val io = IO(new Bundle{
    val light = Output(UInt(2.W))
  })

  val light_init = RegInit(2.U(2.W))
  val next_light = RegInit(0.U(2.W))
  val delay4 = new DelayNCyclesForTraffic(4)
  val delay2 = new DelayNCyclesForTraffic(2)
  val delay1 = new DelayNCyclesForTraffic(1)

  when (light_init === 2.U(2.W)){
    delay4.in = 0.U(2.W)
    next_light := delay4.out
  }
    .elsewhen (light_init === 1.U(2.W)){
      delay1.in = 2.U(2.W)
        next_light := delay4.out
    }
    .otherwise (light_init === 0.U(2.W)){
      delay1.in = 1.U(2.W)
      next_light := delay4.out
    }

  io.light := next_light
}