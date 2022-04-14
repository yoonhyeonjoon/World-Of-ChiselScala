import Chisel.fromBooleanToLiteral
import chisel3.tester.{testableClock, testableData}
import chiseltest.RawTester.test
import org.scalatest.flatspec.AnyFlatSpec
import mouduleTester.CountIntoQueue

class CountIntoQueueSpec extends AnyFlatSpec {

    test(new CountIntoQueue(3,1,false, true)) { c =>
      c.io.en.poke(true.B)
      c.io.out.ready.poke(false.B)
      for (cycle <- 0 until 4) {   // fill up queue
        println(s"f count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
        c.clock.step()
      }
      println()
      c.io.en.poke(false.B)
      c.io.out.ready.poke(true.B)
      for (cycle <- 0 until 4) {   // drain queue
        println(s"d count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
        c.clock.step()
      }
      println()
      c.io.en.poke(true.B)
      for (cycle <- 0 until 3) {   // simultaneous
        println(s"d count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
        c.clock.step()
      }
    }

    test(new CountIntoQueue(3,1,false,true)) { c =>
      c.io.en.poke(true.B)
      c.io.out.ready.poke(false.B)
      for (cycle <- 0 until 4) {   // fill up queue
        println(s"f count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
        c.clock.step()
      }
      println()
      c.io.en.poke(false.B)
      c.io.out.ready.poke(true.B)
      for (cycle <- 0 until 4) {   // drain queue
        println(s"d count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
        c.clock.step()
      }
      println()
      c.io.en.poke(true.B)
      for (cycle <- 0 until 3) {   // simultaneous
        println(s"d count:${c.io.count.peek()} out:${c.io.out.bits.peek()} v:${c.io.out.valid.peek()}")
        c.clock.step()
      }
    }

}