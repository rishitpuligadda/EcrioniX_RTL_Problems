module top_module(
  input  clk,
  input  rst,
  input  async_in,
  output reg sync_out
);

  // Your code here — 3 cascaded flops: meta1 <- async_in, meta2 <- meta1, sync_out <- meta2.
	reg sync1, sync2, sync3;
	
	always @(posedge clk) begin
		if (rst) begin
			sync1    <= 1'b0;
			sync2    <= 1'b0;
			sync_out <= 1'b0;
		end
		else begin
			sync2    <= async_in;
			sync1    <= sync2;
			sync_out <= sync1;
		end
	end
endmodule

