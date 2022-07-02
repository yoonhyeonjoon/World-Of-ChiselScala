package semifiveHomework.sino

import Chisel.log2Ceil
import chisel3.{UInt, _}
import freechips.rocketchip.rocket.DecodeLogic
import functional.transmitter.ElementTransmitModule
import runOption.ComplexRunner.generating

import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import scala.math.{Pi, cos, max}

case class VolumeIntegratorParams(maxWaveHeight:Int, inputNumber:Int, timemainFactor:Int, maxOptionIs:Int = 1000){
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val inputBits: Int = bitSize(inputNumber)  //100
  val outputBits: Int = bitSize(maxWaveHeight)
}

class VolumeIntegrator(volumeIntegratorParams:VolumeIntegratorParams) extends Module {

  class VolumeIntegratorBundle extends Bundle {
    val in: Vec[UInt] = Input(Vec(volumeIntegratorParams.inputNumber, UInt(volumeIntegratorParams.outputBits.W)))
    val out: UInt = Output(UInt(volumeIntegratorParams.outputBits.W))
  }




  val io: VolumeIntegratorBundle = IO(new VolumeIntegratorBundle)


  var inputsum: UInt = io.in.reduce{_+&_}

  var com: UInt = inputsum:UInt
  var sumofinputsum: UInt = RegInit(0.U(volumeIntegratorParams.bitSize(volumeIntegratorParams.maxWaveHeight * volumeIntegratorParams.inputNumber * volumeIntegratorParams.timemainFactor).W))

  when (inputsum < sumofinputsum) {
    sumofinputsum := sumofinputsum + inputsum - com
  } .otherwise {
    sumofinputsum:=sumofinputsum
  }



  io.out := sumofinputsum / (volumeIntegratorParams.inputNumber*volumeIntegratorParams.timemainFactor).U


}



class VolumeIntegratorTestabler extends Module{

  class VolumeIntegratorTestableBundle extends Bundle {
    val out: UInt = Output(UInt(1000.W)) //counting number depends on inputNumber.
  }

  def randomGen(num : Int): Int = scala.util.Random.nextInt(num)

  def aFakeWave(evHeight : Int, fluctuation:Double) : Seq[Double] = {
    val unitWave = 1 + randomGen(100)
    val partialWave = Seq.fill(unitWave) {
      val setHeight = evHeight * (1 + randomGen(100)) / 100
      val setFluctuation = fluctuation * (0.5 + (((randomGen(100) + 1)/100.0)/2.0))
      Seq.tabulate(360)(aState => setHeight + (setFluctuation * cos(aState * (Pi / 180))))
    }
    Seq.tabulate(360)( idx => partialWave.foldLeft(0.0)((cum, aSeq) => cum + aSeq(idx))/unitWave)
  }

  def seqRepeat(n: Int, target : Seq[Any]): Seq[Any]={
    if (n == 0) target
    else target ++ seqRepeat(n - 1, target)
  }

  def fakeWaves(num : Int, ranHeight : Int, randFluctuation:Int, duration : Int = 100): Seq[Seq[Int]] = {
    val waves = Seq.fill(num)(seqRepeat(duration, aFakeWave(evHeight = ranHeight*(max(randomGen(300)/100,1)), fluctuation = randFluctuation * (0.5 + (((randomGen(100) + 1)/100.0)/2.0)))))
    waves.map( aWave => aWave.map(aHeight => aHeight.asInstanceOf[Double].toInt))
  }

  val waveNumber : Int = 30
  val waves: Seq[Seq[Int]] = fakeWaves(waveNumber, 150, 50, 3)

  val testableBundle:VolumeIntegratorTestableBundle = IO(new VolumeIntegratorTestableBundle())
  val duration = 15
  val volumeIntegrator: VolumeIntegrator = Module(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 150, inputNumber = waveNumber, timemainFactor = duration)))
  val transmit: Seq[ElementTransmitModule[UInt]] = fakeWaves(waveNumber, 150, 50, duration).map(aWaveSet =>
    Module(new ElementTransmitModule[UInt](aWaveSet.map(aWave => if(aWave<=0) 0.U else aWave.U)))
  )

  DecodeLogic

  //softwarable Test
  val avgMutable: ListBuffer[Int] = mutable.ListBuffer[Int]()
  for (j <- waves.head.indices)
  {
    var cummulative = 0
    for (i <- waves.indices) {
      cummulative += waves(i)(j)
    }
    avgMutable += cummulative / waves.length
  }

  val avgSeq: Seq[Int] = avgMutable
  //softwarable Test End

  transmit.zip(volumeIntegrator.io.in).foreach{ a =>
    a._1.io.generatedDecoupledOutput.ready := true.B
    a._2 := a._1.io.generatedSimpleOutput
  }

  testableBundle.out := volumeIntegrator.io.out

}

object VolumeIntegratorTestModule extends App{
  generating(new VolumeIntegratorTestabler())
}