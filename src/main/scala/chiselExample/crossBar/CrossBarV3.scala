package chiselExample.crossBar

import chisel3._
import chisel3.util._

case class XBarParamsV3[T <: chisel3.Data](numHosts: Int, payloadT: T) {
  def addrBitW(): Int = log2Ceil(numHosts + 1)
}

class MessageV3[T <: chisel3.Data](p: XBarParamsV3[T]) extends Bundle {
  val addr: UInt = UInt(p.addrBitW().W)
  val data: T = p.payloadT
}

class PortIOV3[T <: chisel3.Data](p: XBarParamsV3[T]) extends Bundle {
  val in: DecoupledIO[MessageV3[T]] = Flipped(Decoupled(new MessageV3(p)))
  val out: DecoupledIO[MessageV3[T]] = Decoupled(new MessageV3(p))
}

class XBarV3[T <: chisel3.Data](p: XBarParamsV3[T]) extends Module {
  class XBarBundle extends Bundle{
    val ports: Vec[PortIOV3[T]] = Vec(p.numHosts, new PortIOV3(p))
  }
  val io: XBarBundle = IO(new XBarBundle())
  val arbs: Seq[RRArbiter[MessageV3[T]]] = Seq.fill(p.numHosts)(Module(new RRArbiter(new MessageV3(p), p.numHosts)))
  for (ip <- 0 until p.numHosts) {
    io.ports(ip).in.ready := arbs.map{ _.io.in(ip).ready }.reduce{ _ || _ }
  }
  for (op <- 0 until p.numHosts) {
    arbs(op).io.in.zip(io.ports).foreach { case (arbIn, port) =>
      arbIn.bits <> port.in.bits
      arbIn.valid := port.in.valid && (port.in.bits.addr === op.U)
    }
    io.ports(op).out <> arbs(op).io.out
  }
}
