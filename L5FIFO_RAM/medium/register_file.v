module top_module(
  input  clk,
  input  we, input [2:0] waddr, input [7:0] wdata,
  input  [2:0] raddr1, output [7:0] rdata1,
  input  [2:0] raddr2, output [7:0] rdata2,
  input  [2:0] raddr3, output [7:0] rdata3
);

  // Your code here — 8x8 register array; synchronous write on we; three combinational (asynchronous) reads.
	reg [7:0] registers [0:7];

	always @(posedge clk) begin
		if (we) begin
			registers[waddr] <= wdata;
		end
	end

	assign rdata1 = registers[raddr1];
	assign rdata2 = registers[raddr2];
	assign rdata3 = registers[raddr3];
endmodule

