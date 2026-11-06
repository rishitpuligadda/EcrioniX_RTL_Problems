imodule top_module(
  input  [7:0] data,
  input  [2:0] shamt,
  output [7:0] out
);

  // Your code here
  assign out = (data << shamt) | (data >> (8 - shamt));

endmodule


