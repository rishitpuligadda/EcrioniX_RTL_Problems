module top_module(
  input   clk,
  input   areset_n,
  input   in,
  output reg p_edge
);
  reg prev;
  always @(posedge clk or negedge areset_n) begin
      if (!areset_n) begin
          p_edge <= 0;
      end
      else begin
        prev <= in;
        p_edge <= ~prev & in;
      end
  end

  // Detect rising edge on 'in'

endmodule

