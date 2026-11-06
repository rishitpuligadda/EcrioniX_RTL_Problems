module top_module(
  input  [3:0] a,
  input  [3:0] b,
  output       gt,
  output       eq,
  output       lt
);

  // Compare a and b: drive gt, eq, lt
	assign gt = (a > b);
	assign eq = (a == b);
	assign lt = (a < b);
endmodule


