module top_module(
  input   a,
  input   b,
  input   cin,
  output  sum,
  output  cout
);

  // Compute full adder sum and cout
	assign sum = a ^ b ^ cin;
	assign cout = (a&b) | (b&cin) | (a&cin);
endmodule

