package semifiveHomework.thomas


import Chisel.{Decoupled, switch}
import chisel3._
import chisel3.stage.ChiselStage
import chisel3.tester.{testableClock, testableData}
import chisel3.util._
import chiseltest.RawTester.test


case class CoreModuleParams(numberOfLinkers:Int = 4)
class CoreModule(coreModuleParams:CoreModuleParams) extends Module {


  class CoreModuleBundle extends Bundle {
    val intialSetter : Bool                   = Input(Bool())
    val inFlux       : Vec[DecoupledIO[Bool]] = Vec(coreModuleParams.numberOfLinkers, Flipped(Decoupled(Bool())))
    val outFlux      : Vec[DecoupledIO[Bool]] = Vec(coreModuleParams.numberOfLinkers, Decoupled(Bool()))
    val outputLooker : Bool                   = Output(Bool())
    val checker      : UInt                   = Output(UInt(2.W))
    val countval     : UInt                   = Output(UInt(3.W))
  }
  val io = IO(new CoreModuleBundle)

  val init :: value_Check :: value_Change :: value_Transmit :: Nil = Enum(4)
  val state     = RegInit(init)
  io.checker := state
  val newValue  = RegInit(true.B)
  val coreValue = RegInit(true.B)
  val eachValue = RegInit(VecInit(Seq.fill(4)(0.U(1.W))))//RegInit(0.U(4.W))
  val count0 = RegInit(0.U(3.W))
  val count1 = RegInit(0.U(3.W))
  val count2 = RegInit(0.U(3.W))
  val count3 = RegInit(0.U(3.W))

  //  io.outputLooker := coreValue
  //  io.countval := count0 + count1 + count2 + count3
  io.outputLooker := DontCare
  io.countval     := DontCare
  (0 until 4).foreach(n => {
    io.outFlux(n).bits  := DontCare
    io.outFlux(n).valid := DontCare
    io.inFlux(n).ready  := DontCare
  })

  switch(state) {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////init/////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    is(init){
      (0 until 4).foreach(n =>{
        eachValue(n) := io.intialSetter
      })
      state := value_Check
    }


    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////Value Check//////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    is(value_Check) {
      (0 until 4).foreach(n =>{
        io.inFlux(n).ready  := false.B
        io.outFlux(n).valid := false.B
      })

      when (eachValue(0) === true.B) {
        count0 := count0 + 1.U
      }.otherwise{
        count0 := 0.U
      }

      when (eachValue(1) === true.B) {
        count1 := count1 + 1.U
      }.otherwise{
        count1 := 0.U
      }

      when (eachValue(2) === true.B) {
        count2 := count2 + 1.U
      }.otherwise{
        count2 := 0.U
      }

      when (eachValue(3) === true.B) {
        count3 := count3 + 1.U
      }.otherwise{
        count3 := 0.U
      }
      io.countval := count0 + count1 + count2 + count3
      state := value_Change

    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////Value Change/////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    is(value_Change){

      (0 until 4).foreach(n =>{
        io.inFlux(n).ready  := false.B
        io.outFlux(n).valid := false.B
      })

      when(io.outputLooker === true.B){
        when(io.countval === 0.U){
          newValue := false.B
        }.elsewhen(io.countval === 1.U){
          newValue := true.B
        }.elsewhen(io.countval === 2.U){
          newValue := true.B
        }.elsewhen(io.countval === 3.U){
          newValue := true.B
        }.elsewhen(io.countval === 4.U){
          newValue := false.B
        }
      }.elsewhen(io.outputLooker === false.B){
        when(io.countval === 0.U){
          newValue := false.B
        }.elsewhen(io.countval === 1.U){
          newValue := false.B
        }.elsewhen(io.countval === 2.U){
          newValue := true.B
        }.elsewhen(io.countval === 3.U){
          newValue := false.B
        }.elsewhen(io.countval === 4.U){
          newValue := true.B
        }
      }
      io.countval := count0 + count1 + count2 + count3
      io.outputLooker := newValue
      state := value_Transmit
    }


    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////Value Transmit///////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    is(value_Transmit) {
      //count := 0.U
      count0 := 0.U
      count1 := 0.U
      count2 := 0.U
      count3 := 0.U
      io.countval := count0 + count1 + count2 + count3

      (0 until 4).foreach(n =>{
        io.inFlux(n).ready  := true.B
        io.outFlux(n).valid := true.B
      })

      //receive new value
      (0 until 4).foreach(n => {
        when (io.inFlux(n).fire) {
          eachValue(n) := io.inFlux(n).bits
        }.otherwise{
          eachValue(n) := eachValue(n)
          //eachValue(n) := 0.U
        }
      })
      //transmit core value
      (0 until 4).foreach(n => {
        when (io.outFlux(n).fire) {
          io.outFlux(n).bits := io.outputLooker
        }
      })

      state := value_Check
    }
  }

}

object homework4_1 extends App{
  println("generation gets started\n")

  def temporExtractor(uintStr : Any) ={
    val get = uintStr.toString.split('(')(1).split(')')(0)
    //    println(get)
    if(get == "0") "Init"
    else if(get == "1") "Value Check"
    else if(get == "2") "Value Change"
    else "Value Transmit"
  }

  test(new CoreModule(CoreModuleParams())){ c =>

    //    val ff = c.io.checker.peek()
    println("OutputPicker State 1 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())
    c.io.intialSetter.poke(true.B)
    c.reset.poke(true.B)

    c.clock.step()
    println("OutputPicker State 2 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())
    c.reset.poke(false.B)

    c.io.inFlux(0).valid.poke(true.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(true.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(false.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(true.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 3 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())

    c.io.inFlux(0).valid.poke(false.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(false.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(true.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(true.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 4 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())

    c.io.inFlux(0).valid.poke(false.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(false.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(true.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(true.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 5 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())

    c.io.inFlux(0).valid.poke(true.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(true.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(false.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(false.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 6 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())

    c.io.inFlux(0).valid.poke(false.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(false.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(false.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(false.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 7 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())

    c.io.inFlux(0).valid.poke(false.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(false.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(true.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(true.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 8 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())

    c.io.inFlux(0).valid.poke(false.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(true.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(false.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(false.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 9 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())

    c.io.inFlux(0).valid.poke(false.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(true.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(false.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(false.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 10 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())

    c.io.inFlux(0).valid.poke(false.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(true.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(false.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(false.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 11 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())

    c.io.inFlux(0).valid.poke(false.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(true.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(false.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(false.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 12 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())

    c.io.inFlux(0).valid.poke(false.B)
    c.io.inFlux(0).bits.poke(true.B)

    c.io.inFlux(1).valid.poke(true.B)
    c.io.inFlux(1).bits.poke(true.B)

    c.io.inFlux(2).valid.poke(false.B)
    c.io.inFlux(2).bits.poke(true.B)

    c.io.inFlux(3).valid.poke(false.B)
    c.io.inFlux(3).bits.poke(true.B)

    c.clock.step()
    println("OutputPicker State 13 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker.peek()) + " / Count =" + c.io.countval.peek())
  }

  (new ChiselStage).emitVerilog(new CoreModule(CoreModuleParams()))
}
