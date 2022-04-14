package mouduleTester.exampleModule

import Chisel.fromIntToWidth
import chisel3.{Bundle, Input, Module, Output, UInt, Vec, Wire}

class SetWireBitWidth {

  class BitWidthSet(n: Int, m: Int) extends Module {
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
}
