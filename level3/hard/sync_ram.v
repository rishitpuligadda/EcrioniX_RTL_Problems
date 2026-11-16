module top_module(
  input        clk,
  input        we,
  input  [3:0] addr,
  input  [7:0] data,
  output reg [7:0] q
);

  // 16x8 Synchronous RAM with registered read output
	reg [7:0] memory [0:15];

	always@(posedge clk) begin
		if (we) begin
			memory[addr] <= data;
		end
		else begin
			q <= memory[addr];
		end
	end
endmodule

