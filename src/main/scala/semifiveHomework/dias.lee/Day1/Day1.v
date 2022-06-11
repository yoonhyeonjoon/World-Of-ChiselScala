module Calculator(
  input        clock,
  input        reset,
  input  [1:0] io_s,
  input  [7:0] io_in0,
  input  [7:0] io_in1,
  output [7:0] io_out
);
  wire [8:0] _io_out_T = io_in0 + io_in1; // @[main.scala 17:22]
  wire [7:0] _io_out_T_2 = io_in0 - io_in1; // @[main.scala 19:22]
  wire [15:0] _io_out_T_3 = io_in0 * io_in1; // @[main.scala 21:22]
  wire [7:0] _io_out_T_4 = io_in0 / io_in1; // @[main.scala 23:22]
  wire [15:0] _GEN_0 = io_s == 2'h2 ? _io_out_T_3 : {{8'd0}, _io_out_T_4}; // @[main.scala 20:35 21:12 23:12]
  wire [15:0] _GEN_1 = io_s == 2'h1 ? {{8'd0}, _io_out_T_2} : _GEN_0; // @[main.scala 18:36 19:12]
  wire [15:0] _GEN_2 = io_s == 2'h0 ? {{7'd0}, _io_out_T} : _GEN_1; // @[main.scala 16:24 17:12]
  assign io_out = _GEN_2[7:0];
endmodule