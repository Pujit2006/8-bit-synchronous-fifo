`timescale 1ns/1ps
module sync_fifo(input clk, input rst, input wr, input rd, input [7:0] din, output [7:0] dout, output full, output empty, output afull);
  reg [7:0] mem [0:3];
  reg [1:0] wr_ptr, rd_ptr;
  reg [2:0] count;

  assign full  = (count == 3'd4);
  assign empty = (count == 3'd0);
  assign afull = (count >= 3'd2);
  assign dout  = empty ? 8'd0 : mem[rd_ptr];

  wire do_write = wr && !full;
  wire do_read  = rd && !empty;

  always @(posedge clk) begin
    if (rst) begin
      wr_ptr <= 2'd0;
      rd_ptr <= 2'd0;
      count  <= 3'd0;
    end
    else begin
      if (do_write) begin
        mem[wr_ptr] <= din;
        wr_ptr <= wr_ptr + 2'd1;
      end

      if (do_read)
        rd_ptr <= rd_ptr + 2'd1;

      case ({do_write, do_read})
        2'b10: count <= count + 3'd1;
        2'b01: count <= count - 3'd1;
        default: count <= count;
      endcase
    end
  end

endmodule
