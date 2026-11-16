module top_module(
  input        clk,
  input        areset_n,
  input  [3:0] req,
  output reg [3:0] grant
);

  // 4-client round-robin arbiter
	reg [3:0] mask;
	wire [3:0] masked_req = req & mask;
	wire [3:0] active     = (|masked_req) ? masked_req : req;
	wire [3:0] next       = active & -active;

	always @(posedge clk or negedge areset_n) begin
		if (!areset_n) begin
			grant <= 4'd0;
			mask  = 4'b1111;
		end
		else if (|req) begin
			grant <= next;
			mask <= ~(next - 1) & ~next;
		end
		else begin
			grant <= 4'd0;
		end
	end
endmodule

