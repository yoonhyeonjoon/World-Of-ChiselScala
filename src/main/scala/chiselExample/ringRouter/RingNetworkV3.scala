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
  val xbar: CrossBarV3[RingMessage[T]] = Module(new CrossBarV3(xbarParams))

  val portsRouted: IndexedSeq[RingPortIO[RingMessage[T]]] = io.ports map { port =>
    val routed = Wire(new RingPortIO(xbarParams))
    routed.in.bits.addr := nextHop(port.in.bits.addr)
    routed.in.bits.data := port.in.bits
    routed.in.valid :=  port.in.valid

    routed.in.ready := true.B
    port.in.ready := routed.in.ready

    routed.out.ready := port.out.ready
    routed.out.valid := port.in.valid
    port.out.valid := true.B

    port.out.bits := routed.out.bits.data

    routed
  }

  portsRouted.zip(xbar.io.ports).foreach {
    case (extPort, xbarPort) => extPort <> xbarPort
  }

}

class RingNetworkV3[T <: chisel3.Data](p: RingNetworkParams[T]) extends Network[T](p) {

  val routers: Seq[RingRouterV3[T]] = Seq.tabulate(p.numHosts){ id => Module(new RingRouterV3(p, id)) }
  routers.foldLeft(routers.last){
    (prev, curr) =>

      val outReady0    =  RegNext(curr.io.ports(0).out.ready)
      val outValid0    =  RegNext(curr.io.ports(0).out.valid)
      val outBitsAddr0 =  RegNext(curr.io.ports(0).out.bits.addr)
      val outBitsData0 =  RegNext(curr.io.ports(0).out.bits.data)

      val inReady0     =  RegNext(curr.io.ports(0).in.ready)
      val inValid0     =  RegNext(curr.io.ports(0).in.valid)
      val inBitsAddr0  =  RegNext(curr.io.ports(0).in.bits.addr)
      val inBitsData0  =  RegNext(curr.io.ports(0).in.bits.data)

      inValid0 := prev.io.ports(1).out.valid
      inBitsAddr0 := prev.io.ports(1).out.bits.addr
      inBitsData0 := prev.io.ports(1).out.bits.data
      prev.io.ports(1).out.ready := inReady0

      prev.io.ports(1).in.valid := outValid0
      prev.io.ports(1).in.bits.addr := outBitsAddr0
      prev.io.ports(1).in.bits.data := outBitsData0
      outReady0 := prev.io.ports(1).in.ready

      val outReady1    =  RegNext(curr.io.ports(1).out.ready)
      val outValid1    =  RegNext(curr.io.ports(1).out.valid)
      val outBitsAddr1 =  RegNext(curr.io.ports(1).out.bits.addr)
      val outBitsData1 =  RegNext(curr.io.ports(1).out.bits.data)

      val inReady1     =  RegNext(curr.io.ports(1).in.ready)
      val inValid1     =  RegNext(curr.io.ports(1).in.valid)
      val inBitsAddr1  =  RegNext(curr.io.ports(1).in.bits.addr)
      val inBitsData1  =  RegNext(curr.io.ports(1).in.bits.data)

      inValid1 := prev.io.ports(0).out.valid
      inBitsAddr1 := prev.io.ports(0).out.bits.addr
      inBitsData1 := prev.io.ports(0).out.bits.data
      prev.io.ports(0).out.ready := inReady1

      prev.io.ports(0).in.valid := outValid1
      prev.io.ports(0).in.bits.addr := outBitsAddr1
      prev.io.ports(0).in.bits.data := outBitsData1
      outReady1 := prev.io.ports(0).in.ready

      curr
  }

  routers.zip(io.ports).foreach {
    case (router, port) => router.io.ports(2) <> port
  }

}




object RingNetworkV3 extends App {
//    generating(new RingRouterV3(p = RingNetworkParams(5, UInt(5.W)), id = 0))
    generating(new RingNetworkV3(p = RingNetworkParams(10, UInt(5.W))))
}