module top_module(
  input            clk,
  input            rst,
  input      [1:0] mode,
  input            sin,
  input      [3:0] din,
  output reg [3:0] q
);

  // Your code here
  always @(posedge clk) begin
    if (rst) begin
      q <= 4'd0;
    end  
    else begin
      case (mode)
        2'b00: q <= q;
        2'b01: q <= {q[2:0], sin};
        2'b10: q <= {sin, q[3:1]};
        2'b11: q <= din;
      endcase
    end
  end

endmodule

