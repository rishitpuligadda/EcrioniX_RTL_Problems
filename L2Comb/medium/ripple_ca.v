module top_module(
  input  [3:0] a,
  input  [3:0] b,
  input        cin,
  output [3:0] sum,
  output       cout
);

  // Your code here
  assign {cout, sum} = a + b + cin;

endmodule

