package mouduleTester

import chisel3.internal.BaseModule
import chisel3.{RawModule, _}
import chisel3.stage.ChiselStage
import chisel3.util._

class MyMux extends Module {

  class MyBundle(val a: Int) extends Bundle {
    val s: Bool = Input(Bool())
    val in0: Bool = Input(Bool())
    val in1: Bool = Input(Bool())
    val out: Bool = Output(Bool())
  }

  val io: Bundle = IO(new MyBundle(5) )

//  val ff = Module(new Queue(4,2))
//  ff.io.enq.bits
//  ff.io.enq.valid
//  ff.io.enq.read
//  ff.io.deq
//
//  io.out := Mux(io.s, io.in1, io.in0)

}


class MyMux2 extends Bundle {

  val s: Bool = Input(Bool())
  val in0: Bool = Input(Bool())
  val in1: Bool = Input(Bool())
  val out: Bool = Output(Bool())

  out := Mux(s, in1, in0)

}

object MyMux extends App{

  val ff = IndexedSeq(1,2,3,4,5)
  val gggg = ff(3)
  val ff2 = Seq(1,2,3,4,5)
  val gggg2 = ff2(3)
  (new ChiselStage).emitVerilog(new MyMux())
  //(new ChiselStage).emitVerilog(f.asInstanceOf[RawModule])


}

class MyMuxN(n: Int, m: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(Vec(n, UInt(m.W)))
    val sel = Input(UInt(log2Ceil(n).W))
    val out = Output(UInt(m.W))
  })
  io.out := io.in(io.sel)
}
