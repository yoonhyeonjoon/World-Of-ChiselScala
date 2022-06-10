package chiselExample.mouduleTester

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util.Valid
import layered.stage.ElkStage

class ValidReceiver(n: Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Valid(UInt(n.W)))
  })
  when (io.in.valid) {
    printf("  received %d\n", io.in.bits)
  }
}

object ValidReceiver extends App{
  (new ChiselStage).emitVerilog(new ValidReceiver(5))


  val targetDir = "test_run_dir/gcd"
  (new ElkStage).execute(
    Array("-td", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new ValidReceiver(5)))
  )



}