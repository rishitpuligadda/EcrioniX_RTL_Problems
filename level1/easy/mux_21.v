module top_module(
  input   a,
  input   b,
  input   sel,
  output  out
);
  assign out = sel ? b : a;
  // Select a when sel=0, b when sel=1

endmodule


