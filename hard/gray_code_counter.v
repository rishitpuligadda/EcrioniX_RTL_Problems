module top_module(
  input        clk,
  input        areset_n,
  output [3:0] gray
);

  // 4-bit Gray code counter
  reg [3:0] count;
  always @(posedge clk or negedge areset_n) begin
    if (!areset_n) begin
      count <= 4'd0;
    end   
    else begin
      count <= count + 1;
    end
  end

  assign gray = count ^ (count >> 1);

endmodule

