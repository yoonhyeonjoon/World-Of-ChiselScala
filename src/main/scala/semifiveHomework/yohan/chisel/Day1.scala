import chisel3._
import chisel3.stage.ChiselStage

class MyMux(n: Int) extends Module {
  val io = IO(new Bundle {
    val mode_alu  = Input(UInt(2.W))
    val in0       = Input(SInt(n.W))
    val in1       = Input(SInt(n.W))
    val out       = Output(SInt((n*2-1).W))
  })

  when(io.mode_alu === 0.U){
    io.out := io.in0 +& io.in1
  } .elsewhen(io.mode_alu === 1.U){
    io.out := io.in0 -& io.in1
  } .elsewhen(io.mode_alu === 2.U){
    io.out := io.in0 * io.in1
  } .otherwise{
    io.out := io.in0 / io.in1
  }
}

object Test extends App {
  println("Start generation")
  (new ChiselStage).emitVerilog(new MyMux(3))
}
