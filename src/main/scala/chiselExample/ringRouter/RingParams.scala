package chiselExample.ringRouter

import chisel3._
import chisel3.util._

case class RingNetworkParams[T <: chisel3.Data](numHosts: Int, payloadT: T) {
  def addrBitW(): Int = log2Ceil(numHosts + 1)
}

class RingMessage[T <: chisel3.Data](p: RingNetworkParams[T]) extends Bundle {
  val addr: UInt = UInt(p.addrBitW().W)
  val data: T = p.payloadT.cloneType
}

class RingPortIO[T <: chisel3.Data](p: RingNetworkParams[T]) extends Bundle {
  val in: DecoupledIO[RingMessage[T]] = Flipped(Decoupled(new RingMessage(p)))
  val out: DecoupledIO[RingMessage[T]] = Decoupled(new RingMessage(p))
}
