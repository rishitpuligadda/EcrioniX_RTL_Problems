module top_module(
  input  a,
  input  b,
  input  c,
  output out
);

  // Your code here
  assign out = (a & b) | (b & c) | (a & c);

endmodule

