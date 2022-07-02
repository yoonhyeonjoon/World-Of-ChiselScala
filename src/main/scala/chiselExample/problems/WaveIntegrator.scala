package chiselExample.problems

import Chisel.{log2Ceil, resetToBool}
import chisel3._
import chisel3.tester.{testableClock, testableData}
import functional.delayer.GripperInDelayNCycles
import functional.transmitter.ElementTransmitModule
import runOption.ComplexRunner.generating
import chiseltest.RawTester.test
import freechips.rocketchip.rocket.DecodeLogic

import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import scala.math._


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
  val volumeIntegrator: VolumeIntegrator = Module(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 150, inputNumber = waveNumber, timeDomainFactor = duration)))
  val transmit: Seq[ElementTransmitModule[UInt]] = fakeWaves(waveNumber, 200, 50, duration).map(aWaveSet =>
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


case class VolumeIntegratorParams(maxWaveHeight:Int, inputNumber:Int, timeDomainFactor:Int){
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val inputBits: Int = bitSize(inputNumber)
  val outputBits: Int = bitSize(maxWaveHeight)
}

class VolumeIntegrator(volumeIntegratorParams:VolumeIntegratorParams) extends Module {

  class VolumeIntegratorBundle extends Bundle {
    val in: Vec[UInt] = Input(Vec(volumeIntegratorParams.inputNumber, UInt(volumeIntegratorParams.outputBits.W)))
    val out: UInt = Output(UInt(volumeIntegratorParams.outputBits.W))
  }

  val io: VolumeIntegratorBundle = IO(new VolumeIntegratorBundle)
  val maxBitSize: Int = volumeIntegratorParams.bitSize(volumeIntegratorParams.inputNumber * volumeIntegratorParams.maxWaveHeight*volumeIntegratorParams.timeDomainFactor)
  val stateSaver: UInt = RegInit(0.U(35.W))
  val currentInputSum: UInt = io.in.reduce{_+&_}

  val delayed: GripperInDelayNCycles[UInt] = Module(new GripperInDelayNCycles(data=UInt(), cycle=volumeIntegratorParams.timeDomainFactor))
  delayed.io.in := currentInputSum

  val scale: UInt = (volumeIntegratorParams.inputNumber * volumeIntegratorParams.timeDomainFactor).U
  io.out := delayed.io.out.foldLeft(0.U)((prev, curr) => prev +& curr) / scale
  printf("current input sum : %d / %d, average of waves height : %d \n", currentInputSum, scale, io.out)
}

object VolumeIntegrator extends App{
  generating(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 10,inputNumber = 5, timeDomainFactor = 4)))


//  test(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 10,inputNumber = 5, timemainFactor = 4))) { c =>
//
//    c.io.in(0).poke(5.U)
//    c.io.in(1).poke(1.U)
//    c.io.in(2).poke(2.U)
//    c.io.in(3).poke(3.U)
//    c.io.in(4).poke(4.U) // = 15
//    c.clock.step()
//
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//    c.io.in(0).poke(2.U)
//    c.io.in(1).poke(3.U)
//    c.io.in(2).poke(4.U)
//    c.io.in(3).poke(5.U)
//    c.io.in(4).poke(6.U) //20
//    c.clock.step()
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//    c.io.in(0).poke(1.U)
//    c.io.in(1).poke(1.U)
//    c.io.in(2).poke(2.U)
//    c.io.in(3).poke(3.U)
//    c.io.in(4).poke(4.U) // = 11
//    c.clock.step()
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//    c.io.in(0).poke(4.U)
//    c.io.in(1).poke(3.U)
//    c.io.in(2).poke(4.U)
//    c.io.in(3).poke(5.U)
//    c.io.in(4).poke(6.U) //22
//    c.clock.step()
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//    c.io.in(0).poke(4.U)
//    c.io.in(1).poke(5.U)
//    c.io.in(2).poke(6.U)
//    c.io.in(3).poke(7.U)
//    c.io.in(4).poke(8.U) //30
//    c.clock.step()
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//
//    c.io.in(0).poke(8.U)
//    c.io.in(1).poke(3.U)
//    c.io.in(2).poke(4.U)
//    c.io.in(3).poke(5.U)
//    c.io.in(4).poke(6.U) //26
//    c.clock.step()
//
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//    c.io.in(0).poke(5.U)
//    c.io.in(1).poke(5.U)
//    c.io.in(2).poke(6.U)
//    c.io.in(3).poke(7.U)
//    c.io.in(4).poke(8.U) //31
//    c.clock.step()
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//    c.io.in(0).poke(4.U)
//    c.io.in(1).poke(1.U)
//    c.io.in(2).poke(2.U)
//    c.io.in(3).poke(3.U)
//    c.io.in(4).poke(4.U)// = 14
//    c.clock.step()
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//    c.io.in(0).poke(1.U)
//    c.io.in(1).poke(3.U)
//    c.io.in(2).poke(4.U)
//    c.io.in(3).poke(5.U)
//    c.io.in(4).poke(6.U) //19
//    c.clock.step()
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//    c.io.in(0).poke(3.U)
//    c.io.in(1).poke(1.U)
//    c.io.in(2).poke(2.U)
//    c.io.in(3).poke(3.U)
//    c.io.in(4).poke(4.U)// = 13
//    c.clock.step()
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//    c.io.in(0).poke(1.U)
//    c.io.in(1).poke(3.U)
//    c.io.in(2).poke(4.U)
//    c.io.in(3).poke(5.U)
//    c.io.in(4).poke(5.U) //18
//    c.clock.step()
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//    c.io.in(0).poke(4.U)
//    c.io.in(1).poke(1.U)
//    c.io.in(2).poke(2.U)
//    c.io.in(3).poke(5.U)
//    c.io.in(4).poke(4.U)// = 16
//    c.clock.step()
//    println(c.io.out.peek() + " " + c.io.outChecker.peek() + " " + c.io.outDelayedChecker.peek())
//
//  }
//


}