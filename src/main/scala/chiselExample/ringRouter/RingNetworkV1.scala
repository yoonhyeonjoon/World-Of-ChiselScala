package chiselExample.ringRouter

import chisel3._
import chisel3.util.Decoupled
import chiselExample.crossBar.{MessageV3, PortIOV3, XBarParamsV3}

//First Implementation of a Ring Network
class RingRouterV1[T <: chisel3.Data](p: NetworkParams[T], id: Int) extends Module {
  val io = IO(new Bundle{
    val in = Flipped(Decoupled(new MessageRouter(p)))
    val out = Decoupled(new MessageRouter(p))
    val host = new PortIORouter(p)
  })
  val forMe: Bool = (io.in.bits.addr === id.U) && io.in.valid
  // INCOMPLETE, but gives spirit
  io.host.in.ready := io.out.ready
  io.host.out.valid := forMe
  io.host.out.bits := io.in.bits
  io.in.ready := io.host.out.ready && io.out.ready
  io.out.valid := (io.in.fire && !forMe) || io.host.in.fire
  io.out.bits := Mux(io.host.in.fire, io.host.in.bits, io.in.bits)
}

class RingNetworkV1[T <: chisel3.Data](p: NetworkParams[T]) extends Module {
  class RingNetworkV1Port extends Bundle{
    val ports: Vec[PortIOV3[T]] = Vec(p.numHosts, new PortIORouter(p))
  }

  val io: RingNetworkV1Port = IO(new RingNetworkV1Port())

  val routers: Seq[RingRouterV1[T]] = Seq.tabulate(p.numHosts){ id => new RingRouterV1(p, id)}

  routers.foldLeft(routers.last){
    (prev, curr) => prev.io.out <> curr.io.in
    curr
  }
  routers.zip(io.ports).foreach { case (router, port) => router.io.host <> port}
}
