package runOption

import chisel3.RawModule
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import layered.stage.ElkStage

object ComplexRunner {

  def generating(module : =>RawModule, dir : String = "test_run_dir/gcd"){
    (new ChiselStage).emitVerilog(module)
    (new ElkStage).execute(
      Array("-td", dir),
      Seq(ChiselGeneratorAnnotation(() => module))
    )
  }
}
