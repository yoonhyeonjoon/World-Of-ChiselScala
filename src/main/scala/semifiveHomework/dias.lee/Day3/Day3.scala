import chisel3._
import chisel3.util._
import chisel3.stage._

class traffic_light() extends Module {
  val io = IO(new Bundle {
    val light = Output(UInt())
  })

  val green :: yellow :: red :: Nil = Enum(3)

  val count = RegInit(0.U(log2Ceil(7).W))
  val state = RegInit(green)


    when(state === green) {
      io.light := green
      count := count + 1.U
      when(count === 2.U) { state := yellow }
    }.elsewhen(state === yellow) {
      io.light := yellow
      count := count + 1.U
      when(count === 3.U) { state := red }
    }.otherwise{
      io.light := red
      count := count + 1.U
      when(count === 7.U) {
        count := 0.U
        state := green
      }
    }

}
object s extends App {
  println(getVerilogString(new traffic_light()))
}

