
/**
 ** Created by Allen Yoon on 2022-06-23
 ** Copyright (c) 2022-06-23. All rights reserved.
 ** https://github.com/yoonhyeonjoon/World-Of-ChiselScala
 **/

package functional.transmitter

import chisel3._
import chisel3.util.{Counter, Decoupled, DecoupledIO, MuxLookup}

class ElementTransmitModule[T <: chisel3.Element](val getSequence : Seq[T]) extends Module {

  class TransmitModule extends Bundle {
    var getIndex = 0
    var maxSize = 0
    for(i <- getSequence.indices)
    {
      if(getSequence(i).getWidth > maxSize)
      {
        maxSize = getSequence(i).getWidth
        getIndex = i
      }
    }

    val generatedSimpleOutput: T = Output(getSequence(getIndex).cloneType)
    val generatedDecoupledOutput: DecoupledIO[T] = Decoupled(getSequence(getIndex).cloneType)
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

  }.otherwise {
    counter.value := 0.U
    io.generatedSimpleOutput := getSequence.head
  }

}

