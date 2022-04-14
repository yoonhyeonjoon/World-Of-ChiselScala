//package mouduleTester




//class ValidReceiver(n: Int) extends Module {
//  val io = IO(new Bundle {
//    val in = Flipped(Valid(UInt(n.W)))
//  })
//  when (io.in.valid) {
//    printf("  received %d\n", io.in.bits)
//  }
//}
//
//object FlippedTester extends App{
//  // println(getVerilog(new ValidReceiver(4)))
//
//  test(new ValidReceiver(4)){c =>
//      for (cycle <- 0 until 8) {
//        c.io.in.bits.poke(cycle.U)
//        println(s"cycle: $cycle")
//        c.io.in.valid.poke((cycle%2 == 0).B)
//        c.clock.step()
//      }
//    }
//
//
//}