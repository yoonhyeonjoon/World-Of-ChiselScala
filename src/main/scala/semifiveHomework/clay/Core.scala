//package semifiveHomework.clay
//
//import Chisel.Decoupled
//import chisel3._
//import chisel3.util.DecoupledIO
//import chiseltest.RawTester.test
//import chiseltest._
//
//case class CoreModuleParams(numberOfLinkers:Int = 4)
//class CoreModule(coreModuleParams:CoreModuleParams) extends Module {
//
//  class CoreModuleBundle extends Bundle {
//    val initialSetter : Bool = Input(Bool())
//    val inFlux: Vec[DecoupledIO[Bool]] = Vec(coreModuleParams.numberOfLinkers, Flipped(Decoupled(Bool())))
//    val outFlux: Vec[DecoupledIO[Bool]] = Vec(coreModuleParams.numberOfLinkers, Decoupled(Bool()))
//    val outputLooker: Bool = Output(Bool())
//    /** For test **/
//    //    val checker: Bool = Output(Bool())
//    val checker2: Bool = Output(Bool())
//  }
//
//  /**해당 위치에서 구현**/
//  val io = IO(new CoreModuleBundle)
//
//  // state parameter
//  val inoutMode = false.B
//  val calculateMode = true.B
//
//  // mode
//  val state = RegInit(io.initialSetter)
//  val mode = RegInit(inoutMode)
//
//  //  val inputTrueCount = io.inFlux.reduce{_.bits.asUInt +& _.bits.asUInt}
//  val inputTrueCount = io.inFlux(0).bits.asUInt +& io.inFlux(1).bits.asUInt +& io.inFlux(2).bits.asUInt +& io.inFlux(3).bits.asUInt
//
//  // update mode (sense the change of input)
//  when(mode === inoutMode) {
//    when (state === true.B) {
//      when ((inputTrueCount === 0.U) || (inputTrueCount === 4.U)) {
//        mode := calculateMode
//      }
//        .otherwise {
//          mode := mode
//        }
//    }
//      .otherwise {
//        when ((inputTrueCount === 2.U) || (inputTrueCount === 4.U)) {
//          mode := calculateMode
//        }
//          .otherwise {
//            mode := mode
//          }
//      }
//  }
//    .elsewhen(mode === calculateMode) {
//      mode := inoutMode
//    }
//
//
//  // update inFlux.ready and state
//  when(mode === inoutMode) {
//    io.inFlux foreach(in => in.ready := true.B)
//  }
//    .otherwise {
//      io.inFlux foreach(in => in.ready := false.B)
//
//      // state transition
//      state := ~state
//    }
//
//  // update outFlux.valid and outFlux.bits
//  io.outFlux foreach(out => out.valid := true.B)
//  io.outFlux foreach(out => out.bits := state)
//
//  io.outputLooker := state
//  io.checker2 := mode
//}
//
//object clay_CoreModule extends App{
//  def temporExtractor(mode: Bool) = {
//    if (mode.litToBoolean)
//      "calculateMode"
//    else
//      "inoutMode"
//  }
//
//  test(new CoreModule(CoreModuleParams())){ c =>
//    println("OutputPicker State 1 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//    //  println("OutputPicker State 1 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//    c.io.initialSetter.poke(true.B)
//    c.reset.poke(true.B)
//
//
//    c.clock.step()
//    println("OutputPicker State 2 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//    //  println("OutputPicker State 2 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//    c.reset.poke(false.B)
//
//    c.io.inFlux(0).valid.poke(true.B)
//    c.io.inFlux(0).bits.poke(true.B)
//
//    c.io.inFlux(1).valid.poke(true.B)
//    c.io.inFlux(1).bits.poke(true.B)
//
//    c.io.inFlux(2).valid.poke(true.B)
//    c.io.inFlux(2).bits.poke(true.B)
//
//    c.io.inFlux(3).valid.poke(true.B)
//    c.io.inFlux(3).bits.poke(true.B)
//
//    c.clock.step()
//    println("OutputPicker State 3 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//    //  println("OutputPicker State 3 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//
//
//    c.clock.step()
//    println("OutputPicker State 4 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//    //  println("OutputPicker State 4 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//
//    c.io.inFlux(0).valid.poke(false.B)
//    c.io.inFlux(0).bits.poke(true.B)
//
//    c.io.inFlux(1).valid.poke(true.B)
//    c.io.inFlux(1).bits.poke(true.B)
//
//    c.io.inFlux(2).valid.poke(false.B)
//    c.io.inFlux(2).bits.poke(true.B)
//
//    c.io.inFlux(3).valid.poke(false.B)
//    c.io.inFlux(3).bits.poke(true.B)
//
//    c.clock.step()
//    println("OutputPicker State 5 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//    //  println("OutputPicker State 5 => " + c.io.checker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//
//    c.io.inFlux(0).valid.poke(false.B)
//    c.io.inFlux(0).bits.poke(true.B)
//
//    c.io.inFlux(1).valid.poke(false.B)
//    c.io.inFlux(1).bits.poke(true.B)
//
//    c.io.inFlux(2).valid.poke(false.B)
//    c.io.inFlux(2).bits.poke(true.B)
//
//    c.io.inFlux(3).valid.poke(false.B)
//    c.io.inFlux(3).bits.poke(true.B)
//
//    c.clock.step()
//    println("OutputPicker State 6 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//
//    c.clock.step()
//    println("OutputPicker State 7 => " + c.io.outputLooker.peek() + " / " + temporExtractor(c.io.checker2.peek()))
//
//    c.clock.step()
//  }
//}
