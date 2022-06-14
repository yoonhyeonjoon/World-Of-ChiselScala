package chiselExample.ringRouter

import chisel3._
import chisel3.util.{Decoupled, DecoupledIO}
import runOption.ComplexRunner.generating

//First Implementation of a Ring Network
class RingRouterV1[T <: chisel3.Data](p: RingNetworkParams[T], id: Int) extends Module {

  class RingRouterV1Bundle extends Bundle {
    val in: DecoupledIO[RingMessage[T]] = Flipped(Decoupled(new RingMessage(p)))
    val out: DecoupledIO[RingMessage[T]] = Decoupled(new RingMessage(p))
    val host = new RingPortIO(p)
  }

  val io: RingRouterV1Bundle = IO(new RingRouterV1Bundle)
  val forMe: Bool = (io.in.bits.addr === id.U) && io.in.valid

  io.in <> io.out

  io.host.in.ready := io.out.ready
  io.host.out.valid := forMe
  io.host.out.bits := io.in.bits
  io.in.ready := io.host.out.ready && io.out.ready
  io.out.valid := (io.in.fire && !forMe) || io.host.in.fire
  io.out.bits := Mux(io.host.in.fire, io.host.in.bits, io.in.bits)
}

class RingNetworkV1[T <: chisel3.Data](p: RingNetworkParams[T]) extends Module {

  class RingNetworkV1Port extends Bundle {
    val ports: Vec[RingPortIO[T]] = Vec(p.numHosts, new RingPortIO(p))
  }

  val io: RingNetworkV1Port = IO(new RingNetworkV1Port())
  val routers: Seq[RingRouterV1[T]] = Seq.tabulate(p.numHosts){ id => Module(new RingRouterV1(p, id))}

  routers(0).io.host.in.valid := io.ports(0).in.valid
  routers(0).io.host.in.bits := io.ports(0).in.bits

//  routers(0).io.out.ready := io.ports(0).out.ready
//  routers(0).io.in.valid := io.ports(0).in.valid
//  routers(0).io.in.bits := io.ports(0).in.bits
  routers(0).io.in <> io.ports(0).in
  routers(0).io.out <> io.ports(0).out
  //  io.ports(1).in.ready := routers(1).io.in.ready
  //  io.ports(1).out.bits := routers(1).io.out.bits
  //  io.ports(1).out.valid := routers(1).io.out.valid
  routers(1).io.in <> io.ports(1).in
  routers(1).io.out <> io.ports(1).out


//  routers(0).io.host.in.valid := io.ports(0).in.valid
//  routers(0).io.host.in.bits := io.ports(0).in.bits
//  routers(0).io.host.out.ready := io.ports(0).out.ready
  routers(0).io.host.in <> io.ports(0).in
  routers(0).io.host.out <> io.ports(0).out
  //  routers(1).io.host.in.valid := io.ports(1).in.valid
  //  routers(1).io.host.in.bits := io.ports(1).in.bits
  //  routers(1).io.host.out.ready := io.ports(1).out.ready
  routers(1).io.host.in <> io.ports(1).in
  routers(1).io.host.out <> io.ports(1).out

////  io.ports(0).in.ready := routers(0).io.in.ready
////  io.ports(0).out.bits := routers(0).io.out.bits
////  io.ports(0).out.valid := routers(0).io.out.valid
//  routers(0).io.in <> io.ports(0).in
//  routers(0).io.out <> io.ports(0).out


}


object RingNetworkV1Runnable extends App {

//  generating(new RingRouterV1(RingNetworkParams(2, UInt(5.W)), 0))
  generating(new RingNetworkV1(RingNetworkParams(2, UInt(5.W))))


}