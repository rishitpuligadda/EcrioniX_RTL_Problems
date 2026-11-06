module top_module(
  input   clk,
  input   areset_n,
  input   d,
  output reg q
);

  // Active-low asynchronous reset DFF
	always @(posedge clk or negedge areset_n) begin
		if (!areset_n) begin
			q <= 1'b0;
		end
		else begin
			q <= d;
		end
	end
endmodule

