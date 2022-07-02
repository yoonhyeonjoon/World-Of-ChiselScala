`timescale 1ns/1ps

module testbench;
   logic clock;
   logic io_en;
   reg reset;
   parameter   CLK0_FREQ = 6250;    //160MHz


   VolumeIntegratorTestabler tb(clock, reset);

   initial
   begin
      // $dumpfile("my_testout.vcd");
      // $dumpvars(-1,tb);
      // $monitor("%b",y);
      $fsdbDumpfile(1024, "counterDDD.fsdb", 20);
      $fsdbDumpvars(0, testbench, "+mda");
   end


   initial begin
      io_en <= 1'b0;
      reset <= 1'b0;
      clock <= 1'b0;
      #100;
      io_en <= 1'b1;
      reset <= 1'b1;
      #10000;
      reset <= 1'b0;

      $monitor("monitored");
      #10000000;
      $finish();
   end

   always #(CLK0_FREQ/2) clock = ~clock;

endmodule

//iverilog -o tb_out testbench.v testverilog.v
//vvp tb_out