module top_module(
  input  clk,
  input  we_a, input [2:0] addr_a, input [7:0] wdata_a, output reg [7:0] rdata_a,
  input  we_b, input [2:0] addr_b, input [7:0] wdata_b, output reg [7:0] rdata_b
);

  // Your code here — 8x8 memory array with two fully independent read/write ports.
	reg [7:0] mem [0:7];

	always @(posedge clk) begin
		if (we_a) begin
			mem[addr_a] <= wdata_a;
		end
		else begin
			rdata_a <= mem[addr_a];
		end
	end

	always @(posedge clk) begin
		if (we_b) begin
			mem[addr_b] <= wdata_b;
		end
		else begin
			rdata_b <= mem[addr_b];
		end
	end
endmodule

