module top_module(
  input  [7:0] data,
  output       parity
);

  // Your code here
	assign parity = ^data;
endmodule

