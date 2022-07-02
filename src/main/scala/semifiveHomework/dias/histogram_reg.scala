package semifiveHomework.dias.histogram2

import chisel3._
import chisel3.util._
import chisel3.stage._

case class DomainParams(inputNumber : Int, outputNumber : Int){
  def bitSize(numb : Int) = log2Ceil(numb + 1)
  val inputBits: Int = bitSize(inputNumber)
  val outputBits: Int = bitSize(outputNumber)
}

class Domainchanger(domainParams : DomainParams) extends Module {

  class DomainchangerBundle extends Bundle {
    val in: DecoupledIO[Vec[UInt]] = Flipped(Decoupled(Vec(domainParams.inputNumber, UInt(domainParams.outputBits.W)))) //input size depends on outputNumber
    val out = Decoupled(Vec(domainParams.outputNumber, UInt(domainParams.inputBits.W)))//counting number depends on inputNumber.
  }

  val io : DomainchangerBundle = IO(new DomainchangerBundle())

  io.out.valid := io.in.valid
  io.in.ready := io.out.ready

  val reg = RegInit(VecInit(Seq.fill(domainParams.outputNumber)(0.U(domainParams.inputNumber.W))))
  //val reg = Reg(Vec(domainParams.outputNumber, UInt(10.W)))

  val in_check = io.in.bits.zipWithIndex.map{ x => (x._2.U, x._1) }
  val counter = Counter(domainParams.inputNumber)
  val check = MuxLookup(counter.value, 0.U, in_check)

  when(io.in.fire) { counter.inc() }.otherwise { counter.reset() }

  io.out.bits.zipWithIndex.foreach{case (out, idx) =>
    when(check === idx.U){ reg(idx) := reg(idx) + 1.U}.otherwise{reg(idx) := reg(idx)}
    //out := reg(idx)
  }
  io.out.bits := reg
}


object test1212 extends App{
  (new ChiselStage).emitVerilog(new Domainchanger(DomainParams(1000,100)))
}
