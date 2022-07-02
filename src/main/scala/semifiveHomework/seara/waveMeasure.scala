package semifiveHomework.seara

import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util._
import chisel3.tester._
import chisel3.tester.RawTester.test

case class VolumeIntegratorParams(maxWaveHeight:Int, inputNumber:Int, timeDomainFactor:Int, maxOptionIs:Int=1000){
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val outputBits: Int = bitSize(maxWaveHeight)
}

class VolumeIntegrator(volumeIntegratorParams:VolumeIntegratorParams) extends Module {

  class VolumeIntegratorBundle extends Bundle {
    val in: Vec[UInt] = Input(Vec(volumeIntegratorParams.inputNumber, UInt(volumeIntegratorParams.outputBits.W)))
    val option: UInt = Input(UInt(volumeIntegratorParams.outputBits.W))
    val out: UInt = Output(UInt(volumeIntegratorParams.outputBits.W))
  }

  val vio: VolumeIntegratorBundle = IO(new VolumeIntegratorBundle)


  val sumAll: UInt = vio.in.reduce(_+&_)

  val regShift: Vec[UInt] = RegInit(VecInit( Seq.fill(volumeIntegratorParams.timeDomainFactor)( 0.U(volumeIntegratorParams.outputBits.W) ) ))

  regShift.tail.foldLeft(regShift(0))( { (a , b) =>
    b := a
    b
  } )

  val allSum: UInt = regShift.reduce(_+&_)
  val allDiv: UInt = allSum / (volumeIntegratorParams.timeDomainFactor.U +volumeIntegratorParams.inputNumber.U)

  vio.out := allDiv





  }







object MainVolu extends App{

  (new ChiselStage).emitVerilog(new VolumeIntegrator( VolumeIntegratorParams( maxWaveHeight = 150, inputNumber = 30, timeDomainFactor = 15) )  )

}






