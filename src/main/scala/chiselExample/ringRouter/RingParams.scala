package chiselExample.ringRouter

import chisel3._
import chisel3.util._

case class NetworkParams[T <: chisel3.Data](numHosts: Int, payloadT: T) {
  def addrBitW(): Int = log2Ceil(numHosts + 1)
}

class MessageRouter[T <: chisel3.Data](p: NetworkParams[T]) extends Bundle {
  val addr: UInt = UInt(p.addrBitW().W)
  val data: T = p.payloadT
}

class PortIORouter[T <: chisel3.Data](p: NetworkParams[T]) extends Bundle {
  val in: DecoupledIO[MessageRouter[T]] = Flipped(Decoupled(new MessageRouter(p)))
  val out: DecoupledIO[MessageRouter[T]] = Decoupled(new MessageRouter(p))
}


class MessageNetwork[T <: chisel3.Data](p: NetworkParams[T]) extends Bundle {
  val addr: UInt = UInt(p.addrBitW().W)
  val data: T = p.payloadT
}

class PortIONetwork[T <: chisel3.Data](p: NetworkParams[T]) extends Bundle {
  val in: DecoupledIO[MessageNetwork[T]] = Flipped(Decoupled(new MessageNetwork(p)))
  val out: DecoupledIO[MessageNetwork[T]] = Decoupled(new MessageNetwork(p))
}
