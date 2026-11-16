module top_module(
  input        clk,
  input        we,
  input  [4:0] addr,
  input  [7:0] din,
  output reg [7:0] dout
);
  // 32x8 single-port RAM with read-first semantics
	reg [7:0] mem [31:0];

	always @(posedge clk) begin
		if (we) begin
			mem[addr] <= din;
		end
		dout <= mem[addr];
	end
endmodule

