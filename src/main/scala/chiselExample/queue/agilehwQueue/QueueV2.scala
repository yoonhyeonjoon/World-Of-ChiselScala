package chiselExample.queue.agilehwQueue

import chisel3._
import chisel3.tester._
import chisel3.util.{Decoupled, PriorityEncoder}
import chiseltest.RawTester.test
import runOption.ComplexRunner.generating



class MyQueueV2(numEntries: Int, bitWidth: Int) extends Module {
  val io: QueueIO = IO(new QueueIO(bitWidth))
  require(numEntries > 0)
  // enqueue into lowest empty and dequeue from index 0 (head)
  val entries = Reg(Vec(numEntries, UInt(bitWidth.W)))
  val fullBits = RegInit(VecInit(Seq.fill(numEntries)(false.B)))
  val emptyBits: IndexedSeq[Bool] = fullBits map { !_ } // exchanging all bits true <-> false
  io.enq.ready := emptyBits reduce { _ || _ } // any empties? //ex :  val stall = src1busy || src2busy	Logical OR
  io.deq.valid := fullBits.head
  io.deq.bits := entries.head
  when (io.deq.fire) { // dequeue & shift up
    fullBits.last := false.B
    for (i <- 0 until numEntries - 1) {
      entries(i) := entries(i+1)
      fullBits(i) := fullBits(i+1)
    }
  }
  when (io.enq.fire) { // priority enqueue
    val currFreeIndex = PriorityEncoder(emptyBits)
    val writeIndex = Mux(io.deq.fire, currFreeIndex - 1.U, currFreeIndex)
    entries(writeIndex) := io.enq.bits
    fullBits(writeIndex) := true.B
  }
}


object V2QueueRunner extends App{

   generating(new MyQueueV2(4, 8))

  def simCycle(qm: QueueModel, c: MyQueueV2, enqValid: Boolean, deqReady: Boolean, enqData: Int=0) {
    qm.deqReady = deqReady
    c.io.deq.ready.poke(qm.deqReady.B)
    if (c.io.deq.valid.peek.litToBoolean && deqReady) {
      assert(qm.deqValid())
      c.io.deq.bits.expect(qm.attemptDeq().U)
    }
    c.io.enq.ready.expect(qm.enqReady().B)
    c.io.enq.valid.poke(enqValid.B)
    c.io.enq.bits.poke(enqData.U)
    if (enqValid)
      qm.attemptEnq(enqData)
    c.clock.step()
    println(qm.mq)
  }

  test(new MyQueueV2(4, 8)) { c =>
    val qm = new QueueModel(4)
    simCycle(qm, c, false, false)
    simCycle(qm, c, true, false, 1)
    simCycle(qm, c, false, true)
  }


}