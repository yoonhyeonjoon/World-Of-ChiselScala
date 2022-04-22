package mouduleTester.exampleModule.simple

import Chisel.Decoupled
import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import layered.stage.ElkStage



class InnerModule extends Module {

  val io = IO(new Bundle {
    val iin1 = Input(UInt(5.W))
    val iout1 = Output(UInt(5.W))
  })
  io.iout1 := io.iin1 // + 3.U
}

class SimpleExample extends Module {
  val io = IO(new Bundle {
    val in1   = Input(UInt(5.W))
    val en1   =   Input(Bool())
    val decup = Decoupled(UInt())
    val out1  =  Output(UInt(5.W))
  })

  val iio = Module(new InnerModule)

  val mediator = Mux(io.en1, io.in1, 27.U(5.W))

  iio.io.iin1 := mediator
  io.out1 := iio.io.iout1

  io.decup.bits := 5.U
  io.decup.valid := true.B


//   io.out1 := iio.io.iout1
  //io.out1 := mediator
//       val regs = Mem(32, UInt(64.W))
//  val regs = Reg(Vec(32, UInt(64.W)))


}

object SimpleExample extends App{
  (new ChiselStage).emitVerilog(new SimpleExample)

  val targetDir = "test_run_dir/gcd"
  (new ElkStage).execute(
    Array("-td", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new SimpleExample))
  )

//  test(new SimpleExample) { c =>
//
//    c.io.r0addr.poke(2.U)
//    c.io.r1addr.poke(3.U)
//
//    c.io.w0en.poke(true.B)
//
//    c.io.w0addr.poke(0.U)
//    c.io.w0data.poke(2.U)
//    c.clock.step()
//
//    println(s"1> ${c.io.w0en.peek()} r0addr(2) : ${c.io.r0out.peek()} / r1addr(3) : ${c.io.r1out.peek()}")
//
//    c.io.w0addr.poke(1.U)
//    c.io.w0data.poke(4.U)
//    c.clock.step()
//
//    println(s"2> ${c.io.w0en.peek()} r0addr(2) : ${c.io.r0out.peek()} / r1addr(3) : ${c.io.r1out.peek()}")
//
//    c.io.w0addr.poke(2.U)
//    c.io.w0data.poke(8.U)
//    c.clock.step()
//
//    println(s"3> ${c.io.w0en.peek()} r0addr(2) : ${c.io.r0out.peek()} / r1addr(3) : ${c.io.r1out.peek()}")
//
//    c.io.w0addr.poke(3.U)
//    c.io.w0data.poke(16.U)
//    c.clock.step()
//
//    println(s"4> ${c.io.w0en.peek()} r0addr(2) : ${c.io.r0out.peek()} / r1addr(3) : ${c.io.r1out.peek()}")
//
//    c.io.w0addr.poke(4.U)
//    c.io.w0data.poke(32.U)
//    c.clock.step()
//
//    println(s"5> ${c.io.w0en.peek()} r0addr(2) : ${c.io.r0out.peek()} / r1addr(3) : ${c.io.r1out.peek()}")
//
//  }



}