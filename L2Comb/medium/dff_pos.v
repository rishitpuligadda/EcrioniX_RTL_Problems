module top_module(
  input   clk,
  input   d,
  output reg q
);

  always @(posedge clk) begin
     q <= d;
  end
  // Positive-edge-triggered D flip-flop

endmodule
