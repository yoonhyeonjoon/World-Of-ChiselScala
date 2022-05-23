package chiselExample.queue.agilehwQueue

import chisel3._
import chisel3.tester._
import chisel3.util.Counter
import chiseltest.RawTester.test

class MyQueueV6(numEntries: Int, bitWidth: Int, pipe: Boolean=true) extends Module {
  val io = IO(new QueueIO(bitWidth))
  require(numEntries > 1)
  //     require(isPow2(numEntries))    // no longer needed
  val entries = Mem(numEntries, UInt(bitWidth.W))
  val enqIndex = Counter(numEntries)
  val deqIndex = Counter(numEntries)
  val maybeFull = RegInit(false.B)
  val indicesEqual = enqIndex.value === deqIndex.value
  val empty = indicesEqual && !maybeFull
  val full = indicesEqual && maybeFull

  if (pipe)
    io.enq.ready := !full || io.deq.ready
  else
    io.enq.ready := !full

  io.deq.valid := !empty
  io.deq.bits := entries(deqIndex.value)
  when (io.deq.fire =/= io.enq.fire) {
    maybeFull := io.enq.fire
  }
  when (io.deq.fire) {
    deqIndex.inc()
  }
  when (io.enq.fire) {
    entries(enqIndex.value) := io.enq.bits
    enqIndex.inc()
  }
}


object V6QueueRunner extends App{

  def simCycle(qm: QueueModel, c: MyQueueV6, enqValid: Boolean, deqReady: Boolean, enqData: Int=0) {
    qm.deqReady = deqReady
    c.io.deq.ready.poke(qm.deqReady.B)
    c.io.deq.valid.expect(qm.deqValid.B)
    if (deqReady && qm.deqValid)
      c.io.deq.bits.expect(qm.attemptDeq().U)
    c.io.enq.ready.expect(qm.enqReady.B)
    c.io.enq.valid.poke(enqValid.B)
    c.io.enq.bits.poke(enqData.U)
    if (enqValid)
      qm.attemptEnq(enqData)
    c.clock.step()
    println(qm.mq)
  }

  test(new MyQueueV6(3, 8)) { c =>
    val qm = new QueueModel(3)
    simCycle(qm, c, false, false)
    simCycle(qm, c, true, false, 1)
    simCycle(qm, c, true, false, 2)
    simCycle(qm, c, true, false, 3)
    simCycle(qm, c, false, true)
  }


}