package chiselExample.exampleModule.queue.agilehwQueue

import chisel3._
import chisel3.tester._
import chisel3.util.Decoupled
import chiseltest.RawTester.test

class QueueIO(bitWidth: Int) extends Bundle {
  val enq = Flipped(Decoupled(UInt(bitWidth.W)))
  val deq = Decoupled(UInt(bitWidth.W))
}

class MyQueueV0(bitWidth: Int) extends Module {

  val io = IO(new QueueIO(bitWidth))
  val entry = Reg(UInt(bitWidth.W))
  val full = RegInit(false.B)

  io.enq.ready := !full || io.deq.fire
  io.deq.valid := full
  io.deq.bits := entry

  when (io.deq.fire) {
    full := false.B
  }

  when (io.enq.fire) {
    entry := io.enq.bits
    full := true.B
  }

}

class QueueModel(numEntries: Int) {
  val mq = scala.collection.mutable.Queue[Int]()
  var deqReady = false

  def attemptEnq(elem: Int) {
    if (enqReady()) mq += elem
  }

  // call first within a cycle
  // improve with Option & None
  def attemptDeq() = if (deqReady) mq.dequeue() else -1

  def enqReady() = mq.size < numEntries || (mq.size == numEntries && deqReady)
  def deqValid() = mq.nonEmpty
}

object QueueRunner extends App{

  def simCycle(qm: QueueModel, c: MyQueueV0, enqValid: Boolean, deqReady: Boolean, enqData: Int=0) {
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
    println(s"que State : ${qm.mq}")
  }

  test(new MyQueueV0(8)) { c =>
    val qm = new QueueModel(1)
    simCycle(qm, c, false, false)
    simCycle(qm, c, true, false, 1)
    simCycle(qm, c, true, false, 2)
    simCycle(qm, c, true, true, 2)
    simCycle(qm, c, false, true)
  }


}