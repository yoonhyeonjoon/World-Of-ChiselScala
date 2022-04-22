package mouduleTester.exampleModule.arbiter

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.tester.{testableClock, testableData}
import chisel3.util._
import chiseltest.RawTester.test
import layered.stage.ElkStage


class FactorialModule extends Module(){
  val io = IO(new Bundle {
    val in = Input(UInt(5.W))
    val out = Output(UInt(100.W))
  })
}

class InnerModule extends Module(){
  val io = IO(new Bundle {
    val in11 = Input(UInt(5.W))
    val out11 = Output(UInt(5.W))
    val out12 = Output(UInt(5.W))
  })

  val w = Wire(UInt(5.W))
  io.in11 <> io.out11
  w <> io.in11
  io.out12 <> (w +& 10.U)
}

class ConnectivityPractice1(n: Int, m: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(n.W))
    val enable = Input(Bool())
    val out = Output(UInt(n.W))
    val out2 = Output(UInt(n.W))
    val out3 = Flipped(Decoupled(UInt(m.W)))
    val vecin = Input(Vec(6, UInt(5.W)))
    val vecout = Flipped(Input(Vec(6, UInt(5.W))))
//    val req = Flipped(Vec(n, Decoupled(UInt(n.W))))
  })

  private val inner = Module(new InnerModule())

  inner.io.in11 <> io.in
  io.out <> inner.io.out11
  io.out2 <> inner.io.out12
  io.out3.ready <> io.enable

  val mediator = Wire(Vec(6, UInt(5.W)))
  mediator <> io.vecin
//  io.vecout <> mediator

  val regs = Mem(6, UInt(64.W))

//  regs <> mediator
  for (p <- 0 until 6) {
     regs(p) := mediator(p)
  }

  for (p <- 0 until 6) {
    when(regs(p) > 5.U){
      io.vecout(p) := regs(p)
    }.otherwise{
      if(p != 0)
      {

        io.vecout(p) := regs(p-1)
      }
      else{
        io.vecout(p) := regs(p)
      }
    }
  }
}


object ConnectivityPractice1 extends App{
  (new ChiselStage).emitVerilog(new ConnectivityPractice1(8,15))
  //(new ChiselStage).emitVerilog(f.asInstanceOf[RawModule])
  val targetDir = "test_run_dir/gcd"
  (new ElkStage).execute(
    Array("-td", targetDir),
    Seq(ChiselGeneratorAnnotation(() => new ConnectivityPractice1(8,15)))
  )


  test(new ConnectivityPractice1(10, 9)){c =>
    c.io.enable.poke(true.B)
    var counter = 0
    while(true) {
      c.clock.step()
      counter = counter+ 1
      if(counter == 100)
        {
          c.io.enable.poke(false.B)
          c.io.out2.peek()
        }
    }
  }


}
