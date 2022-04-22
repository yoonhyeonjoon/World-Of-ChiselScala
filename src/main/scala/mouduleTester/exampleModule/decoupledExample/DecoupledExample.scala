package mouduleTester.exampleModule.decoupledExample

import chisel3._
import chisel3.tester.{testableClock, testableData}
import chisel3.util.{Counter, Decoupled, Valid}
import chiseltest.RawTester.test
import chiseltest.experimental.expose
import freechips.rocketchip.amba.axi4.AXI4Imp

//이 모듈은 실행되지 않음
//class LoopyCounter(width: Int) extends Module {
//  val io = IO(new Bundle {
//    val count = Output(UInt(width.W))
//  })
//  io.count := io.count + 1.U
//  //     io.count := RegNext(io.count + 1.U)
//}

class MakeValid(n: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val in  = Input(UInt(n.W))
    val out = Valid(UInt(n.W))
  })

  io.out.valid := io.en
  io.out.bits := io.in
}

class ValidReceiver(n: Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Valid(UInt(n.W)))
  })

  when (io.in.valid) {
    printf("  received %d\n", io.in.bits)
  }
}

class CountWhenReady(n: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val out = Decoupled(UInt())
  })
  val advanceCounter = io.en && io.out.ready
  val (count, wrap) = Counter(advanceCounter, n)
  io.out.bits := count

  io.out.valid := io.en

}

class CountWhenReady2(maxVal: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val out = Decoupled(UInt())
  })

  val (count, wrap) = Counter(io.out.fire, maxVal)

  val ff = expose(count)

  when (io.en)
  {
    io.out.enq(count)
  }.otherwise
  {
    io.out.noenq()
  }

}


object MakeValid extends App {
//  (new ChiselStage).emitVerilog(new CountWhenReady2(5))
//  (new ChiselStage).emitVerilog(new ValidReceiver(5))
//
//
//  val targetDir = "test_run_dir/gcd"
//  (new ElkStage).execute(
//    Array("-td", targetDir),
//    Seq(ChiselGeneratorAnnotation(() => new CountWhenReady2(5)))
//  )


  // println(getVerilog(new ValidReceiver(4)))
//  test(new DecoupledControlTest(4)) { c =>
//    for (cycle <- 0 until 20) {
//      c.io.en.poke(true.B)
//      if(cycle == 3)  c.io.out.ready.poke(true.B)
//
//
//      try{
//        println(s"cycle: $cycle : ${c.io.out.valid.peek()} / ${c.io.out.bits.peek()} / ${c.ff.peek()}")
//      }
//      catch { case e : Exception => }
//
//      c.clock.step()
//    }
//  }


}