package mouduleTester.exampleModule

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.tester.{testableClock, testableData}
import chiseltest.RawTester.test
import layered.stage.ElkStage

class RegFile extends Module {
  val io = IO(new Bundle {
    val r0addr = Input(UInt(5.W))
    val r1addr = Input(UInt(5.W))
    val w0addr = Input(UInt(5.W))
    val w0en =   Input(Bool())
    val w0data = Input(UInt(64.W))
    val r0out =  Output(UInt(64.W))
    val r1out =  Output(UInt(64.W))
  })
//       val regs = Mem(32, UInt(64.W))
  val regs = Reg(Vec(32, UInt(64.W)))

  io.r0out := regs(io.r0addr)
  io.r1out := regs(io.r1addr)
  when(io.w0en) {
    regs(io.w0addr) := io.w0data
  }
}

class RegPrameterizeFile(nRead: Int) extends Module {
  val io = IO(new Bundle {
    val raddr  = Input(Vec(nRead, UInt(5.W)))
    val w0addr = Input(UInt(5.W))
    val w0en =   Input(Bool())
    val w0data = Input(UInt(64.W))
    val rout = Output(Vec(nRead, UInt(64.W)))
  })
  val regs = Mem(32, UInt(64.W))

  for (i <- 0 until nRead)
    io.rout(i) := regs(io.raddr(i))
  when(io.w0en) {
    regs(io.w0addr) := io.w0data
  }
}

object RegFile extends App{
  (new ChiselStage).emitVerilog(new RegFile)
  (new ChiselStage).emitVerilog(new RegPrameterizeFile(7))

  val targetDir = "test_run_dir/gcd"
  (new ElkStage).execute(
    Array("-td", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new RegPrameterizeFile(7)))
  )

  test(new RegFile) { c =>

    c.io.r0addr.poke(2.U)
    c.io.r1addr.poke(3.U)

    c.io.w0en.poke(true.B)

    c.io.w0addr.poke(0.U)
    c.io.w0data.poke(2.U)
    c.clock.step()

    println(s"1> ${c.io.w0en.peek()} r0addr(2) : ${c.io.r0out.peek()} / r1addr(3) : ${c.io.r1out.peek()}")

    c.io.w0addr.poke(1.U)
    c.io.w0data.poke(4.U)
    c.clock.step()

    println(s"2> ${c.io.w0en.peek()} r0addr(2) : ${c.io.r0out.peek()} / r1addr(3) : ${c.io.r1out.peek()}")

    c.io.w0addr.poke(2.U)
    c.io.w0data.poke(8.U)
    c.clock.step()

    println(s"3> ${c.io.w0en.peek()} r0addr(2) : ${c.io.r0out.peek()} / r1addr(3) : ${c.io.r1out.peek()}")

    c.io.w0addr.poke(3.U)
    c.io.w0data.poke(16.U)
    c.clock.step()

    println(s"4> ${c.io.w0en.peek()} r0addr(2) : ${c.io.r0out.peek()} / r1addr(3) : ${c.io.r1out.peek()}")

    c.io.w0addr.poke(4.U)
    c.io.w0data.poke(32.U)
    c.clock.step()

    println(s"5> ${c.io.w0en.peek()} r0addr(2) : ${c.io.r0out.peek()} / r1addr(3) : ${c.io.r1out.peek()}")


  }


  test(new RegPrameterizeFile(7)) { c =>

    c.io.raddr(0).poke(2.U)
    c.io.raddr(1).poke(3.U)
    c.io.raddr(2).poke(4.U)
    c.io.raddr(3).poke(5.U)
    c.io.raddr(4).poke(6.U)
    c.io.raddr(5).poke(7.U)
    c.io.raddr(6).poke(8.U)

    c.io.w0en.poke(true.B)

    c.io.w0addr.poke(0.U)
    c.io.w0data.poke(2.U)
    c.clock.step()

    println(s"1> ${c.io.w0en.peek()} rout : ${c.io.rout.peek()}")

    c.io.w0addr.poke(1.U)
    c.io.w0data.poke(4.U)
    c.clock.step()

    println(s"2> ${c.io.w0en.peek()} rout : ${c.io.rout.peek()}")

    c.io.w0addr.poke(2.U)
    c.io.w0data.poke(8.U)
    c.clock.step()

    println(s"3> ${c.io.w0en.peek()} rout : ${c.io.rout.peek()}")

    c.io.w0addr.poke(3.U)
    c.io.w0data.poke(16.U)
    c.clock.step()

    println(s"4> ${c.io.w0en.peek()} rout : ${c.io.rout.peek()}")

    c.io.w0addr.poke(4.U)
    c.io.w0data.poke(32.U)
    c.clock.step()

    println(s"5> ${c.io.w0en.peek()} rout : ${c.io.rout.peek()}")


  }



}