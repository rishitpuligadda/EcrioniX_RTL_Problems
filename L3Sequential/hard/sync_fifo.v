module top_module(
  input        clk,
  input        areset_n,
  input        wr_en,
  input  [7:0] din,
  input        rd_en,
  output reg [7:0] dout,
  output       full,
  output       empty
);

  // 8-entry by 8-bit Synchronous FIFO
	reg [7:0] fifo [7:0];
	reg [7:0] wr_ptr, rd_ptr;	

	always @(posedge clk or negedge areset_n) begin
		if (!areset_n) begin
			dout   <= 8'b0;
			wr_ptr <= 1'b0;
			rd_ptr <= 1'b0;
		end
		else if (wr_en) begin
			fifo[wr_ptr] <= din;
			wr_ptr       <= wr_ptr + 1;
		end
		else if (rd_en) begin
			dout   <= fifo[rd_ptr];
			rd_ptr <= rd_ptr + 1;
		end
	end

	assign empty = (rd_ptr == wr_ptr);
	assign full  = (wr_ptr == (rd_ptr-1));
endmodule

