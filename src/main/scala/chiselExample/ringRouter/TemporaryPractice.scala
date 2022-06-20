package chiselExample.ringRouter.testtemporary

import chisel3._
import chisel3.util.{Decoupled, DecoupledIO, PriorityEncoder}
import runOption.ComplexRunner.generating

class Smalls(id: Int) extends Module {

  class SmallsBundle extends Bundle {
    val inFrontWard = Input(UInt(10.W))
    val inBackward = Input(UInt(10.W))
    val outFrontWard = Output(UInt(10.W))
    val outBackward = Output(UInt(10.W))
  }

  val io: SmallsBundle = IO(new SmallsBundle)

  val buffer = Reg(UInt(5.W))
  val buffer2 = Reg(UInt(5.W))

  when(io.inFrontWard > io.inBackward){
    buffer := io.inFrontWard - io.inBackward
    buffer2 := io.inFrontWard + io.inBackward
  }.otherwise{
    buffer := io.inFrontWard - io.inBackward
    buffer2 := io.inFrontWard + io.inBackward
  }
  io.outFrontWard := buffer //io.inFrontWard - io.inBackward
  io.outBackward := buffer2 //io.inFrontWard + io.inBackward
}

class CircularTester extends Module {


  class CircularBundle extends Bundle {
    val in = Input(UInt(10.W))
    val out = Output(UInt(10.W))
  }


  val io = IO(new CircularBundle)

  val smalls1 = Module(new Smalls(1))
  val smalls2 = Module(new Smalls(2))

  smalls1.io.inBackward := io.in
  smalls1.io.inFrontWard := smalls2.io.outBackward

  io.out := smalls2.io.outFrontWard

  class TestBundle extends Bundle {
    val inputTest: DecoupledIO[Vec[UInt]] = Flipped(Decoupled(Vec(2, UInt(10.W))))
    val inputTest2: Vec[DecoupledIO[UInt]] = Vec(2, Flipped(Decoupled(UInt(10.W))))
  }
  val ioTest = IO(new TestBundle)

//  val switch = WireInit(Bool(), true.B)
  ioTest.inputTest.ready := true.B
//  ioTest.inputTest.bits := Vec(2, 5.U)
  when(ioTest.inputTest.valid === true.B){
    smalls2.io.inBackward := smalls1.io.outFrontWard + ioTest.inputTest.bits(1)
  }.otherwise{
    smalls2.io.inBackward := smalls1.io.outFrontWard
  }

  for (i <- 0 until 2) {
    if (io.in == i.U) {
      ioTest.inputTest2(0).ready:= true.B
      ioTest.inputTest2(1).ready:= true.B
    }
    else{
      ioTest.inputTest2(0).ready:= true.B
      ioTest.inputTest2(1).ready:= true.B
    }
  }


  ioTest.inputTest2

  val ff = PriorityEncoder("b0110".U)

  smalls2.io.inFrontWard := ff


}


object CircularTester extends App {


//  generating(new RingRouterV1(RingNetworkParams(2, UInt(5.W)), 0))
  generating(new CircularTester())

}

//routers(0).io.host.in.valid := io.ports(0).in.valid
//routers(0).io.host.in.bits := io.ports(0).in.bits
//
//routers(0).io.out.ready := io.ports(0).out.ready
//routers(0).io.in.valid := io.ports(0).in.valid
//routers(0).io.in.bits := io.ports(0).in.bits
//
//
////  routers(0).io.host.in.valid := io.ports(0).in.valid
////  routers(0).io.host.in.bits := io.ports(0).in.bits
////  routers(0).io.host.out.ready := io.ports(0).out.ready
//routers(0).io.host.in <> io.ports(0).in
//routers(0).io.host.out <> io.ports(0).out
//
////  routers(1).io.out.ready := io.ports(1).out.ready
////  routers(1).io.in.bits := io.ports(1).in.bits
////  routers(1).io.in.valid := io.ports(1).in.valid
//routers(1).io.host.in <> io.ports(1).in
//routers(1).io.host.out <> io.ports(1).out
//
//io.ports(0).in.ready := routers(0).io.in.ready
//io.ports(0).out.bits := routers(0).io.out.bits
//io.ports(0).out.valid := routers(0).io.out.valid
//
//io.ports(1).in.ready := routers(1).io.in.ready
//io.ports(1).out.bits := routers(1).io.out.bits
//io.ports(1).out.valid := routers(1).io.out.valid
//
//routers(1).io.host.in.valid := io.ports(1).in.valid
//routers(1).io.host.in.bits := io.ports(1).in.bits
//routers(1).io.host.out.ready := io.ports(1).out.ready