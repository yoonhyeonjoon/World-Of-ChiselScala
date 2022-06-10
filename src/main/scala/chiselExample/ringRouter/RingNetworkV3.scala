package chiselExample.ringRouter

import chisel3._
import chisel3.util.RRArbiter
import runOption.ComplexRunner.generating


class CrossBarV3[T <: chisel3.Data](p: RingNetworkParams[T]) extends Network[T](p) {
  val arbs: Seq[RRArbiter[RingMessage[T]]] = Seq.fill(p.numHosts)(Module(new RRArbiter(new RingMessage(p), p.numHosts)))
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


class RingRouterV3[T <: chisel3.Data](p: RingNetworkParams[T], id: Int) extends Module {

  class RingRounterBundleV3 extends Bundle {
    val ports: Vec[RingPortIO[T]] = Vec(3, new RingPortIO(p)) // port(2) for host
  }

  val io: RingRounterBundleV3 = IO(new RingRounterBundleV3)

  def nextHop(destAddr: UInt): UInt = { // routing logic
    val distTowards0 = Mux(destAddr < id.U, id.U - destAddr, id.U + (p.numHosts.U - destAddr))
    val distTowards1 = Mux(destAddr > id.U, destAddr - id.U, (p.numHosts.U - id.U) + destAddr)
    Mux(destAddr === id.U, 2.U, Mux(distTowards0 < distTowards1, 0.U, 1.U))
  }

  val xbarParams: RingNetworkParams[RingMessage[T]] = RingNetworkParams(3, new RingMessage(p))

  val xbar = Module(new CrossBarV3(xbarParams))
  val portsRouted: IndexedSeq[RingPortIO[RingMessage[T]]] = io.ports map { port =>
    val routed = Wire(new RingPortIO(xbarParams))
    // INCOMPLETE, need to connect ready & valids
    routed.in.bits.addr := nextHop(port.in.bits.addr)
    routed.in.bits.data := port.in.bits
    port.out.bits := routed.out.bits.data
    routed
  }

  portsRouted.zip(xbar.io.ports).foreach{ case (extPort, xbarPort) => extPort <> xbarPort }

}

class RingNetworkV3[T <: chisel3.Data](p: RingNetworkParams[T]) extends Network[T](p) {
  val routers: Seq[RingRouterV3[T]] = Seq.tabulate(p.numHosts){ id => Module(new RingRouterV3(p, id)) }
//  routers.foldLeft(routers.last){
//    (prev, curr) =>
//      prev.io.ports(1).out <> curr.io.ports(0).in
//      prev.io.ports(1).in <> curr.io.ports(0).out
////      prev.io.ports(1) <> curr.io.ports(0)
//      curr
//  }

  routers(0).io.ports(1) <> routers(2).io.ports(1)
  routers(1).io.ports(1) <> routers(0).io.ports(1)
  routers(2).io.ports(1) <> routers(1).io.ports(1)


  routers.zip(io.ports).foreach { case (router, port) => router.io.ports(2) <> port }
}




object ComplexQueue extends App {
  //UInt(p.payloadSize.W)

    generating(new RingRouterV3(p = RingNetworkParams(5, UInt(5.W)), id = 0))
//    generating(new RingNetworkV3(p = RingNetworkParams(5, UInt(5.W))))
}