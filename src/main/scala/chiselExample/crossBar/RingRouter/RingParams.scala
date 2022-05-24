package chiselExample.crossBar.RingRouter

import chisel3._
import chisel3.util._

case class NetworkParams[T <: chisel3.Data](numHosts: Int, payloadT: T) {
  def addrBitW() = log2Ceil(numHosts + 1)
}

class MessageRouter[T <: chisel3.Data](p: NetworkParams[T]) extends Bundle {
  val addr = UInt(p.addrBitW().W)
  val data = p.payloadT
}

class PortIORouter[T <: chisel3.Data](p: NetworkParams[T]) extends Bundle {
  val in = Flipped(Decoupled(new MessageRouter(p)))
  val out = Decoupled(new MessageRouter(p))
}

abstract class Network[T <: chisel3.Data](p: NetworkParams[T]) extends Module {
  val io = IO(new Bundle {
    val ports = Vec(p.numHosts, new PortIORouter(p))
  })
}

class MessageNetwork[T <: chisel3.Data](p: NetworkParams[T]) extends Bundle {
  val addr = UInt(p.addrBitW().W)
  val data = p.payloadT
}


class PortIONetwork[T <: chisel3.Data](p: NetworkParams[T]) extends Bundle {
  val in = Flipped(Decoupled(new MessageNetwork(p)))
  val out = Decoupled(new MessageNetwork(p))
}
