//package chiselExample.exampleModule.queue
//
//import chisel3._
//import chisel3.tester.{testableClock, testableData}
//import chisel3.util.Decoupled
//import chiseltest.RawTester.test
//import chiseltest.experimental.expose
//import freechips.rocketchip.util.AsyncQueue
//import functional.MockClockResetGenerator
//import runOption.ComplexRunner.generating
//
//import scala.util.Random
//
//class AsyncQueueExample extends Module{
//
//  class InnerClass extends Bundle{
//    val input = Flipped(Decoupled(UInt(5.W)))
//    val output = Decoupled(UInt(5.W))
//  }
//
//  val io: InnerClass = IO(new InnerClass)
//
//  val crossing = Module(new AsyncQueue(UInt(100.W)))//, AsyncQueueParams.singleton(3)))
//
//  val iClock = Module(new MockClockResetGenerator(2))
//  val iClock2 = Module(new MockClockResetGenerator(4))
//
//  crossing.io.enq_clock := iClock.io.clock.asClock//iClock.io.clock.asClock
//  crossing.io.enq_reset := reset//iClock.io.reset
//  crossing.io.enq <> io.input
////  crossing.io.enq.valid := true.B
////  crossing.io.enq.bits  := 5.U
//
//  crossing.io.deq_clock := clock
//  crossing.io.deq_reset := reset
//  crossing.io.deq <> io.output
//  //crossing.io.deq.ready := true.B
//
//  val iWiring = WireInit(Bool(), false.B)
//  iWiring := iClock.io.clock
//  val exposeSwitch = expose(iWiring)
//
////  val iWiring2 = WireInit(UInt(), 5.U)
////  iWiring2 := crossing.source.io.async.index.getOrElse{ 10.U }
////  val exposeSwitch2 = expose(iWiring2)
//
//}
//
//object AsyncQueueExample extends App {
//
//
//  generating(new AsyncQueueExample())
//  test(new AsyncQueueExample()) { c =>
//
//    c.io.input.valid.poke(true.B)
//    c.io.output.ready.poke(true.B)
//
//    for (cycle <- 0 until 200) {
//      //      SubClockCycling(cycle, 4, c.iClock.io.clockB) // if(cycle%2 == 0) c.io.clockB.poke(true.B) else  c.io.clockB.poke(false.B)
//      val ranval = Random.nextInt(30)
//      c.io.input.bits.poke(ranval.U)
//      println(
//        s"clock : ${cycle} : iclock : ${c.exposeSwitch.peek()} " +
////          s"uint : ${c.exposeSwitch2.peek()} " +
//          s"${Console.GREEN} ${c.io.input.bits.peek()}  ${Console.RESET}" +
//          s"${Console.RED} output : ${c.io.output.bits.peek()} ${Console.RESET}"
//      )
//
//      c.clock.step()
//    }
//
//    //      c.io.en.poke(false.B)
//  }
//}
