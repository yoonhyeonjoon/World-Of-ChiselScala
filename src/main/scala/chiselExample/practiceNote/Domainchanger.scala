package chiselExample.practiceNote


import chisel3._
import chisel3.tester.{testableClock, testableData}
import chisel3.util.{Counter, Decoupled, DecoupledIO, MuxLookup, log2Ceil}
import chiselExample.practiceNote.Domainchanger.DomainParams
import chiseltest.RawTester.test
import runOption.ComplexRunner.generating


class Domainchanger(domainParams : DomainParams) extends Module {


  class DomainchangerBundle extends Bundle {
    val in: DecoupledIO[Vec[UInt]] = Flipped(Decoupled(Vec(domainParams.inputNumber, UInt(domainParams.outputBits.W)))) //input size depends on outputNumber
    val out: Vec[UInt] = Output(Vec(domainParams.outputNumber, UInt(domainParams.inputBits.W))) //counting number depends on inputNumber.
  }

  val io: DomainchangerBundle = IO(new DomainchangerBundle)
  val readyReg: Bool = RegInit(true.B)

  val caseMatcher: Counter = Counter(domainParams.inputNumber+1)
//  println(s"counter info : start : ${caseMatcher.range.start} / end : ${caseMatcher.range.end}")

  when(io.in.fire) {
//    printf("increase %d %d\n", caseMatcher.value, io.in.ready)
    caseMatcher.inc()
  }
  .otherwise {
//    printf("reseted %d %d\n", caseMatcher.value, io.in.ready)
    caseMatcher.reset()
  }

  val endConditionNumber = 99999
  val candidateValue: UInt = MuxLookup(caseMatcher.value, 0.U, {
      val indexedSeq: IndexedSeq[(UInt, UInt)] = io.in.bits.zipWithIndex.map { case (inputValue: UInt, inputIndex: Int) =>
          (inputIndex.U, inputValue)
      }
      val finalState = indexedSeq :+ (indexedSeq.size.U, endConditionNumber.U)
      finalState
    }
  )

  val filled: Seq[UInt] = Seq.fill(domainParams.outputNumber)(RegInit(UInt(domainParams.inputBits.W), 0.U))

  filled.zip(io.out).zipWithIndex.foreach{ case (value, index) =>
    when(io.in.fire){
      when(index.U === candidateValue){
        filled(index) := filled(index) + 1.U
      }.elsewhen(candidateValue === endConditionNumber.U)
      {
        readyReg := false.B
      }
    }
    value._2 := value._1
  }

  io.in.ready := readyReg
}


object Domainchanger extends App {

  case class DomainParams(inputNumber : Int, outputNumber : Int){
    def bitSize(numb : Int) = log2Ceil(numb + 1)
    val inputBits: Int = bitSize(inputNumber)
    val outputBits: Int = bitSize(outputNumber)
  }

  generating(new Domainchanger(DomainParams(inputNumber = 1000, outputNumber = 100)))

  test(new Domainchanger(DomainParams(inputNumber = 1000, outputNumber = 100))) { c =>

    c.io.in.valid.poke(true.B)
    c.io.in.bits(0).poke(3.U)
    c.io.in.bits(1).poke(3.U)
    c.io.in.bits(2).poke(3.U)
    c.io.in.bits(3).poke(3.U)
    c.io.in.bits(4).poke(1.U)
    for(p <- 0 until 15) {
      println(p, " / ", c.io.out.peek()," /  ")
      c.clock.step()
    }

  }
}

//routers(0).io.host.in.valid := io.ports(0).in.valid
//routers(0).io.host.in.bits := io.ports(0).in.bits
//
//routers(0).io.out.ready := io.ports(0).out.ready
//routers(0).io.in.valid := io.ports(0).in.valid
//routers(0).io.in.bits := io.ports(0).in.bits
//
//
////  routers(0).io.host.in.valid := io.ports(0).in.valid
////  routers(0).io.host.in.bits := io.ports(0).in.bits
////  routers(0).io.host.out.ready := io.ports(0).out.ready
//routers(0).io.host.in <> io.ports(0).in
//routers(0).io.host.out <> io.ports(0).out
//
////  routers(1).io.out.ready := io.ports(1).out.ready
////  routers(1).io.in.bits := io.ports(1).in.bits
////  routers(1).io.in.valid := io.ports(1).in.valid
//routers(1).io.host.in <> io.ports(1).in
//routers(1).io.host.out <> io.ports(1).out
//
//io.ports(0).in.ready := routers(0).io.in.ready
//io.ports(0).out.bits := routers(0).io.out.bits
//io.ports(0).out.valid := routers(0).io.out.valid
//
//io.ports(1).in.ready := routers(1).io.in.ready
//io.ports(1).out.bits := routers(1).io.out.bits
//io.ports(1).out.valid := routers(1).io.out.valid
//
//routers(1).io.host.in.valid := io.ports(1).in.valid
//routers(1).io.host.in.bits := io.ports(1).in.bits
//routers(1).io.host.out.ready := io.ports(1).out.ready





//  for(anInput <- 0 until io.in.length)
//  {
//    for(p <- 0 until 10) {
//      when(io.in(anInput) === p.U) {
//        container(anInput)(p) := container(anInput)(p) + 1.U
//      }
//    }
//  }
//
//  container.foreach{ aContainer =>
//
//  }



//  for (p <- 0 until io.in.length) {
//    io.out.zipWithIndex.foreach { case (elem, idx) =>
//       when(idx.asUInt === io.in(p)){
//         container(p) := container(p) + 1.U
//       }
//    }
//  }

//  io.out := container
//
//  val ff: UInt = PriorityEncoder(2.U)
//
//  val signal: Vec[Bool] = Wire(Vec(7, Bool()))
//  signal(0) := false.B
//  signal(1) := false.B
//  signal(2) := false.B
//  signal(3) := false.B
//  signal(4) := true.B
//  signal(5) := true.B
//  signal(6) := true.B
//
//  val gg: UInt = PriorityEncoder(signal)
//
////  gg.foreach(
//    printf(" tt : %d \n ", gg)
////  )


//  io.small := ff
//  io.small2 := ff