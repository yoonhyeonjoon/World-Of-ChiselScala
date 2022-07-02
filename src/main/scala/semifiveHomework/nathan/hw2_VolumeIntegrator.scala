package semifiveHomework.nathan

import Chisel.{Mux1H, MuxLookup, is}
import chisel3.DontCare.:=
import chisel3._
import chisel3.experimental.IO
import chisel3.stage.ChiselStage
import chisel3.util.{Cat, Decoupled, Fill, PriorityEncoderOH, Queue, RegEnable, log2Ceil}

case class VolumeIntegratorParams(maxWaveHeight:Int, inputNumber:Int, timemainFactor:Int, maxOptionIs:Int=1000){
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val outputBits: Int = bitSize(maxWaveHeight)
  require(0<timemainFactor && timemainFactor<maxOptionIs && 0<maxWaveHeight && maxWaveHeight < maxOptionIs)
}

class VolumeIntegrator(volumeIntegratorParams:VolumeIntegratorParams) extends Module {

  class VolumeIntegratorBundle extends Bundle {
    val in: Vec[UInt] = Input(Vec(volumeIntegratorParams.inputNumber, UInt(volumeIntegratorParams.outputBits.W)))
//    val option: UInt = Input(UInt(volumeIntegratorParams.outputBits.W))
    val out: UInt = Output(UInt(volumeIntegratorParams.outputBits.W))
  }

  class Fifo [T <: Data](data:T, Cycle:Int) extends Module{
    class FifoBundle() extends Bundle {
      val in: Vec[T] = Input(Vec(volumeIntegratorParams.inputNumber,data))
      val out: Vec[T] = Output(Vec(volumeIntegratorParams.inputNumber,data))
    }

    require(0<Cycle && Cycle<1000)

    val FFBundle: FifoBundle = new FifoBundle
    val io: FifoBundle = IO(FFBundle)
    val FifoOut = Wire(Vec(volumeIntegratorParams.inputNumber,data))
    val outready:Bool = true.B
    val invalid: Bool = true.B

    io.in.zipWithIndex foreach({
      case(value,idx) =>
        val Fifo = Module(new Queue(UInt(volumeIntegratorParams.outputBits.W),Cycle))
        Fifo.io.enq.valid := invalid
        Fifo.io.enq.bits := value
        Fifo.io.deq.ready := outready
        FifoOut(idx) := Fifo.io.deq.bits
    })
    io.out <> FifoOut
  }

  class SumReg (SumNum:Int) extends Module{
     val io = IO(new Bundle{
       val in:Vec[UInt] = Input(Vec(SumNum,UInt(volumeIntegratorParams.outputBits.W)))
       val out: UInt = Output(UInt(volumeIntegratorParams.outputBits.W))
     })

    val Sum = RegInit(0.U(volumeIntegratorParams.outputBits.W))
    val Num:UInt = SumNum.U

    io.out := io.in.foldLeft(0.U)((a,b) => a+b)/ Num
  }

  val io: VolumeIntegratorBundle = IO(new VolumeIntegratorBundle)
  val Result = RegInit(0.U(volumeIntegratorParams.outputBits.W))
  val FifoInOut = Module(new Fifo(data = UInt(volumeIntegratorParams.outputBits.W),Cycle = volumeIntegratorParams.timemainFactor))
  val Register = Seq.fill(25)(Module(new SumReg(SumNum = volumeIntegratorParams.inputNumber / 25)))
  var Plusindex = 0

  FifoInOut.io.in <> io.in

  FifoInOut.io.out.zipWithIndex
    .foreach{
    case(value , index) => {
      if(index==0){
        Register(Plusindex).io.in(0) := value
      }
      else if((index>0)&&(index%(volumeIntegratorParams.inputNumber/25)==0)){
        Plusindex = Plusindex + 1
        Register(Plusindex).io.in(0) := value
      }
      else{
        Register(Plusindex).io.in(index%(volumeIntegratorParams.inputNumber/25)) := value
      }
    }
  }
  /*
  val finalPlusIndex = FifoInOut.io.out.zipWithIndex.foldLeft(0)((a, b) => {
    val value = b._1
    val index = b._2
    val newOutput = if(flag){
      temp := value
      a + index/(volumeIntegratorParams.inputNumber/25)
    } else{
      io.in(index) := value
      a
    }

    newOutput
  })
  */

  Result := Register.foldLeft(0.U)((a,b) => a + b.io.out)
  val divided = Result / 25.U
  io.out := divided
}


object Testwave extends App {
  (new ChiselStage).emitVerilog(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight=150,inputNumber=100,timemainFactor=10)))
}