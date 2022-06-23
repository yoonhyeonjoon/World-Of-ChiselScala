package chiselExample.ringRouter

import chisel3.{Bundle, Module, UInt, Vec, fromIntToWidth}
import runOption.ComplexRunner.generating



class RingNetworkV2[T <: chisel3.Data](p: RingNetworkParams[T]) extends Network[T](p) {
  val routers: Seq[RingRouterV1[T]] = Seq.tabulate(p.numHosts){ id => Module(new RingRouterV1(p, id))}

  routers.foldLeft(routers.last){
    (prev, curr) => prev.io.out <> curr.io.in
      curr
  }

  routers.zip(io.ports).foreach {
    case (router, port) =>
      router.io.host <> port
      router.io.out <> port.out
  }

}


object RingNetworkV2 extends App {
  //  generating(new RingRouterV1(RingNetworkParams(2, UInt(5.W)), 0))
  generating(new RingNetworkV2(RingNetworkParams(20, UInt(5.W))))
}