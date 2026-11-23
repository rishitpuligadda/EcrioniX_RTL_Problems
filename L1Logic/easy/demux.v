module top_module(
  input        in,
  input  [1:0] sel,
  output [3:0] out
);

  // Your code here
	assign out = in << sel;
endmodule

