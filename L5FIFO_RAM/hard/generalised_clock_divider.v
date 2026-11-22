module top_module(
  input  clk,
  input  rst,
  input  [3:0] div,
  output pulse_out
);

  // Your code here — counter wraps at div-1, not a fixed constant.
	reg [3:0] cnt;
	always @(posedge clk) begin
		if (rst) begin
			cnt       <= 4'd0;
		end
		else if (cnt >= (div - 1)) begin
			cnt       <= 4'd0;
		end
		else begin
			cnt       <= cnt + {{3{1'b0}}, 1'b1};
		end
	end	
	assign pulse_out = (cnt == 4'd0);
endmodule

