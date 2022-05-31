package chiselExample.crossBar

import chisel3._
import chisel3.util.{Decoupled, DecoupledIO, RRArbiter, log2Ceil}
import runOption.ComplexRunner.generating


//https://github.com/agile-hw/lectures/blob/main/15-network/lec15-network.ipynb

class MessageV1(numDests: Int, width: Int) extends Bundle {
  val addr: UInt = UInt(log2Ceil(numDests+1).W)
  val data: UInt = UInt(width.W)
}

class XBarV1IO(numIns: Int, numOuts: Int, width: Int) extends Bundle {
  val in: Vec[DecoupledIO[MessageV1]] = Vec(numIns, Flipped(Decoupled(new MessageV1(numOuts, width))))
  val out: Vec[DecoupledIO[MessageV1]] = Vec(numOuts, Decoupled(new MessageV1(numOuts, width)))
}

class XBarV1(numIns: Int, numOuts: Int, width: Int) extends Module {
  val io: XBarV1IO = IO(new XBarV1IO(numIns, numOuts, width))
  val arbs: Seq[RRArbiter[MessageV1]] = Seq.fill(numOuts)(Module(new RRArbiter(new MessageV1(numOuts, width), numIns)))
  for (ip <- 0 until numIns) {

    io.in(ip).ready := arbs.map{ _.io.in(ip).ready }.reduce{ _ || _ }
  }
  for (op <- 0 until numOuts) {
    arbs(op).io.in.zip(io.in).foreach { case (arbIn, ioIn) =>
      arbIn.bits <> ioIn.bits
      arbIn.valid := ioIn.valid && (ioIn.bits.addr === op.U)
    }
    io.out(op) <> arbs(op).io.out
  }
}

object XBarV1 extends App{

  generating(new XBarV1(3, 4, 12))

}














