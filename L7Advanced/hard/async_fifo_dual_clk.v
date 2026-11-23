module top_module #(
  parameter DATA_WIDTH = 8,
  parameter ADDR_WIDTH = 3 // Depth = 8
)(
  input  wire                  wr_clk,
  input  wire                  wr_rst_n,
  input  wire                  wr_en,
  input  wire [DATA_WIDTH-1:0] wr_data,
  input  wire                  rd_clk,
  input  wire                  rd_rst_n,
  input  wire                  rd_en,
  output wire [DATA_WIDTH-1:0] rd_data,
  output wire                  full,
  output wire                  empty
);

  // Implement Dual-Clock Async FIFO:
  // 1. Dual-port RAM addressed by binary wr_ptr[2:0] and rd_ptr[2:0].
  // 2. Convert (ADDR_WIDTH+1)-bit pointers to Gray code: bin ^ (bin >> 1).
  // 3. Cross Gray pointers through 2-flop synchronizers into opposite clock domain.
  // 4. full: wr_gray == {~rd_gray_sync[3:2], rd_gray_sync[1:0]}.
  // 5. empty: rd_gray == wr_gray_sync.
	localparam DEPTH = 1 << ADDR_WIDTH;
	reg [ADDR_WIDTH:0] rd_ptr, wr_ptr;	
	reg [DATA_WIDTH-1:0] fifo [0:DEPTH-1];

	wire [ADDR_WIDTH:0] wr_gray = wr_ptr ^ (wr_ptr >> 1);
	wire [ADDR_WIDTH:0] rd_gray = rd_ptr ^ (rd_ptr >> 1);

	reg [ADDR_WIDTH:0] rd_gray_sync1, rd_gray_sync2;
	reg [ADDR_WIDTH:0] wr_gray_sync1, wr_gray_sync2;

	always @(posedge wr_clk or negedge wr_rst_n) begin
		if (!wr_rst_n) begin
			wr_ptr        <= {{ADDR_WIDTH+1{1'b0}}};
			rd_gray_sync1 <= {{ADDR_WIDTH+1{1'b0}}};
			rd_gray_sync2 <= {{ADDR_WIDTH+1{1'b0}}};
		end
		else begin 
			if (wr_en && !full) begin
				fifo[wr_ptr[ADDR_WIDTH-1:0]] <= wr_data;
				wr_ptr                       <= wr_ptr + {{ADDR_WIDTH{1'b0}}, 1'b1};
			end
			rd_gray_sync1 <= rd_gray;
			rd_gray_sync2 <= rd_gray_sync1;
		end
	end

	always @(posedge rd_clk or negedge rd_rst_n) begin
		if (!rd_rst_n) begin
			rd_ptr        <= {{ADDR_WIDTH+1{1'b0}}};
			wr_gray_sync1 <= {{ADDR_WIDTH+1{1'b0}}};
			wr_gray_sync2 <= {{ADDR_WIDTH+1{1'b0}}};
		end
		else  begin
			if (rd_en && !empty) begin
				rd_ptr  <= rd_ptr + {{ADDR_WIDTH{1'b0}}, 1'b1};
			end
			wr_gray_sync1 <= wr_gray;
			wr_gray_sync2 <= wr_gray_sync1;
		end
	end
	
	assign rd_data = fifo[rd_ptr[ADDR_WIDTH-1:0]];
	assign full    = (wr_gray == {~rd_gray_sync2[ADDR_WIDTH:ADDR_WIDTH-1],
								   rd_gray_sync2[ADDR_WIDTH-2:0]});
	assign empty   = (rd_gray == wr_gray_sync2);
endmodule

