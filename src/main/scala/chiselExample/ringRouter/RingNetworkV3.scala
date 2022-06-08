//package chiselExample.ringRouter
//
//import chisel3._
//import chisel3.util.RRArbiter
//
//
//class CrossBarV3[T <: chisel3.Data](p: RingNetworkParams[T]) extends Network[T](p) {
//  val arbs: Seq[RRArbiter[RingMessage[T]]] = Seq.fill(p.numHosts)(Module(new RRArbiter(new RingMessage(p), p.numHosts)))
//  for (ip <- 0 until p.numHosts) {
//    io.ports(ip).in.ready := arbs.map{ _.io.in(ip).ready }.reduce{ _ || _ }
//  }
//  for (op <- 0 until p.numHosts) {
//    arbs(op).io.in.zip(io.ports).foreach { case (arbIn, port) =>
//      arbIn.bits <> port.in.bits
//      arbIn.valid := port.in.valid && (port.in.bits.addr === op.U)
//    }
//    io.ports(op).out <> arbs(op).io.out
//  }
//}
//
////RingRouter Revised for Bidirectional & Use of XBar
//class RingRouterV3[T <: chisel3.Data](p: RingNetworkParams[T], id: Int) extends Module {
//  class RingRounterBundleV3 extends {
//    val ports: Vec[RingPortIO[T]] = Vec(3, new RingPortIO(p)) // port(2) for host
//  }
//  val io: RingRounterBundleV3 = IO(new RingRounterBundleV3)
//
//  def nextHop(destAddr: UInt): UInt = { // routing logic
//    val distTowards0 = Mux(destAddr < id.U, id.U - destAddr, id.U + (p.numHosts.U - destAddr))
//    val distTowards1 = Mux(destAddr > id.U, destAddr - id.U, (p.numHosts.U - id.U) + destAddr)
//    Mux(destAddr === id.U, 2.U, Mux(distTowards0 < distTowards1, 0.U, 1.U))
//  }
//
//  val xbarParams: RingNetworkParams[RingMessage[T]] = RingNetworkParams(3, new RingMessage(p))
//
//  val xbar = new CrossBarV3(xbarParams)
//  val portsRouted: IndexedSeq[RingPortIO[RingMessage[T]]] = io.ports map { port =>
//    val routed = Wire(new RingPortIO(xbarParams))
//    // INCOMPLETE, need to connect ready & valids
//    routed.in.bits.addr := nextHop(port.in.bits.addr)
//    routed.in.bits.data := port.in.bits
//    port.out.bits := routed.out.bits.data
//    routed
//  }
//
//  portsRouted.zip(xbar.io.ports).foreach{ case (extPort, xbarPort) => extPort <> xbarPort }
//}
//
//class RingNetworkV3[T <: chisel3.Data](p: RingNetworkParams[T]) extends Network[T](p) {
//  val routers: Seq[RingRouterV3[T]] = Seq.tabulate(p.numHosts){ id => new RingRouterV3(p, id)}
//  routers.foldLeft(routers.last){ (prev, curr) => prev.io.ports(1) <> curr.io.ports(0); curr }
//  routers.zip(io.ports).foreach { case (router, port) => router.io.ports(2) <> port}
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
