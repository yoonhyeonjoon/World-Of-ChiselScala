package mouduleTester.exampleModule.modulize

import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3.util.{Counter, log2Ceil}
import layered.stage.ElkStage

class CounterModule(maxVal: Int, en: Bool) {
  val count = RegInit(0.U(log2Ceil(maxVal+1).W))
  when (en) {
    when (count < maxVal.U) {
      count := count + 1.U
    } .otherwise {
      count := 0.U
    }
  }
}

object CounterModule {
  def apply(maxVal: Int, en: Bool) = {
    val mc = new CounterModule(maxVal, en)
    mc.count
  }
}

class CounterInstMod(n: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val count = Output(UInt())
  })
  io.count := CounterModule(n, io.en)
}

class CounterInstMod2(n: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val count = Output(UInt())
    val limit = Output(Bool())
  })
  val (value, wrap) = Counter(io.en, n)
  //     val (value, wrap) = Counter(0 until 7 by 2, io.en)
  io.count := value
  io.limit := wrap
}


object ModulizeExample extends App{

  val targetDir = "test_run_dir/gcd"
  (new ElkStage).execute(
    Array("-td", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new CounterInstMod(15)))
  )


  (new ElkStage).execute(
    Array("-td", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new CounterInstMod2(15)))
  )


}