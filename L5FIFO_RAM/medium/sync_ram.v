module top_module(
  input      clk,
  input      we,
  input      [2:0] addr,
  input      [7:0] din,
  output reg [7:0] dout
);

  // Your code here — reg [7:0] mem [0:7]; write on we, and register dout <= mem[addr] every cycle.
	reg [7:0] mem [0:7];

	always @(posedge clk) begin
		if (we) begin
			mem[addr] <= din;
		end
	end

	assign dout = we ? 8'hx : mem[addr];
endmodule

