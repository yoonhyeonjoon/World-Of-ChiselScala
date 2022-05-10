package chiselExample.exampleModule.modulize.ReusableModulizeExample4

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import layered.stage.ElkStage

class SignMag(n: Int) extends Bundle {
  val x = UInt(n.W)
  val s = Bool()
}

class PassThru(n: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(new SignMag(n))
    val out = Output(new SignMag(n))
  })
  //     io.out.x := io.in.x
  //     io.out.s := io.in.s

  io.in <> io.out
}



object ReusableModulizeExample4 extends App{

  (new ChiselStage).emitVerilog(new PassThru(15))

  val targetDir = "test_run_dir/gcd"
  (new ElkStage).execute(
    Array("-td", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new PassThru(15)))
  )

}