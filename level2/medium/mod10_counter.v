module top_module(
  input        clk,
  input        areset_n,
  output reg [3:0] q
);
  always @(posedge clk or negedge areset_n) begin
      if (!areset_n || q == 4'd9) begin
          q <= 4'd0;
      end
      else begin
          q <= q + 1;
      end
  end

  // Count from 0 to 9, then wrap back to 0

endmodule

