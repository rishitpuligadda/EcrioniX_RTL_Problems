module top_module(
  input  a,
  input  b,
  input  bin,
  output diff,
  output bout
);
  assign diff = a ^ b ^ bin;
  assign bout = (~a & b) | bin & (a ~^ b);
  // Your code here

endmodule

