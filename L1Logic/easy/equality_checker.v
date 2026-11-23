module top_module(
  input  [7:0] a,
  input  [7:0] b,
  output       eq
);

  // Your code here
	assign eq = (a == b);
endmodule

