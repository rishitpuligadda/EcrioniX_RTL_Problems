module top_module(
  input      [3:0] a,
  input      [3:0] b,
  input      [2:0] alu_ctrl,
  output reg [3:0] result,
  output           zero
);

  // Your code here
	always @(*) begin
		case (alu_ctrl) 
			3'b000: result      = a & b;
			3'b001: result      = a | b;
			3'b010: result      = a + b;
			3'b110: result      = a - b;
			3'b111: begin 
					result[0]   = (a < b);
					result[3:1] = 3'd0;
				end
			default: result     = 4'd0;
		endcase
	end

	assign zero = (result == 4'd0);
endmodule

