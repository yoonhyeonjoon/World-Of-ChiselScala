package chiselExample.grammar

class DontCare {

  import chisel3._
  class ModWithVec extends Module {
    // ...
    val nElements = 5
    val io = IO(new Bundle {
      val outs = Output(Vec(nElements, Bool()))
    })
    io.outs <> DontCare
    // ...
  }

  class TrivialInterface extends Bundle {
    val in  = Input(Bool())
    val out = Output(Bool())
  }

  class ModWithTrivalInterface extends Module {
    // ...
    val io = IO(new TrivialInterface)
    io <> DontCare
    // ...
  }

}
