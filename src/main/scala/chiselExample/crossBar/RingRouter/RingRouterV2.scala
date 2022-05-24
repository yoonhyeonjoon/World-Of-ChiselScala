package chiselExample.crossBar.RingRouter

import chisel3._
import chisel3.util.{Decoupled, DecoupledIO, RRArbiter}
import chiselExample.crossBar._

class XBarRingRouter[T <: chisel3.Data](p: NetworkParams[T]) extends Network[T](p) {
  val arbs = Seq.fill(p.numHosts)(Module(new RRArbiter(new MessageRouter(p), p.numHosts)))
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


//RingNetwork Redone with Inherited Interface
class RingRouterV2[T <: chisel3.Data](p: NetworkParams[T], id: Int) extends Module {
  val io = IO(new Bundle{
    val in = Flipped(Decoupled(new MessageRouter(p)))
    val out = Decoupled(new MessageRouter(p))
    val host = new PortIORouter(p)
  })
  val forMe = (io.in.bits.addr === id.U) && io.in.valid
  // INCOMPLETE, but gives spirit
  io.host.in.ready := io.out.ready
  io.host.out.valid := forMe
  io.host.out.bits := io.in.bits
  io.in.ready := io.host.out.ready && io.out.ready
  io.out.valid := (io.in.fire && !forMe) || io.host.in.fire
  io.out.bits := Mux(io.host.in.fire, io.host.in.bits, io.in.bits)
}

class RingNetwork[T <: chisel3.Data](p: NetworkParams[T]) extends Network[T](p) {
  val routers = Seq.tabulate(p.numHosts){ id => new RingRouterV2(p, id)}
  routers.foldLeft(routers.last){ (prev, curr) => prev.io.out <> curr.io.in; curr}
  routers.zip(io.ports).foreach { case (router, port) => router.io.host <> port}
}