package chiselExample.crossBar

import chisel3._
import chisel3.experimental.Analog
import chisel3.util._
import runOption.ComplexRunner.generating

case class XBarParamsV3Test[T <: chisel3.Data](numHosts: Int, payloadT: T) {
  def addrBitW(): Int = log2Ceil(numHosts + 1)
}

class MessageV3Test[T <: chisel3.Data](p: XBarParamsV3Test[T]) extends Bundle {
  val addr: UInt = UInt(p.addrBitW().W)
  val data: T = p.payloadT.cloneType
}

class PortIOV3Test[T <: chisel3.Data](p: XBarParamsV3Test[T]) extends Bundle {
  val in: DecoupledIO[MessageV3Test[T]] = Flipped(Decoupled(new MessageV3Test(p)))
  val out: DecoupledIO[MessageV3Test[T]] = Decoupled(new MessageV3Test(p))
}

class XBarV3Test[T <: chisel3.Data](p: XBarParamsV3Test[T]) extends Module {


  class XBarBundle extends Bundle{
    val ports: Vec[PortIOV3Test[T]] = Vec(p.numHosts, new PortIOV3Test(p))
  }
  val io: XBarBundle = IO(new XBarBundle())
  val arbs: Seq[RRArbiter[MessageV3Test[T]]] = Seq.fill(p.numHosts)(
    Module(new RRArbiter(new MessageV3Test(p), p.numHosts))
  )
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

object XBarV3Test extends App {
  val caseClass: XBarParamsV3Test[UInt] = XBarParamsV3Test(numHosts = 5, payloadT = UInt(4.W))
  generating(new XBarV3Test(caseClass))
}