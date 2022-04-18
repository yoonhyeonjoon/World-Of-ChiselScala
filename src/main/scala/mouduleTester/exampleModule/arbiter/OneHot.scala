package mouduleTester.exampleModule.arbiter

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util.Cat
import layered.stage.ElkStage
import mouduleTester.ValidReceiver

class ConvUIntToOH(inWidth: Int) extends Module {
  val outWidth = 1 << inWidth
  val io = IO(new Bundle {
    val in  = Input(UInt(inWidth.W))
    val out = Output(UInt(outWidth.W))
  })
  require (inWidth > 0)
  def helper(index: Int): UInt = {
    if (index < outWidth-1) Cat(helper(index+1), io.in === index.U)
    else io.in === index.U
  }
  io.out := helper(0)
  //     io.out := UIntToOH(io.in)  // Standard library implementation
  //     printf("%d -> %b\n", io.in, io.out)
}

object ConvUIntToOH extends App {
  (new ChiselStage).emitVerilog(new ConvUIntToOH(3))

  val targetDir = "test_run_dir/gcd"
  (new ElkStage).execute(
    Array("-td", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new ConvUIntToOH(3)))
  )

}