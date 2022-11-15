package semifiveHomework.serah

import Chisel.{Decoupled, switch}
import chisel3._
import chisel3.util._
import chiseltest.RawTester.test
import chisel3.tester._

import scala.language.postfixOps

case class CoreModuleParams(numberOfLinkers:Int)
class CoreModule(coreModuleParams:CoreModuleParams) extends Module {

  class CoreModuleBundle extends Bundle {
    val initialSetter: Bool = Input(Bool())
    val inFlux: Vec[DecoupledIO[Bool]] = Vec(coreModuleParams.numberOfLinkers, Flipped(Decoupled(Bool())))
    val outFlux: Vec[DecoupledIO[Bool]] = Vec(coreModuleParams.numberOfLinkers, Decoupled(Bool()))
    val outputLooker: Bool = Output(Bool())
  }

  val io = IO(new CoreModuleBundle())

  val recentState: Bool = RegInit(io.initialSetter)
  val counter = Counter(5)


  recentState := io.outputLooker
//  val x = 0 until coreModuleParams.numberOfLinkers
  for( x <- 0 until coreModuleParams.numberOfLinkers ){
    when(reset.asBool === true.B) {
      counter.reset()
      io.inFlux(x).ready := false.B
      io.outFlux(x).valid := false.B
      io.outFlux(x).bits := false.B
      io.outputLooker := false.B
    }.otherwise {
      io.inFlux(x).ready := true.B
      io.outFlux(x).valid := true.B
      io.outFlux(x).bits := true.B
      io.outputLooker := true.B
    }

    when(io.inFlux(x).bits =/= recentState) { //연산모드
      io.inFlux(x).ready := false.B
      when(io.inFlux(x).bits === true.B) {
        counter.inc()
        when(io.outFlux(x).bits === true.B) {
          switch(counter.value) {
            is(0.U) {
              io.outputLooker := false.B
            }
            is(1.U) {
              io.outputLooker := true.B
            }
            is(2.U) {
              io.outputLooker := true.B
            }
            is(3.U) {
              io.outputLooker := true.B
            }
            is(4.U) {
              io.outputLooker := false.B
            }
          }
        }.otherwise {
          switch(counter.value) {
            is(0.U) {
              io.outputLooker := false.B
            }
            is(1.U) {
              io.outputLooker := false.B
            }
            is(2.U) {
              io.outputLooker := true.B
            }
            is(3.U) {
              io.outputLooker := false.B
            }
            is(4.U) {
              io.outputLooker := true.B
            }
          }
        }
      }.otherwise {
        counter.reset
      }
    }.otherwise { // 입출력모드
      when(io.outFlux(x).fire) {
        io.outFlux(x).bits := recentState
        io.outputLooker := io.outFlux(x).bits
      }
    }
  }
}

object CoreModule extends App {


  test(new CoreModule(CoreModuleParams(4))){ c =>


    println("OutputPicker State 1 => " + c.io.outputLooker.peek())
    c.io.initialSetter.poke(true.B)
    c.reset.poke(true.B)


    c.clock.step()
    println("OutputPicker State 2 => " + c.io.outputLooker.peek())
    c.reset.poke(false.B)

    c.io.inFlux(0).valid.poke(true.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(true.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(true.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(true.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 3 => " + c.io.outputLooker.peek())


    c.clock.step()
    println("OutputPicker State 4 => " + c.io.outputLooker.peek())

    c.io.inFlux(0).valid.poke(false.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(true.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(false.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(false.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 5 => " + c.io.outputLooker.peek())

    c.clock.step()
    println("OutputPicker State 6 => " + c.io.outputLooker.peek())

    c.clock.step()
    println("OutputPicker State 7 => " + c.io.outputLooker.peek())

    c.clock.step()

  }

}
