module top_module(
  input        clk,
  input        areset_n,
  input        up_down,
  output reg [3:0] q
);

  // 4-bit bidirectional counter
	always @(posedge clk or negedge areset_n) begin
		if (!areset_n) begin
			q <= 4'd0;
		end
		else begin
			if (up_down) begin
				q <= q + 1;
			end
			else begin
				q <= q - 1;
			end
		end
	end
endmodule

