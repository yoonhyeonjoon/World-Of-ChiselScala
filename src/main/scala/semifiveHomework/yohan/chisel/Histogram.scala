import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util._

case class DomainParams(inputNumber : Int, outputNumber : Int){
  def bitSize(numb : Int) = log2Ceil(numb + 1)
  val inputBits: Int = bitSize(inputNumber)
  val outputBits: Int = bitSize(outputNumber)
}

class Domainchanger(domainParams : DomainParams) extends Module {

  class DomainchangerBundle extends Bundle {
    val in: DecoupledIO[Vec[UInt]] = Flipped(Decoupled(Vec(domainParams.inputNumber, UInt(domainParams.outputBits.W)))) //input size depends on outputNumber
    val out: Vec[UInt] = Output(Vec(domainParams.outputNumber, UInt(domainParams.inputBits.W))) //counting number depends on inputNumber.
  }

  def counter( en: Bool, max: UInt): UInt = {
    val x = RegInit(0.U(max.getWidth.W))
    x := Mux( en, Mux(x === max, 0.U, x + 1.U), x)
    x
  }

  val io = IO(new DomainchangerBundle)

  val counter_en: UInt = Wire(UInt(1.W))
  val count_num: UInt = counter(counter_en.asBool, (domainParams.outputNumber-1).asUInt)

  when( io.in.valid & count_num < (domainParams.inputNumber-2).U ){
    counter_en := 0.U
    io.in.ready := false.B
  }.elsewhen( !io.in.valid ){
    counter_en := 0.U
    io.in.ready := false.B
  }.otherwise{
    counter_en := 1.U
    io.in.ready := true.B
  }

  val out_cout: Vec[UInt] = RegInit(VecInit(Seq.fill(domainParams.outputNumber)(0.U(domainParams.inputBits.W))))

  (0 until domainParams.inputNumber) foreach { inN =>
    (0 until domainParams.outputNumber) foreach { outN =>
      io.out(outN) := out_cout(outN)
      when((count_num === inN.U)&(io.in.bits(inN) === outN.U)) {
        out_cout(outN) := out_cout(outN) + 1.U
      }.otherwise{
        out_cout(outN) := out_cout(outN)
      }
    }
  }
}

object yohan_Histogram extends App{
  println("Starting generate")
  (new ChiselStage).emitVerilog(new Domainchanger(DomainParams(1000,100)) )
}