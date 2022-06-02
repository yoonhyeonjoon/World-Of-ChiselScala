package chiselExample.crossBar

import chisel3._
import chisel3.util._

case class XBarParamsV2(numHosts: Int, payloadSize: Int) {
  def addrBitW() = log2Ceil(numHosts + 1)
}

class MessageV2(p: XBarParamsV2) extends Bundle {
  val addr: UInt = UInt(p.addrBitW().W)
  val data: UInt = UInt(p.payloadSize.W)
}

class PortIOV2(p: XBarParamsV2) extends Bundle {
  val in: DecoupledIO[MessageV2] = Flipped(Decoupled(new MessageV2(p)))
  val out: DecoupledIO[MessageV2] = Decoupled(new MessageV2(p))
}

class XBarV2(p: XBarParamsV2) extends Module {
  val io = IO(new Bundle {
    val ports   = Vec(p.numHosts, new PortIOV2(p))
  })
  val arbs = Seq.fill(p.numHosts)(Module(new RRArbiter(new MessageV2(p), p.numHosts)))
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

// declaration example: new XBar(XBarParams(4,64))