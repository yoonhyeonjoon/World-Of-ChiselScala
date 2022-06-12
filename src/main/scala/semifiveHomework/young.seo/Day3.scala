import chisel3._
import chisel3.experimental.IO


class Trafic extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(2.W))
  })
  val regs = Reg(UInt(3.W))
  val regs1 = Reg(UInt(2.W))

  if(regs == 7.U){
    regs := 0.U
  }else {
    regs := regs + 1.U
  }

  when(regs >= 3.U){
    io.out := 2.U
  }.elsewhen(regs >= 2.U){
    io.out := 1.U
  }.otherwise{
    io.out := 0.U
  }
}

object Test extends App {
  println(getVerilogString(new Trafic))
}

// module Trafic(
//   input        clock,
//   input        reset,
//   output [1:0] io_out
// );
// `ifdef RANDOMIZE_REG_INIT
//   reg [31:0] _RAND_0;
// `endif // RANDOMIZE_REG_INIT
//   reg [2:0] regs; // @[Test.scala 9:17]
//   wire  _T_1 = regs >= 3'h2; // @[Test.scala 20:19]
//   assign io_out = regs >= 3'h3 ? 2'h2 : {{1'd0}, _T_1}; // @[Test.scala 18:20 19:12]
//   always @(posedge clock) begin
//     regs <= regs + 3'h1; // @[Test.scala 15:18]
//   end
// // Register and memory initialization
// `ifdef RANDOMIZE_GARBAGE_ASSIGN
// `define RANDOMIZE
// `endif
// `ifdef RANDOMIZE_INVALID_ASSIGN
// `define RANDOMIZE
// `endif
// `ifdef RANDOMIZE_REG_INIT
// `define RANDOMIZE
// `endif
// `ifdef RANDOMIZE_MEM_INIT
// `define RANDOMIZE
// `endif
// `ifndef RANDOM
// `define RANDOM $random
// `endif
// `ifdef RANDOMIZE_MEM_INIT
//   integer initvar;
// `endif
// `ifndef SYNTHESIS
// `ifdef FIRRTL_BEFORE_INITIAL
// `FIRRTL_BEFORE_INITIAL
// `endif
// initial begin
//   `ifdef RANDOMIZE
//     `ifdef INIT_RANDOM
//       `INIT_RANDOM
//     `endif
//     `ifndef VERILATOR
//       `ifdef RANDOMIZE_DELAY
//         #`RANDOMIZE_DELAY begin end
//       `else
//         #0.002 begin end
//       `endif
//     `endif
// `ifdef RANDOMIZE_REG_INIT
//   _RAND_0 = {1{`RANDOM}};
//   regs = _RAND_0[2:0];
// `endif // RANDOMIZE_REG_INIT
//   `endif // RANDOMIZE
// end // initial
// `ifdef FIRRTL_AFTER_INITIAL
// `FIRRTL_AFTER_INITIAL
// `endif
// `endif // SYNTHESIS
// endmodule

