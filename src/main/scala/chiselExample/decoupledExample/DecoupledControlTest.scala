package chiselExample.decoupledExample

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.tester.{testableClock, testableData}
import chisel3.util.Decoupled
import chiseltest.RawTester.test
import chiseltest.experimental.expose
import layered.stage.ElkStage

import scala.language.postfixOps


class DecoupledControlTest(maxVal: Int) extends Module {

  val io = IO(new Bundle {
    val en  = Input(Bool())
    val decoupled = Decoupled(UInt())
    val decup = Flipped(Decoupled(UInt(5.W)))
    val out = Output(UInt())
  })

  private val myCounter = RegInit(UInt(100.W), 0.U)
  when(myCounter =/= 175.U){
    myCounter := myCounter + 1.U
  }

  val switch = WireInit(Bool(), true.B)
  val exposeSwitch = expose(switch)

  when(io.en)
  {
    io.decoupled.bits := myCounter

    when(myCounter % 3.U === 0.U)
    {
      switch := true.B
    }.elsewhen(myCounter % 3.U =/= 0.U)
    {
      switch := false.B
    }

    io.decoupled.valid := switch

   }.otherwise
  {
    io.decoupled.bits := 0.U
    io.decoupled.valid := false.B
  }

  when(io.decoupled.valid === true.B)
  {
    io.out := io.decoupled.bits
  }.otherwise{
    io.out := 0.U
  }

  io.decup.ready := true.B

}


object DecoupledControlTest extends App {
  (new ChiselStage).emitVerilog(new DecoupledControlTest(5))
    val targetDir = "test_run_dir/gcd"
    (new ElkStage).execute(
      Array("-td", targetDir),
      Seq(ChiselGeneratorAnnotation(() => new DecoupledControlTest(5)))
    )

  test(new DecoupledControlTest(4)) { c =>
    for (cycle <- 0 until 200) {
      c.clock.step()

      if(cycle == 50) c.io.en.poke(true.B)
      println(s"cycle: $cycle : output : ${c.io.out.peek()} / ${c.exposeSwitch.peek()} ")
    }
  }

  //  (new ChiselStage).emitVerilog(new ValidReceiver(5))
//
//
//  val targetDir = "test_run_dir/gcd"
//  (new ElkStage).execute(
//    Array("-td", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new CountWhenReady2(5)))
//  )

  // println(getVerilog(new ValidReceiver(4)))


}