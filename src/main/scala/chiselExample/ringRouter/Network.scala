package chiselExample.ringRouter

import chisel3.{Bundle, Module, Vec}

abstract class Network[T <: chisel3.Data](p: RingNetworkParams[T]) extends Module {
  class NetWorkBundle extends Bundle {
    val ports: Vec[RingPortIO[T]] = Vec(p.numHosts, new RingPortIO(p))
  }
  val io: NetWorkBundle = IO(new NetWorkBundle)
}