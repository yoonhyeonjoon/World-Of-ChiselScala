package chiselExample.exampleModule.arbiter

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.tester.{testableClock, testableData}
import chisel3.util.{Arbiter, Decoupled}
import chiseltest.RawTester.test
import chiseltest.experimental.expose
import firrtl.Utils.False
import layered.stage.ElkStage


class UtilArbDemo(numPorts: Int, n: Int) extends Module {
  val io = IO(new Bundle {
    val req = Flipped(Vec(numPorts, Decoupled(UInt(n.W))))
    val out = Decoupled(UInt(n.W))
  })
  require (numPorts > 0)
  val arb = Module(new Arbiter(UInt(n.W), numPorts))
  for (p <- 0 until numPorts) {
    arb.io.in(p) <> io.req(p)
  }

  val arbExpose = expose(arb.io.chosen)

  io.out <> arb.io.out
  printf("req: ")
  for (p <- numPorts-1 to 0 by -1) {
    printf("%b", arb.io.in(p).valid)
  }
  printf("     /  bits: %d (valid node's bits : %b)\n", arb.io.out.bits, arb.io.out.bits)
}

object UtilArbDemo extends App{

  val numPorts = 4
  (new ChiselStage).emitVerilog(new UtilArbDemo(numPorts,8))
  val targetDir = "test_run_dir/gcd"
  (new ElkStage).execute(
    Array("-td", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new UtilArbDemo(numPorts,8))))

  test(new UtilArbDemo(numPorts,8)) { c =>
    c.io.out.ready.poke(true.B)
    for (cycle <- 0 until 4) {
      for (p <- 0 until numPorts) {
        c.io.req(p).bits.poke((p+cycle).U)
        c.io.req(p).valid.poke((p < 4).B)

        println(s"current State : ")
        for (p <- 0 until numPorts) {
          println(s"=> ${p} : valid : ${c.io.req(p).valid.peek()} / contained bit : ${c.io.req(p).bits.peek()}")
        }
        println(s"peeking : ${p} :  ${c.io.req(p).valid.peek()} / chosen bit : ${c.arbExpose.peek()}")
        println()
        c.clock.step()
        c.io.req(p).valid.poke(false.B)
      }
    }
  }
}