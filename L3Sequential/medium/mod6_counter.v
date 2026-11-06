module top_module(
  input            clk,
  input            rst,
  output reg [2:0] q
);

  // Your code here
	always @(posedge clk) begin
		if (rst || q == 4'd5) begin
			q <= 4'd0;
		end
		else begin
			q <= q + 1;
		end
	end
endmodule

