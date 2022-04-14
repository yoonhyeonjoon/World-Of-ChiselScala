package mouduleTester.exampleModule

import Chisel.RegEnable
import chisel3._
import chisel3.stage.ChiselStage
import chisel3.tester.{testableClock, testableData}
import chiseltest.RawTester.test

case class CounterParams(val limit: Int, val start: Int = 0) {
  def width = chisel3.util.log2Ceil(limit + 1)
}


class MyCounterEx1(maxVal: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val out = Output(UInt())
  })
  val count = Reg(UInt(chisel3.util.log2Ceil(maxVal+1).W))
  val nextVal = Mux(count < maxVal.U, count + 1.U, 0.U)

  val applyEn = Mux(io.en, nextVal, count)
  count := Mux(reset.asBool, 0.U, applyEn)
  io.out := count
}

class MyCounter(cp: CounterParams) extends Module {

  class ExplicitBundle() extends Bundle {
    val en: Bool = Input(Bool())
    val selector: Vec[Bool] = Input(Vec(5, Bool()))
    val out: UInt = Output(UInt())
  }


  val io: ExplicitBundle = IO(new ExplicitBundle)

  val hotValue: UInt = chisel3.util.Mux1H(Seq(
    io.selector(0) -> 2.U,
    io.selector(1) -> 4.U,
    io.selector(2) -> 8.U,
    io.selector(4) -> 11.U,
  ))

  val count: UInt = RegInit(0.U(cp.width.W))
  when (io.en) {
    when (count < cp.limit.U) {
      count := count + 1.U
    }.otherwise{
      count := cp.start.U
    }
  }
  io.out := hotValue
}

class MyCounter2(maxVal: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val count = Output(UInt(chisel3.util.log2Ceil(maxVal+1).W))
  })
  io.count := RegEnable(Mux(io.count < maxVal.U, io.count + 1.U, 0.U), 0.U, io.en)
}


class MyCounter3(maxVal: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val out = Output(UInt())
  })
  val count = RegInit(0.U(chisel3.util.log2Ceil(maxVal+1).W))
  when (io.en) {
    when (count < maxVal.U) {
      //      printf("incrementing to %d\n", count)
      printf(s"incrementing to $count\n")
      count := count + 1.U
    } .otherwise {
      count := 0.U
      printf("wrapping to      0\n")
    }
  }
  io.out := count
}


object CounterExample extends App{


  (new ChiselStage).emitVerilog(new MyCounterEx1(5))
  (new ChiselStage).emitVerilog(new MyCounter2(5))
//  (new ChiselStage).emitVerilog(new MyCounter2(5))
  (new ChiselStage).emitVerilog(new MyCounter3(15))

  test(new MyCounter2(3)) { c =>
    c.io.en.poke(1.B)
    c.clock.step()
    c.clock.step()
    c.clock.step()
    c.clock.step()
    c.clock.step()
  }

//  test(new MyCounter(CounterParams(5, 0))){c =>
//    c.io.en.poke(true.B)
//    for (cycle <- 0 until 1000) {
//      c.clock.step()
//      println(s"cycle : ${cycle} -> ${c.io.out.peek()}")
//    }
//  }

}