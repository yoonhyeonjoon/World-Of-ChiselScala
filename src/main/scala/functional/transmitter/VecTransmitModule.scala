package functional.transmitter

import chisel3._
import chisel3.util.{Counter, Decoupled, DecoupledIO, MuxLookup}

class VecTransmitModule[T <: chisel3.Element](val getSequence : Seq[T]) extends Module {

  class TransmitModule extends Bundle{
    val generatedSimpleOutput: T = Output(getSequence.head.cloneType)
    val generatedDecoupledOutput: DecoupledIO[T] = Decoupled(getSequence.head.cloneType)
  }

  val io: TransmitModule = IO(new TransmitModule)

  io.generatedDecoupledOutput.valid := false.B
  io.generatedDecoupledOutput.bits := DontCare

  val counter: Counter = Counter(getSequence.length + 1)

  when (counter.value < getSequence.length.U) {
    val candidateValue = MuxLookup(counter.value, getSequence.head,
      getSequence.zipWithIndex.map {
        case (value: T, index: Int) => (index.U, value)
      })

    io.generatedDecoupledOutput.enq(candidateValue)
    io.generatedSimpleOutput := candidateValue

    when (io.generatedDecoupledOutput.fire) {
      counter.inc()
    }.otherwise{
      counter.value := counter.value
    }

  }.otherwise{
    counter.value := 0.U
    io.generatedSimpleOutput := 0.U
  }

}

