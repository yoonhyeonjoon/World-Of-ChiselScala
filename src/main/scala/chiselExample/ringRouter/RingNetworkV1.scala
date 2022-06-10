package chiselExample.ringRouter

import chisel3._
import chisel3.util.{Decoupled, DecoupledIO}
import runOption.ComplexRunner.generating

//First Implementation of a Ring Network
class RingRouterV1[T <: chisel3.Data](p: RingNetworkParams[T], id: Int) extends Module {

  class RingRouterV1Bundle extends Bundle{
    val in: DecoupledIO[RingMessage[T]] = Flipped(Decoupled(new RingMessage(p)))
    val out: DecoupledIO[RingMessage[T]] = Decoupled(new RingMessage(p))
    val host = new RingPortIO(p)
  }

  val io: RingRouterV1Bundle = IO(new RingRouterV1Bundle)
  val forMe: Bool = (io.in.bits.addr === id.U) && io.in.valid

  io.host.in.ready := io.out.ready
  io.host.out.valid := forMe
  io.host.out.bits := io.in.bits
  io.in.ready := io.host.out.ready && io.out.ready
  io.out.valid := (io.in.fire && !forMe) || io.host.in.fire
  io.out.bits := Mux(io.host.in.fire, io.host.in.bits, io.in.bits)
}

class RingNetworkV1[T <: chisel3.Data](p: RingNetworkParams[T]) extends Module {

  class RingNetworkV1Port extends Bundle
  {
    val ports: Vec[RingPortIO[T]] = Vec(p.numHosts, new RingPortIO(p))
  }

  val io: RingNetworkV1Port = IO(new RingNetworkV1Port())

  val routers: Seq[RingRouterV1[T]] = Seq.tabulate(p.numHosts){ id => Module(new RingRouterV1(p, id))}

//  routers.foldLeft(routers.last){
//    (prev, curr) => prev.io.out <> curr.io.in
//    curr
//  }
//  routers(0).io.in <> routers(1).io.out
//  routers(0).io.out <> routers(1).io.in

  routers(1).io.in.bits  := routers(0).io.in.bits
  routers(1).io.in.valid := routers(0).io.in.valid

//  <> routers(1).io.out

  routers.zip(io.ports).foreach { case (router, port) => router.io.host <> port}
}


object RingNetworkV1 extends App {

  //  generating(new RingRouterV1(RingNetworkParams(2, UInt(5.W)), 0))
  generating(new RingNetworkV1(RingNetworkParams(2, UInt(5.W))))
}