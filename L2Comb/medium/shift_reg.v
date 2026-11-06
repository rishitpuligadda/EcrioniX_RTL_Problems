module top_module(
  input        clk,
  input        areset_n,
  input        din,
  output reg [3:0] q
);

  always @(posedge clk or negedge areset_n) begin
    if (!areset_n) begin
        q <= 4'd0;
    end
    else begin
         q <= {q[2:0], din};
    end
  end

  // 4-bit left shift register

endmodule

