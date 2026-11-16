module top_module(
  input  [3:0] wr_ptr,
  input  [3:0] rd_ptr,
  output       full,
  output       empty
);

  // Compute full and empty from pointers
	assign full  = (wr_ptr[3] != rd_ptr[3]) && (wr_ptr[2:0] == rd_ptr[2:0]);
	assign empty = (wr_ptr == rd_ptr);
endmodule

