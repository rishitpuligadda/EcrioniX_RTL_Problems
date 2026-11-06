module top_module(
  input   clk,
  input   sync_rst,
  input   d,
  output reg q
);

  // Synchronous reset DFF
  always @(posedge clk) begin
    if (sync_rst) begin
       q <= 1'b0;
    end
    else begin
       q <= d;
    end
  end

endmodule

