package semifiveHomework.yohan

import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util._

import scala.annotation.tailrec
import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import scala.math._

case class VolumeIntegratorParams(maxWaveHeight:Int, inputNumber:Int, timemainFactor:Int, maxOptionIs:Int=1000){
  require(inputNumber <=  maxOptionIs)
  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
  val outputBits: Int = bitSize(maxWaveHeight)
  val divMax: Int = inputNumber*timemainFactor
  val bitMax: Int = maxWaveHeight + log2Ceil(divMax+1)
}


class VolumeIntegrator(volumeIntegratorParams:VolumeIntegratorParams) extends Module {

  val addMax = 10

  class VolumeIntegratorBundle extends Bundle {
    val in: Vec[UInt] = Input(Vec(volumeIntegratorParams.inputNumber, UInt(volumeIntegratorParams.outputBits.W)))
    val out: UInt = Output(UInt(volumeIntegratorParams.outputBits.W))
  }

  class GripperInDelayNCycles[T <: Data](data:T, gripper:Int)(cycle:Int = gripper) extends Module {

    class DelayNCyclesBundle() extends Bundle {
      val in: T = Input(data)
      val out: T = Output(data)
    }

    val delayedBundle: DelayNCyclesBundle = new DelayNCyclesBundle
    val io:DelayNCyclesBundle = IO(delayedBundle)
    val delaCon: Vec[UInt] = RegInit(VecInit(Seq.fill(cycle)(0.U(volumeIntegratorParams.bitMax.W))))
    delaCon(0) := io.in
    delaCon.tail.foldLeft(delaCon(0))((a,b) => {
      b := a
      b
    })
    val tempAdd: UInt = delaCon.reduce(_ +& _)
    io.out := tempAdd
  }

  @tailrec
  final def AddDiv(inNum : Seq[(Int,Int,Int)]) : Seq[(Int,Int,Int)] = {
    var tmpDiv = 0
    if((inNum.last._1)%addMax > 0)  {tmpDiv = 1}
    else                            {tmpDiv = 0}
    if ( inNum.last._1 < addMax ){ inNum :+ (1, inNum.last._1, inNum.last._1+(inNum.last._1/addMax)+1 ) }
    else{ AddDiv( inNum :+ ( (inNum.last._1/addMax)+tmpDiv, (inNum.last._1)%addMax, inNum.last._1+inNum.last._3 )) }
  }

  val io: VolumeIntegratorBundle = IO(new VolumeIntegratorBundle)
  val allS: Seq[(Int, Int, Int)] = AddDiv( Seq.fill(1)( (volumeIntegratorParams.inputNumber, 0, 0) ) ).tail
  val allSReg: Vec[UInt] = RegInit(VecInit(Seq.fill( allS.map({ case(_1,_,_) => _1 }).sum )(0.U(volumeIntegratorParams.bitMax.W))))
  val regFirst: Int = allS.head._1

//     println(allS)
//     println(allSReg)

  var allRegNow : Int = 0
  var allRegPrev = 0

  allS.tail.indices.foreach({ allSNum =>
    if (allSNum == 0) {
      allRegNow = regFirst
      allRegPrev = 0
    }
    else {
      allRegNow = (0 until allSNum+1).map({x:Int => allS(x)._1}).sum
      allRegPrev = (0 until allSNum).map({x:Int => allS(x)._1}).sum
    }
    (0 until allS(allSNum+1)._1-1).foreach({ allSRegNum =>
      allSReg(allRegNow + allSRegNum) := (0 until addMax).map({ x => allSReg(allRegPrev+allSRegNum*10+x) }).reduce(_+&_)
    })
    if( allS(allSNum+1)._2 == 0 ){
      allSReg(allRegNow + allS(allSNum+1)._1-1) := (0 until addMax).map({ x => allSReg(allRegPrev+(allS(allSNum+1)._1-1)*10+x) }).reduce(_+&_)
    }else{
      allSReg(allRegNow + allS(allSNum+1)._1-1) := (0 until allS(allSNum+1)._2).map({ x =>
        allSReg( allRegPrev+allS(allSNum+1)._1*10 - addMax + x ) }).reduce(_+&_)
    }
  })

  (0 until allS.head._1).foreach( x => allSReg(x) := (0 until addMax).map({ y => io.in(x*addMax + y)}).reduce(_+&_) )

  val bufferReg: GripperInDelayNCycles[UInt] = Module(new GripperInDelayNCycles(data = UInt(volumeIntegratorParams.bitMax.W), gripper = volumeIntegratorParams.timemainFactor)())

  bufferReg.io.in := allSReg.last
  io.out := bufferReg.io.out / (volumeIntegratorParams.divMax.U)


}


object yohan_VolumeIntegrator extends App{
  println("Starting generate")
  (new ChiselStage).emitVerilog(new VolumeIntegrator( VolumeIntegratorParams(maxWaveHeight=10, inputNumber=30, timemainFactor=4) ) )
}


//####################################################################################################################
//#################################################### Test Gen ######################################################
//####################################################################################################################

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

  val waves: Seq[Seq[Int]] = fakeWaves(30, 150, 50, 3)

  val testableBundle:VolumeIntegratorTestableBundle = IO(new VolumeIntegratorTestableBundle())
  val duration = 15
  val volumeIntegrator: VolumeIntegrator = Module(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 150, inputNumber = 30, timemainFactor = duration)))
  val transmit: Seq[ElementTransmitModule[UInt]] = fakeWaves(30, 200, 50, duration).map(aWaveSet =>
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

object VolumeIntegratorTestModule extends App{
  (new ChiselStage).emitVerilog(new VolumeIntegratorTestabler())
}

