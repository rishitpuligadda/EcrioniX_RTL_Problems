module top_module(
  input   [3:0] in,
  input   [1:0] sel,
  output reg       out
);

  // Select in[0] for sel=00, in[1] for sel=01, in[2] for sel=10, in[3] for sel=11
	always @(*) begin
		case (sel)
			2'b00: out = in[0];
			2'b01: out = in[1];
			2'b10: out = in[2];
			2'b11: out = in[3];
		endcase
	end
endmodule

