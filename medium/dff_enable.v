module top_module(
  input   clk,
  input   areset_n,
  input   en,
  input   d,
  output reg q
);

  // DFF with async reset and clock enable
  always @(posedge clk or negedge areset_n) begin
    if (!areset_n) begin
        q <= 1'b0;
    end
    else begin
       if (en) begin
           q <= d;
        end
    end
  end
endmodule

