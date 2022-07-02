//package jayzee.jayzee_VolumeIntegrator
//
//import chisel3._
//import chisel3.stage.ChiselStage
//import chisel3.util._
//import scala.annotation.tailrec
//
//
//case class VolumeIntegratorParams(maxWaveHeight:Int, inputNumber:Int, timedomainFactor:Int)  //timemainFactor는 몇 클락의 결과값들을 저장할 지
//{
//  def bitSize(numb : Int): Int = log2Ceil(numb + 1)
//  val inputBits: Int = bitSize(inputNumber)     //inputNumber는 입력 포트 개수
//  val outputBits: Int = bitSize(maxWaveHeight)  //최대 파도높이 값에 따라 출력비트 수를 결정. 인풋값의 범위는 0 ~ maxWaveHeight
//}
//
//class VolumeIntegrator(volumeIntegratorParams:VolumeIntegratorParams) extends Module
//{
//
//  class VolumeIntegratorBundle extends Bundle
//  {
//    val in: Vec[UInt] = Input(Vec(volumeIntegratorParams.inputNumber, UInt(volumeIntegratorParams.outputBits.W)))  //입력 포트 개수만큼 개수를 가지고, 비트폭은 출력비트 사이즈인 벡터
//    val out:     UInt = Output(UInt(volumeIntegratorParams.outputBits.W))
//  }
//
//  val io: VolumeIntegratorBundle = IO(new VolumeIntegratorBundle)
//  val sum_of_current_input: UInt = io.in.reduce{ _ +& _ }  //io.in의 모든 원소값을 다 더함. 즉 io.in의 (0)부터 (99) 까지
//
//
//
//  //shifting
//  val sum_of_current_input_register = RegInit(Vec(volumeIntegratorParams.timemainFactor, 0.U(volumeIntegratorParams.inputBits.W)))
//  (1 until volumeIntegratorParams.timemainFactor).foreach(i => sum_of_current_input_register(i) := sum_of_current_input_register(i - 1))
//  sum_of_current_input_register(0) := sum_of_current_input
//
//  //counting?
//
//  //adding & dividing
//  val divide_factor: UInt = (volumeIntegratorParams.inputNumber*volumeIntegratorParams.timemainFactor).U
//
//  io.out := sum_of_current_input_register.reduce(_ +& _) / divide_factor
//
//}
//
//object jayzee_VolumeIntegrator extends App{
//  println("Starting generate")
//  (new ChiselStage).emitVerilog(new VolumeIntegrator( VolumeIntegratorParams(maxWaveHeight=10, inputNumber=30, timemainFactor=4) ) )
//}
//
////####################################################################################################################### test module
////####################################################################################################################### test module
////####################################################################################################################### test module
//
//class ElementTransmitModule[T <: chisel3.Element](val getSequence : Seq[T]) extends Module {
//
//  class TransmitModule extends Bundle {
//    var getIndex = 0
//    var maxSize = 0
//    for(i <- getSequence.indices)
//    {
//      if(getSequence(i).getWidth > maxSize)
//      {
//        maxSize = getSequence(i).getWidth
//        getIndex = i
//      }
//    }
//
//    val generatedSimpleOutput: T = Output(getSequence(getIndex).cloneType)
//    val generatedDecoupledOutput: DecoupledIO[T] = Decoupled(getSequence(getIndex).cloneType)
//  }
//
//  val io: TransmitModule = IO(new TransmitModule)
//
//  io.generatedDecoupledOutput.valid := false.B
//  io.generatedDecoupledOutput.bits := DontCare
//
//  val counter: Counter = Counter(getSequence.length + 1)
//
//  when (counter.value < getSequence.length.U) {
//    val candidateValue = MuxLookup(counter.value, getSequence.head,
//      getSequence.zipWithIndex.map {
//        case (value: T, index: Int) => (index.U, value)
//      })
//
//    io.generatedDecoupledOutput.enq(candidateValue)
//    io.generatedSimpleOutput := candidateValue
//
//    when (io.generatedDecoupledOutput.fire) {
//      counter.inc()
//    }.otherwise{
//      counter.value := counter.value
//    }
//
//  }.otherwise {
//    counter.value := 0.U
//    io.generatedSimpleOutput := getSequence.head
//  }
//
//}
//
//
//class VolumeIntegratorTestabler extends Module{
//
//  class VolumeIntegratorTestableBundle extends Bundle {
//    val out: UInt = Output(UInt(1000.W)) //counting number depends on inputNumber.
//  }
//
//  def randomGen(num : Int): Int = scala.util.Random.nextInt(num)
//
//  def aFakeWave(evHeight : Int, fluctuation:Double) : Seq[Double] = {
//    val unitWave = 1 + randomGen(100)
//    val partialWave = Seq.fill(unitWave) {
//      val setHeight = evHeight * (1 + randomGen(100)) / 100
//      val setFluctuation = fluctuation * (0.5 + (((randomGen(100) + 1)/100.0)/2.0))
//      Seq.tabulate(360)(aState => setHeight + (setFluctuation * cos(aState * (Pi / 180))))
//    }
//    Seq.tabulate(360)( idx => partialWave.foldLeft(0.0)((cum, aSeq) => cum + aSeq(idx))/unitWave)
//  }
//
//  def seqRepeat(n: Int, target : Seq[Any]): Seq[Any]={
//    if (n == 0) target
//    else target ++ seqRepeat(n - 1, target)
//  }
//
//  def fakeWaves(num : Int, ranHeight : Int, randFluctuation:Int, duration : Int = 100): Seq[Seq[Int]] = {
//    val waves = Seq.fill(num)(seqRepeat(duration, aFakeWave(evHeight = ranHeight*(max(randomGen(300)/100,1)), fluctuation = randFluctuation * (0.5 + (((randomGen(100) + 1)/100.0)/2.0)))))
//    waves.map( aWave => aWave.map(aHeight => aHeight.asInstanceOf[Double].toInt))
//  }
//
//  val waves: Seq[Seq[Int]] = fakeWaves(30, 150, 50, 3)
//
//  val testableBundle:VolumeIntegratorTestableBundle = IO(new VolumeIntegratorTestableBundle())
//  val duration = 15
//  val volumeIntegrator: VolumeIntegrator = Module(new VolumeIntegrator(VolumeIntegratorParams(maxWaveHeight = 150, inputNumber = 30, timeDomainFactor = duration)))
//  val transmit: Seq[ElementTransmitModule[UInt]] = fakeWaves(30, 200, 50, duration).map(aWaveSet =>
//    Module(new ElementTransmitModule[UInt](aWaveSet.map(aWave => aWave.U)))
//  )
//
//
//  //softwarable Test
//  val avgMutable: ListBuffer[Int] = mutable.ListBuffer[Int]()
//  for (j <- waves.head.indices)
//  {
//    var cummulative = 0
//    for (i <- waves.indices) {
//      cummulative += waves(i)(j)
//    }
//    avgMutable += cummulative / waves.length
//  }
//
//  val avgSeq: Seq[Int] = avgMutable
//  //softwarable Test End
//  transmit.zip(volumeIntegrator.io.in).foreach{ a =>
//    a._1.io.generatedDecoupledOutput.ready := true.B
//    a._2 := a._1.io.generatedSimpleOutput
//  }
//
//  testableBundle.out := volumeIntegrator.io.out
//
//}
//
//object jayzee_VolumeIntegrator_tb_gen extends App{
//  println("Start Gen")
//  (new ChiselStage).emitVerilog(new VolumeIntegratorTestabler )
//}