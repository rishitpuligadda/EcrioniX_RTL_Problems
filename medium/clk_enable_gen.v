module top_module(
  input   clk,
  input   areset_n,
  output  ce
);

  // Generate single-cycle pulse every 4 clock cycles
  reg [1:0] count;
  
  always @(posedge clk or negedge areset_n) begin
      if (!areset_n) begin
          count <= 2'd0;
      end
      else begin
          count <= count + 1;
      end 
  end
  
  assign ce = (count == 2'b11);

endmodule

