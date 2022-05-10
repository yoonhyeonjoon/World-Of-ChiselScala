package functional

import chisel3.util.{Counter, Enum, is, switch}
import chisel3.{Bool, Bundle, Module, Output, RegInit, UInt, fromBooleanToLiteral, fromIntToLiteral, when}


class MockClockGenerator(speed : Int) extends Module {

  class MockClockBundle extends Bundle {
    val clock: Bool = Output(Bool())
  }

  val io: MockClockBundle = IO(new MockClockBundle())

  val high :: low :: Nil = Enum(2)
  val state: UInt = RegInit(high)
  val (count, wrap) = Counter(true.B, speed)

  when(count < (speed/2).U)
  {
    state := low
  }.otherwise
  {
    state := high
  }
  io.clock := false.B

  switch(state){
    is(high) {
      io.clock := true.B
    }
    is(low){
      io.clock := false.B
    }
  }

}

class MockClockResetGeneratorvalue(speed : Int) extends Module {

  class MockClockResetBundle extends Bundle {
    val clock: Bool = Output(Bool())
    val reset: Bool = Output(Bool())
  }

  val io: MockClockResetBundle = IO(new MockClockResetBundle())

  val high :: low :: Nil = Enum(2)
  val state: UInt = RegInit(high)
  val (count, wrap) = Counter(true.B, speed)

  when(count < (speed/2).U)
  {
    state := low
  }.otherwise
  {
    state := high
  }

  io.clock := false.B
  io.reset := false.B

  switch(state){
    is(high) {
      io.clock := true.B

      //reset
      if(reset == true.B)
      {
        io.reset := true.B
      }
      else
      {
        io.reset := false.B
      }

    }
    is(low){
      io.clock := false.B
    }
  }

}