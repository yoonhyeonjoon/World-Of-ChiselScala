package grammarForChisel

import Chisel.switch
import chisel3.util.{Enum, is}
import chisel3.{Bool, Bundle, Input, Module, Output, RegInit, UInt, WireInit, when}
import runOption.ComplexRunner.generating


class EnumStateMachine extends Module {

  val io = IO(new Bundle {
    val noise = Input(Bool())
    val trash = Input(Bool())
    val food  = Input(Bool())
    val action = Output(UInt())
  })
  val hide :: wander :: rummage :: eat :: Nil = Enum(4)
  val state = RegInit(hide)
  when (state === hide) {
    when (!io.noise) { state := wander }
  }
    .elsewhen (state === wander) {
      when (io.noise) { state := hide }.elsewhen (io.trash) { state := rummage }
    }
    .elsewhen (state === rummage) {
      when (io.noise) { state := hide }.elsewhen (io.food) { state := eat }
    }
    .elsewhen (state === eat) {

      when (io.noise) { state := hide }.elsewhen (!io.food) { state := wander }
    }
  io.action := state
}

class EnumStateMachine2 extends Module { // using switch
  val io = IO(new Bundle {
    val noise = Input(Bool())
    val trash = Input(Bool())
    val food  = Input(Bool())
    val action = Output(UInt())
  })
  val hide :: wander :: rummage :: eat :: Nil = Enum(4)
  val state: UInt = RegInit(hide)
  val next_state = WireInit(hide)

  state := next_state

  switch(state) {
    is (hide) {
      when (!io.noise) { next_state := wander }
    }
    is (wander) {
      when (io.noise) { next_state := hide }
        .elsewhen (io.trash) { next_state := rummage }
    }
    is (rummage) {
      when (io.noise) { next_state := hide }
        .elsewhen (io.food) { next_state := eat }
    }
    is (eat) {
      when (io.noise) { next_state := hide }
        .elsewhen (!io.food) { next_state := wander }
    }
  }

  io.action := state

}


object EnumStateMachine2 extends App {
  generating(new EnumStateMachine2())
  //  (new ChiselStage).emitVerilog(new EnumStateMachine2())
  //  (new ChiselStage).emitVerilog(new EnumStateMachine2())

}