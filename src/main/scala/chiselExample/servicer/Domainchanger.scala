//package chiselExample.servicer
//
//import chisel3._
//import chisel3.tester.{testableClock, testableData}
//import chiseltest.RawTester.test
//import runOption.ComplexRunner.generating
//
//class Domainchanger extends Module {
//
//  class DomainchangerBundle extends Bundle {
//    val in: Vec[UInt] = Input(Vec(5,UInt(7.W)))
//    val out: Vec[UInt] = Output(Vec(10, UInt(10.W)))
////    val small : UInt = Output(UInt(7.W))
////    val small2 : UInt = Output(UInt(7.W))
//  }
//
//  val io: DomainchangerBundle = IO(new DomainchangerBundle)
//
//  printf("  %d\n", io.in(0))
//  printf("  %d\n", io.in(1))
//  printf("  %d\n", io.in(2))
//  printf("  %d\n", io.in(3))
//  printf("  %d\n", io.in(4))
//
//  RegNext(io.in)
//
//  val container: Seq[Seq[UInt]] = Seq.fill(10)(Seq.fill(10)(RegInit(UInt(120.W), 0.U)))
//
////   when(io.in(0) === 1.U){
////
////   }.elsewhen(io.in(0) === 2.U){
////
////   }.elsewhen(io.in(0) === 3.U){
////
////   }.elsewhen(io.in(0) === 4.U){
////
////   }.elsewhen(io.in(0) === 5.U){
////
////   }.otherwise{
////
////   }
//
//
//  for(anInput <- 0 until io.in.length)
//  {
//    for(p <- 0 until 10) {
//      when(io.in(anInput) === p.U) {
//        container(anInput)(p) := container(anInput)(p) + 1.U
//      }
//    }
//  }
//
//  container.foreach{ aContainer =>
//
//  }
//
//
//
////  for (p <- 0 until io.in.length) {
////    io.out.zipWithIndex.foreach { case (elem, idx) =>
////       when(idx.asUInt === io.in(p)){
////         container(p) := container(p) + 1.U
////       }
////    }
////  }
//
//  io.out := container
////
////  val ff: UInt = PriorityEncoder(2.U)
////
////  val signal: Vec[Bool] = Wire(Vec(7, Bool()))
////  signal(0) := false.B
////  signal(1) := false.B
////  signal(2) := false.B
////  signal(3) := false.B
////  signal(4) := true.B
////  signal(5) := true.B
////  signal(6) := true.B
////
////  val gg: UInt = PriorityEncoder(signal)
////
//////  gg.foreach(
////    printf(" tt : %d \n ", gg)
//////  )
//
//
////  io.small := ff
////  io.small2 := ff
//
//}
//
//
//object Domainchanger extends App {
//
//  generating(new Domainchanger())
//
//  test(new Domainchanger()) { c =>
//
//    c.io.in(0).poke(1.U)
//    c.io.in(1).poke(2.U)
//    c.io.in(2).poke(3.U)
//    c.io.in(3).poke(4.U)
//    c.io.in(4).poke(5.U)
//
//    c.clock.step()
//
////    for (p <- 0 until c.io.in.length) {
////      println("sequential : %d \n", c.container(p).peek())
////    }
//
//
//    c.io.in(0).poke(5.U)
//    c.io.in(1).poke(6.U)
//    c.io.in(2).poke(7.U)
//    c.io.in(3).poke(8.U)
//    c.io.in(4).poke(1.U)
//
//    c.clock.step()
//
//    c.io.in(0).poke(2.U)
//    c.io.in(1).poke(3.U)
//    c.io.in(2).poke(4.U)
//    c.io.in(3).poke(5.U)
//    c.io.in(4).poke(3.U)
//
//    c.clock.step()
//
//    c.io.in(0).poke(7.U)
//    c.io.in(1).poke(6.U)
//    c.io.in(2).poke(6.U)
//    c.io.in(3).poke(4.U)
//    c.io.in(4).poke(2.U)
//
//    c.clock.step()
//
////    println(s"1> ${c.io.out(4).peek()}")
//
//  }
//}
//
////routers(0).io.host.in.valid := io.ports(0).in.valid
////routers(0).io.host.in.bits := io.ports(0).in.bits
////
////routers(0).io.out.ready := io.ports(0).out.ready
////routers(0).io.in.valid := io.ports(0).in.valid
////routers(0).io.in.bits := io.ports(0).in.bits
////
////
//////  routers(0).io.host.in.valid := io.ports(0).in.valid
//////  routers(0).io.host.in.bits := io.ports(0).in.bits
//////  routers(0).io.host.out.ready := io.ports(0).out.ready
////routers(0).io.host.in <> io.ports(0).in
////routers(0).io.host.out <> io.ports(0).out
////
//////  routers(1).io.out.ready := io.ports(1).out.ready
//////  routers(1).io.in.bits := io.ports(1).in.bits
//////  routers(1).io.in.valid := io.ports(1).in.valid
////routers(1).io.host.in <> io.ports(1).in
////routers(1).io.host.out <> io.ports(1).out
////
////io.ports(0).in.ready := routers(0).io.in.ready
////io.ports(0).out.bits := routers(0).io.out.bits
////io.ports(0).out.valid := routers(0).io.out.valid
////
////io.ports(1).in.ready := routers(1).io.in.ready
////io.ports(1).out.bits := routers(1).io.out.bits
////io.ports(1).out.valid := routers(1).io.out.valid
////
////routers(1).io.host.in.valid := io.ports(1).in.valid
////routers(1).io.host.in.bits := io.ports(1).in.bits
////routers(1).io.host.out.ready := io.ports(1).out.ready