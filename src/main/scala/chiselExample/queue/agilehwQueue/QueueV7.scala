package chiselExample.queue.agilehwQueue

import chisel3._
import chisel3.stage.ChiselStage
import chisel3.tester._
import chisel3.util.{Counter, Decoupled}
import chiseltest.RawTester.test


class QueueV7[T <: chisel3.Data](numEntries: Int, gen: T, pipe: Boolean=true) extends Module {

  val io = IO(new Bundle {
    val enq = Flipped(Decoupled(gen))
    val deq = Decoupled(gen)
  })
  require(numEntries > 1)
  //     require(isPow2(numEntries))
  val entries = Mem(numEntries, gen)
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

object QueueV7 extends App {

  (new ChiselStage).emitVerilog(new QueueV7(3, UInt(8.W)))

  def simCycle(qm: QueueModel, c: QueueV7[UInt], enqReady: Boolean, deqReady: Boolean, enqData: Int=0) {
    qm.deqReady = deqReady
    c.io.deq.ready.poke(qm.deqReady.B)
    c.io.deq.valid.expect(qm.deqValid.B)
    if (deqReady && qm.deqValid)
      c.io.deq.bits.expect(qm.attemptDeq().U)
    c.io.enq.ready.expect(qm.enqReady.B)
    c.io.enq.valid.poke(enqReady.B)
    c.io.enq.bits.poke(enqData.U)
    if (enqReady)
      qm.attemptEnq(enqData)
    c.clock.step()
    println(qm.mq)
  }

  test(new QueueV7(3, UInt(8.W))) { c =>
    val qm = new QueueModel(3)
    simCycle(qm, c, false, false)
    simCycle(qm, c, true, false, 1)
    simCycle(qm, c, true, false, 2)
    simCycle(qm, c, true, false, 3)
    simCycle(qm, c, false, true)
  }

}