module top_module(
  input            clk,
  input            rst,
  input            sin,
  output reg [3:0] q
);

  // Your code here
	always @(posedge clk) begin
		if (rst) begin
			q <= 4'd0;
		end
		else begin
			q <= {q[2:0], sin};
		end
	end
endmodule

