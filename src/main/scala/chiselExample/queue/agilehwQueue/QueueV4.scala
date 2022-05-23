package chiselExample.queue.agilehwQueue

import Chisel.log2Ceil
import chisel3._
import chisel3.tester._
import chisel3.util.isPow2
import chiseltest.RawTester.test



class MyQueueV4(numEntries: Int, bitWidth: Int) extends Module {
  val io = IO(new QueueIO(bitWidth))
  require(numEntries > 1)
  require(isPow2(numEntries))
  val entries = Reg(Vec(numEntries, UInt(bitWidth.W)))
  val enqIndex = RegInit(0.U(log2Ceil(numEntries).W))
  val deqIndex = RegInit(0.U(log2Ceil(numEntries).W))
  val maybeFull = RegInit(false.B)
  val empty = enqIndex === deqIndex && !maybeFull
  val full = enqIndex === deqIndex && maybeFull
  io.enq.ready := !full
  io.deq.valid := !empty
  io.deq.bits := entries(deqIndex)
  when (io.deq.fire) {
    deqIndex := deqIndex +% 1.U
    when (enqIndex =/= deqIndex) {
      maybeFull := false.B
    }
  }
  when (io.enq.fire) {
    entries(enqIndex) := io.enq.bits
    enqIndex := enqIndex +% 1.U
    when ((enqIndex +% 1.U) === deqIndex) {
      maybeFull := true.B
    }
  }
}


object V4QueueRunner extends App{

  def simCycle(qm: QueueModel, c: MyQueueV4, enqValid: Boolean, deqReady: Boolean, enqData: Int=0) {
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

  test(new MyQueueV4(2, 8)) { c =>
    val qm = new QueueModel(2)
    simCycle(qm, c, false, false)
    simCycle(qm, c, true, false, 1)
    simCycle(qm, c, false, true)
  }


}