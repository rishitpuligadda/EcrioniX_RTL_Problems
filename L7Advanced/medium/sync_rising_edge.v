module top_module(
  input  clk,
  input  rst,
  input  async_in,
  output reg pulse_out
);

  // Your code here — 2-flop synchronize async_in, then pulse on the rising edge of the synchronized signal.
	reg sync1, sync2, sync_d;	

	always @(posedge clk) begin
		if (rst) begin
			sync1     <= 1'b0;
			sync2     <= 1'b0;
			sync_d    <= 1'b0;
			pulse_out <= 1'b0;
		end
		else begin
			sync1  <= async_in;
			sync2  <= sync1;
			sync_d <= sync2;
			pulse_out <= ~sync_d & sync2;
		end
	end
endmodule

