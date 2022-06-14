module traffic_light(
  input        clock,
  input        reset,
  output [1:0] io_light
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] count; // @[main.scala 12:22]
  reg [1:0] state; // @[main.scala 13:22]
  wire [2:0] _count_T_1 = count + 3'h1; // @[main.scala 20:20]
  wire [1:0] _GEN_4 = state == 2'h1 ? 2'h1 : 2'h2; // @[main.scala 22:32 23:14 27:14]
  assign io_light = state == 2'h0 ? 2'h0 : _GEN_4; // @[main.scala 18:25 19:14]
  always @(posedge clock) begin
    if (reset) begin // @[main.scala 12:22]
      count <= 3'h0; // @[main.scala 12:22]
    end else if (state == 2'h0) begin // @[main.scala 18:25]
      count <= _count_T_1; // @[main.scala 20:11]
    end else if (state == 2'h1) begin // @[main.scala 22:32]
      count <= _count_T_1; // @[main.scala 24:11]
    end else if (count == 3'h7) begin // @[main.scala 29:25]
      count <= 3'h0; // @[main.scala 30:13]
    end else begin
      count <= _count_T_1; // @[main.scala 28:11]
    end
    if (reset) begin // @[main.scala 13:22]
      state <= 2'h0; // @[main.scala 13:22]
    end else if (state == 2'h0) begin // @[main.scala 18:25]
      if (count == 3'h2) begin // @[main.scala 21:25]
        state <= 2'h1; // @[main.scala 21:33]
      end
    end else if (state == 2'h1) begin // @[main.scala 22:32]
      if (count == 3'h3) begin // @[main.scala 25:25]
        state <= 2'h2; // @[main.scala 25:33]
      end
    end else if (count == 3'h7) begin // @[main.scala 29:25]
      state <= 2'h0; // @[main.scala 31:13]
    end
  end
  // Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  `define RANDOMIZE
  `endif
  `ifdef RANDOMIZE_INVALID_ASSIGN
  `define RANDOMIZE
  `endif
  `ifdef RANDOMIZE_REG_INIT
  `define RANDOMIZE
  `endif
  `ifdef RANDOMIZE_MEM_INIT
  `define RANDOMIZE
  `endif
  `ifndef RANDOM
  `define RANDOM $random
  `endif
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
  `endif
  `ifndef SYNTHESIS
  `ifdef FIRRTL_BEFORE_INITIAL
  `FIRRTL_BEFORE_INITIAL
  `endif
  initial begin
    `ifdef RANDOMIZE
      `ifdef INIT_RANDOM
        `INIT_RANDOM
      `endif
      `ifndef VERILATOR
        `ifdef RANDOMIZE_DELAY
          #`RANDOMIZE_DELAY begin end
        `else
          #0.002 begin end
        `endif
      `endif
  `ifdef RANDOMIZE_REG_INIT
    _RAND_0 = {1{`RANDOM}};
    count = _RAND_0[2:0];
    _RAND_1 = {1{`RANDOM}};
    state = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
    `endif // RANDOMIZE
  end // initial
  `ifdef FIRRTL_AFTER_INITIAL
  `FIRRTL_AFTER_INITIAL
  `endif
  `endif // SYNTHESIS
  endmodule
