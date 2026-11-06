module top_module(
  input        [1:0] in,
  input              enable,
  output       [3:0] out
);

  // Decode 2-bit binary to 4-bit one-hot when enable=1
	assign out = enable ? 1 << in : 4'd0;
endmodule

