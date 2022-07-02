`timescale 1ns/1ps
module testbench();
  reg clock;
  reg io_en;
  reg reset;

  VolumeIntegratorTes tb(.clock(clock), .reset(reset));

  parameter   CLK0_FREQ = 6250;    //160MHz

  always #(CLK0_FREQ/2) clock = ~clock;

  initial
  begin
     // $dumpfile("my_testout.vcd");
     // $dumpvars(-1,tb);
     // $monitor("%b",y);
     $fsdbDumpfile(1024, "./histogram.fsdb", 20);
     $fsdbDumpvars(0, testbench, "+mda");
  end

  initial
  begin
     io_en <= 1'b0;
     reset <= 1'b0;
     clock <= 1'b0;

     #100;

     io_en <= 1'b1;
     reset <= 1'b1;

     #10000;

     reset <= 1'b0;

     $monitor("monitored");

     #100000000;

     $finish();

    end

endmodule

//iverilog -o tb_out testbench.v testverilog.v
//vvp tb_out
