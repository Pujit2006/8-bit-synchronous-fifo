
`timescale 1ns/1ps
module tb;
  reg rst = 1;
  reg wr = 0;
  reg rd = 0;
  reg [7:0] din = 0;
  reg clk = 0;

  wire afull, full, empty;
  wire [7:0] dout;

  always #5 clk = ~clk;

  sync_fifo dut(.rst(rst), .wr(wr), .rd(rd), .din(din), .clk(clk), .afull(afull), .full(full), .empty(empty), .dout(dout));

  initial begin
    $monitor("Time=%0t | wr=%b rd=%b din=%0d dout=%0d | afull=%b full=%b empty=%b",
             $time, wr, rd, din, dout, afull, full, empty);

    @(negedge clk); rst = 1;
    @(negedge clk); rst = 1;
    @(negedge clk); rst = 0; wr = 1; din = 236;
    @(negedge clk); din = 237;
    @(negedge clk); din = 74;
    @(negedge clk); din = 213;
    @(negedge clk); wr = 0; rd = 1; din = 240;
    @(negedge clk); wr = 1; rd = 1; din = 114;
    @(negedge clk); din = 213;
    @(negedge clk); rd = 0; din = 142;
    @(negedge clk); din = 207;
    @(negedge clk); rd = 1; din = 193;
    @(negedge clk); rd = 0; din = 129;
    @(negedge clk); din = 207;
    @(negedge clk); wr = 0; din = 21;
    @(negedge clk); din = 221;

    @(negedge clk);
    $finish;
  end
endmodule

