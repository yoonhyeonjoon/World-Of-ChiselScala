import chisel3._
import chisel3.experimental.IO


class DelayNCycles extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(2.W))
  })
  val regs = Reg(UInt(3.W))
  val regs1 = Reg(UInt(2.W))

  if(regs == 7.U){
    regs := 0.U
  }else {
    regs := regs + 1.U
  }

  when(regs >= 3.U){
    io.out := 2.U
  }.elsewhen(regs >= 2.U){
    io.out := 1.U
  }.otherwise{
    io.out := 0.U
  }
}

object Test extends App {
  println(getVerilogString(new DelayNCycles))
}
