package chiselExample.mouduleTester

import Chisel.Fill
import chisel3._
import chisel3.stage.ChiselStage
import chisel3.tester.{testableClock, testableData}
import chisel3.util.Cat
import chiseltest.RawTester.test

class MyXOR extends Module {
  val io = IO(new Bundle {
    val a   = Input(Bool())
    val b   = Input(Bool())
    val c   = Output(Bool())
  })
  val myGate = io.a ^ io.b
  io.c := myGate
}

class MyXOR2 extends Module {
  val io = IO(new Bundle {
    val a   = Input(Bool())
    val b   = Input(Bool())
    val c   = Output(Bool())
  })
  val myWire = Wire(Bool())
  myWire := io.a ^ io.b
  io.c := myWire
}

class MyWMux(n: Int) extends Module {
  val io = IO(new Bundle {
    val s   = Input(Bool())
    val in0 = Input(UInt(n.W))
    val in1 = Input(UInt(n.W))
    val out = Output(UInt(n.W))
  })
  when (io.s) {
    io.out := io.in1
  } .otherwise {
    io.out := io.in0
  }
}

class LastC extends Module {
  val io = IO(new Bundle {
    val x = Input(Bool())
    val y = Output(UInt())
  })

  val w = Wire(UInt())
  w := 1.U

  when (io.x)
  {
    w := 7.U
  }

  io.y := w
}

class MyAdder(n: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(n.W))
    val b = Input(UInt(n.W))
    val c = Output(UInt())
  })
  io.c := io.a + io.b
  //     io.c := io.a +% io.b
  //     io.c := io.a +& io.b
}

class SignMagConv(n: Int) extends Module {
  val io = IO(new Bundle {
    val sign = Input(Bool())
    val mag  = Input(UInt(n.W))
    val twos = Output(UInt((n+1).W))
  })
  when (io.sign) {
    io.twos := ~io.mag +& 1.U
  } .otherwise {
    io.twos := io.mag
  }
}

class SignExtender(n: Int, m: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(n.W))
    val out = Output(UInt(m.W))
  })
  assert(n > 0)
  assert(n < m)
  val signBit = io.in(n-1)
  val extension = Fill(m-n, signBit)
  io.out := Cat(extension, io.in)
}

class DelayNCycles(n: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(Bool())
    val out = Output(Bool())
  })
  require(n > 0)
  val regs = Seq.fill(n)(Reg(Bool()))
  regs(0) := io.in
  for (i <- 1 until n)
    regs(i) := regs(i-1)
  io.out := regs(n-1)
}

class DelayNCycles2(n: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(Bool())
    val out = Output(Bool())
  })
  require(n > 0)
  val regs = Seq.fill(n)(Reg(Bool()))
  regs(0) := io.in
  for (i <- 1 until n)
    regs(i) := regs(i-1)
  io.out := regs(n-1)
}

class DelayNCycles3(n: Int) extends Module {

  class RBundle() extends Bundle {
    val in: Bool = Input(Bool())
    val out: Bool = Output(Bool())
  }

  val delayedBundle: RBundle = new RBundle
  val io: RBundle = IO(delayedBundle)
  var lastConn: Bool = io.in
  for (i <- 0 until n)
    lastConn = RegNext(lastConn)
  io.out := lastConn
}

class CombLogic extends Module {

  class CBundle extends Bundle {
    val a: Bool = Input(Bool())
    val b: Bool = Input(Bool())
    val c: Bool = Input(Bool())
    val out: Bool = Output(Bool())
  }

  val io: CBundle = IO(new CBundle)
  io.out := (io.a && io.b) || ~io.c
  //     printf(p"a: ${io.a}, b: ${io.b}, c: ${io.c}, out: ${io.out}\n")
}

object CombLogic2 extends App{

  test(new CombLogic) { dut =>
    for (a <- Seq(true, false)) {
      for (b <- Seq(true, false)) {
        for (c <- Seq(true, false)) {
          dut.io.a.poke(a.B)
          dut.io.b.poke(b.B)
          dut.io.c.poke(c.B)
          println(s"$a, $b, $c => ${dut.io.out.peek()}")
//          val expected = (a && b) || !c
//          dut.io.out.expect(expected.B)
//          dut.clock.step()
        }
      }
    }
  }

}

class Reducer(n: Int, m: Int) extends Module {
  class BundleIO extends Bundle{
    val in: Vec[UInt] = Input(Vec(n, UInt(m.W)))
    val out: UInt = Output(UInt((m + 1).W))
  }

  val io: BundleIO = IO(new BundleIO())
  require(n > 0)
//  val totalSoFar = Seq.fill(n - 1)(Wire(UInt((m + 1).W)))
//  var totalSoFar: UInt = io.in(0)
//  totalSoFar.pad(5)
  var totalSoFar2: UInt = Wire(UInt(3.W))
  totalSoFar2 := io.in(0)
//  totalSoFar2.pad(5)

  for (i <- 1 until n)
    totalSoFar2 = io.in(i) + totalSoFar2
  io.out := totalSoFar2
}

object Reducer extends App{

  test(new Reducer(5, 3)) { dut =>

    dut.io.in(0).poke(3.U)
    dut.io.in(1).poke(4.U)
    dut.io.in(2).poke(5.U)
    dut.io.in(3).poke(1.U)
    dut.io.in(4).poke(2.U)



    dut.io.in.peek()
    dut.io.out.peek()

  }

}


class RegLand extends Module {
  val io = IO(new Bundle {
    val in  = Input(Bool())
    val out = Output(Bool())
  })
  val r = Reg(Bool())
  //     val r = RegInit(0.B)
  r := io.in
  io.out := r
  //     io.out := RegNext(io.in, 0.B)
  //     io.out := RegEnable(io.in, 0.B, io.en)
}


object SignMagConv extends App {
//  (new ChiselStage).emitVerilog(new SignMagConv(10))
//  (new ChiselStage).emitVerilog(new SignExtender(4,8))

//  (new ChiselStage).emitVerilog(new Reducer(5, 3))
    (new ChiselStage).emitVerilog(new RegLand)

}


