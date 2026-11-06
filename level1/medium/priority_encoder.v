module top_module(
  input      [3:0] in,
  output reg [1:0] out,
  output reg       valid
);

  // Your code here
	always @(*) begin
		casex (in)
			4'b0001: begin out = 2'd0; valid = 1; end
			4'b001x: begin out = 2'd1; valid = 1; end
			4'b01xx: begin out = 2'd2; valid = 1; end
			4'b1xxx: begin out = 2'd3; valid = 1; end
			default: valid = 0;
		endcase
	end
endmodule

