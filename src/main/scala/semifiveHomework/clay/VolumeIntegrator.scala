package semifiveHomework.clay

import chisel3._

import chisel3.stage.ChiselStage
import chisel3.util._

import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import scala.math.{Pi, cos}


case class VolumeIntegratorParams(maxWaveHeight:Int, inputNumber:Int, timemainFactor:Int, maxOptionIs:Int=1000){
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val outputBits: Int = bitSize(maxWaveHeight)
}

class VolumeIntegrator(volumeIntegratorParams:VolumeIntegratorParams) extends Module {

  class VolumeIntegratorBundle extends Bundle {
    val in: Vec[UInt] = Input(Vec(volumeIntegratorParams.inputNumber, UInt(volumeIntegratorParams.outputBits.W)))
    val out: UInt = Output(UInt(volumeIntegratorParams.outputBits.W))
  }

  /** 해당 위치에서 구현 **/
  class Counter(maxVal: Int) extends Module {
    val io = IO(new Bundle {
      val out = Output(UInt())
    })
    val count = Reg(UInt(log2Ceil(maxVal+1).W))
    val nextVal = Mux(count < maxVal.U, count + 1.U, 0.U)
    count := Mux(reset.asBool, 0.U, nextVal)
    io.out := count
  }

  val io = IO(new VolumeIntegratorBundle)

  val averageOfInput: UInt = (io.in.reduce{_ +& _}) / (volumeIntegratorParams.inputNumber).U

  //volumeIntegratorParams.outputBits 해당 부분 에러
  val vecOfAverageOfInput: Vec[UInt] = RegInit(VecInit(Seq.fill(volumeIntegratorParams.timemainFactor)(0.U((volumeIntegratorParams.outputBits).W))))

  val count = Module(new Counter(volumeIntegratorParams.timemainFactor))

  vecOfAverageOfInput(count.io.out) := averageOfInput

  io.out := vecOfAverageOfInput.reduce(_ +& _) / (volumeIntegratorParams.timemainFactor).U
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
    val waves = Seq.fill(num)(seqRepeat(duration, aFakeWave(evHeight = ranHeight*(scala.math.max(randomGen(300)/100,1)), fluctuation = randFluctuation * (0.5 + (((randomGen(100) + 1)/100.0)/2.0)))))
    waves.map( aWave => aWave.map(aHeight => aHeight.asInstanceOf[Double].toInt))
  }

  val waves: Seq[Seq[Int]] = fakeWaves(30, 150, 50, 3)

  val testableBundle:VolumeIntegratorTestableBundle = IO(new VolumeIntegratorTestableBundle())
  val duration = 15
  val volumeIntegrator: VolumeIntegrator = Module(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 150, inputNumber = 30, timemainFactor = duration)))
  val transmit: Seq[ElementTransmitModule[UInt]] = fakeWaves(30, 200, 50, duration).map(aWaveSet =>
    Module(new ElementTransmitModule[UInt](aWaveSet.map(aWave => if(aWave<=0) 0.U else aWave.U)))
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

  val avgSeq = avgMutable

  //softwarable Test End
  transmit.zip(volumeIntegrator.io.in).foreach{ a =>
    a._1.io.generatedDecoupledOutput.ready := true.B
    a._2 := a._1.io.generatedSimpleOutput
  }

  testableBundle.out := volumeIntegrator.io.out

}

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


object clay_VolumeIntegrator extends App{
  println("Start Gen")
  (new ChiselStage).emitVerilog(new VolumeIntegratorTestabler() )
}