package chiselExample.ringRouter

import chisel3._
import chisel3.util.RRArbiter


class XBarRingRouter[T <: chisel3.Data](p: NetworkParams[T]) extends Network[T](p) {
  val arbs: Seq[RRArbiter[MessageRouter[T]]] = Seq.fill(p.numHosts)(Module(new RRArbiter(new MessageRouter(p), p.numHosts)))
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

//RingRouter Revised for Bidirectional & Use of XBar
class RingRouterV3[T <: chisel3.Data](p: NetworkParams[T], id: Int) extends Module {
  val io = IO(new Bundle{
    val ports = Vec(3, new PortIORouter(p)) // port(2) for host
  })

  def nextHop(destAddr: UInt): UInt = { // routing logic
    val distTowards0 = Mux(destAddr < id.U, id.U - destAddr, id.U + (p.numHosts.U - destAddr))
    val distTowards1 = Mux(destAddr > id.U, destAddr - id.U, (p.numHosts.U - id.U) + destAddr)
    Mux(destAddr === id.U, 2.U, Mux(distTowards0 < distTowards1, 0.U, 1.U))
  }

  val xbarParams = NetworkParams(3, new MessageRouter(p))
  val xbar = new XBarRingRouter(xbarParams)
  val portsRouted = io.ports map { port =>
    val routed = Wire(new PortIORouter(xbarParams))
    // INCOMPLETE, need to connect ready & valids
    routed.in.bits.addr := nextHop(port.in.bits.addr)
    routed.in.bits.data := port.in.bits
    port.out.bits := routed.out.bits.data
    routed
  }

  portsRouted.zip(xbar.io.ports).foreach{ case (extPort, xbarPort) => extPort <> xbarPort }
}

class RingNetworkV3[T <: chisel3.Data](p: NetworkParams[T]) extends Network[T](p) {
  val routers = Seq.tabulate(p.numHosts){ id => new RingRouterV3(p, id)}
  routers.foldLeft(routers.last){ (prev, curr) => prev.io.ports(1) <> curr.io.ports(0); curr }
  routers.zip(io.ports).foreach { case (router, port) => router.io.ports(2) <> port}
}

//Making a Network Factory (1/2) 부터 확인