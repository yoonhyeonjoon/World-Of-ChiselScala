package semifiveHomework.nathan

import chisel3._
import chisel3.stage.ChiselStage

import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import scala.math.{Pi, cos}

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

  def fakeWaves(num : Int, ranHeight : Int, randFluctuation:Int, duration : Int = 10): Seq[Seq[Int]] = {
    val waves = Seq.fill(num)(seqRepeat(duration, aFakeWave(evHeight = ranHeight*(scala.math.max(randomGen(300)/100,1)), fluctuation = randFluctuation * (0.5 + (((randomGen(100) + 1)/100.0)/2.0)))))
    waves.map( aWave => aWave.map(aHeight => aHeight.asInstanceOf[Double].toInt))
  }

  val waves: Seq[Seq[Int]] = fakeWaves(50, 150, 50, 3)

  val testableBundle:VolumeIntegratorTestableBundle = IO(new VolumeIntegratorTestableBundle())
  val duration = 15
  val volumeIntegrator: VolumeIntegrator = Module(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 999, inputNumber = 50, timemainFactor = duration)))
  val transmit: Seq[ElementTransmitModule[UInt]] = fakeWaves(50, 200, 50, duration).map(aWaveSet =>
    Module(new ElementTransmitModule[UInt](aWaveSet.map(aWave => aWave.U)))
  )


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

//  val avgSeq: Seq[Int] = avgMutable
  //softwarable Test End
  transmit.zip(volumeIntegrator.io.in).foreach{ a =>
    a._1.io.generatedDecoupledOutput.ready := true.B
    a._2 := a._1.io.generatedSimpleOutput
  }

  testableBundle.out := volumeIntegrator.io.out

}

object Test_abler extends App {
  (new ChiselStage).emitVerilog(new VolumeIntegratorTestabler())
}
