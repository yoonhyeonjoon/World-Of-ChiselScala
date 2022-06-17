package chiselExample.practiceNote


import chisel3._
import chisel3.tester.{testableClock, testableData}
import chisel3.util.{Counter, MuxLookup}
import chiseltest.RawTester.test
import runOption.ComplexRunner.generating

class Domainchanger extends Module {

  val inputNumber = 5
  val outputNumber = 10
  class DomainchangerBundle extends Bundle {
    val in: Vec[UInt] = Input(Vec(inputNumber, UInt(4.W)))
//    val outTest: Vec[UInt] = Output(Vec(5, UInt(7.W)))
    val out: Vec[UInt] = Output(Vec(outputNumber, UInt(10.W)))
    val small : UInt = Output(UInt(7.W))
    val small2 : UInt = Output(UInt(7.W))
  }

  val io: DomainchangerBundle = IO(new DomainchangerBundle)

//  printf("  %d\n", io.in(0))
//  printf("  %d\n", io.in(1))
//  printf("  %d\n", io.in(2))
//  printf("  %d\n", io.in(3))
//  printf("  %d\n", io.in(4))

  val transedWidth: Int = 1 << 4 // 1을 3칸 이동 10000 => "16"

  val counterSwitch: Bool = RegInit(true.B)
  val (value, wrap) = Counter(counterSwitch, inputNumber+2)

  val candidateValue: UInt = MuxLookup(value, 0.U, {
      val indexedSeq: IndexedSeq[(UInt, UInt)] = io.in.zipWithIndex.map { case (value: UInt, index: Int) => (index.U, value) }
      val adderLogic = indexedSeq :+ ((inputNumber).U, 2457.U)
      adderLogic
    }
  )
  val filled: Seq[UInt] = Seq.fill(outputNumber)(RegInit(UInt(100.W), 0.U))

  filled.zip(io.out).zipWithIndex.foreach{ case (value, index) =>
    when(index.U === candidateValue){
      filled(index) := filled(index) + 1.U
    }.elsewhen(candidateValue === (inputNumber+1).U){
      counterSwitch := false.B
    }
    value._2 := value._1
  }

  io.small := value
  io.small2 := candidateValue

}


object Domainchanger extends App {

//  generating(new ConvUIntToOH(10))
  generating(new Domainchanger())

  test(new Domainchanger()) { c =>

    c.io.in(0).poke(3.U)
    c.io.in(1).poke(5.U)
    c.io.in(2).poke(5.U)
    c.io.in(3).poke(8.U)
    c.io.in(4).poke(8.U)

    println(c.io.out(2).peek())
    println(c.io.out(3).peek())
    println(c.io.out(5).peek())
    println(c.io.out(6).peek())
    println(c.io.out(7).peek())
    println(c.io.out(8).peek())
    println("small1 : ", c.io.small.peek(), " small2 : " , c.io.small2.peek())

    c.clock.step()
    println(c.io.out(2).peek())
    println(c.io.out(3).peek())
    println(c.io.out(5).peek())
    println(c.io.out(6).peek())
    println(c.io.out(7).peek())
    println(c.io.out(8).peek())
    println("small1 : ", c.io.small.peek(), " small2 : " , c.io.small2.peek())


    c.clock.step()
    println(c.io.out(2).peek())
    println(c.io.out(3).peek())
    println(c.io.out(5).peek())
    println(c.io.out(6).peek())
    println(c.io.out(7).peek())
    println(c.io.out(8).peek())
    println("small1 : ", c.io.small.peek(), " small2 : " , c.io.small2.peek())
    c.clock.step()
    println(c.io.out(2).peek())
    println(c.io.out(3).peek())
    println(c.io.out(5).peek())
    println(c.io.out(6).peek())
    println(c.io.out(7).peek())
    println(c.io.out(8).peek())
    println("small1 : ", c.io.small.peek(), " small2 : " , c.io.small2.peek())
    c.clock.step()
    println(c.io.out(2).peek())
    println(c.io.out(3).peek())
    println(c.io.out(5).peek())
    println(c.io.out(6).peek())
    println(c.io.out(7).peek())
    println(c.io.out(8).peek())
    println("small1 : ", c.io.small.peek(), " small2 : " , c.io.small2.peek())
    c.clock.step()
    println(c.io.out(2).peek())
    println(c.io.out(3).peek())
    println(c.io.out(5).peek())
    println(c.io.out(6).peek())
    println(c.io.out(7).peek())
    println(c.io.out(8).peek())
    println("small1 : ", c.io.small.peek(), " small2 : " , c.io.small2.peek())
    c.clock.step()
    println(c.io.out(2).peek())
    println(c.io.out(3).peek())
    println(c.io.out(5).peek())
    println(c.io.out(6).peek())
    println(c.io.out(7).peek())
    println(c.io.out(8).peek())
    println("small1 : ", c.io.small.peek(), " small2 : " , c.io.small2.peek())
    c.clock.step()
    println(c.io.out(2).peek())
    println(c.io.out(3).peek())
    println(c.io.out(5).peek())
    println(c.io.out(6).peek())
    println(c.io.out(7).peek())
    println(c.io.out(8).peek())
    println("small1 : ", c.io.small.peek(), " small2 : " , c.io.small2.peek())
    c.clock.step()
    println(c.io.out(2).peek())
    println(c.io.out(3).peek())
    println(c.io.out(5).peek())
    println(c.io.out(6).peek())
    println(c.io.out(7).peek())
    println(c.io.out(8).peek())
    println("small1 : ", c.io.small.peek(), " small2 : " , c.io.small2.peek())


//    for (p <- 0 until c.io.in.length) {
//      println("sequential : %d \n", c.io.out.peek())
//    }

    //    println(s"1> ${c.io.out(4).peek()}")

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