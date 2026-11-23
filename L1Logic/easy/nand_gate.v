module top_module(
  input  a,
  input  b,
  output out
);

  // Your code here
	assign out = ~(a&b);
endmodule

