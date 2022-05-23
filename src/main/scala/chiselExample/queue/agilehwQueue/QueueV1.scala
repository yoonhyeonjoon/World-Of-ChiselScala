package chiselExample.queue.agilehwQueue

import chisel3._
import chisel3.tester._
import chisel3.util.Decoupled
import chiseltest.RawTester.test



class MyQueueV1(numEntries: Int, bitWidth: Int) extends Module {
  val io: QueueIO = IO(new QueueIO(bitWidth))
  require(numEntries > 0)
  // enqueue into index numEntries-1 (last) and dequeue from index 0 (head)
  val entries = Seq.fill(numEntries)(Reg(UInt(bitWidth.W)))
  val fullBits = Seq.fill(numEntries)(RegInit(false.B))
  val shiftDown = io.deq.fire || !fullBits.head
  io.enq.ready := !fullBits.last || shiftDown
  io.deq.valid := fullBits.head
  io.deq.bits := entries.head
  when (shiftDown) { // dequeue / shift
    for (i <- 0 until numEntries - 1) {
      entries(i) := entries(i+1)
      fullBits(i) := fullBits(i+1)
    }
    fullBits.last := false.B
  }
  when (io.enq.fire) { // enqueue
    entries.last := io.enq.bits
    fullBits.last := true.B
  }
  //     when (shiftDown || io.enq.fire) {
  //         entries.foldRight(io.enq.bits){(thisEntry, lastEntry) => thisEntry := lastEntry; thisEntry}
  //         fullBits.foldRight(io.enq.fire){(thisEntry, lastEntry) => thisEntry := lastEntry; thisEntry}
  //     }
}


object V1QueueRunner extends App{

  def simCycle(qm: QueueModel, c: MyQueueV1, enqValid: Boolean, deqReady: Boolean, enqData: Int=0) {
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

  test(new MyQueueV1(3,8)) { c =>
    val qm = new QueueModel(3)
    simCycle(qm, c, false, false)
    simCycle(qm, c, true, false, 1)
    simCycle(qm, c, true, false, 2)
    simCycle(qm, c, true, true, 3)
    simCycle(qm, c, false, true)
  }


}