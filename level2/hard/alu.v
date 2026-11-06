module top_module(
  input      [3:0] a,
  input      [3:0] b,
  input      [1:0] op,
  output reg [3:0] out,
  output           zero
);

  // Your code here
  always @(*) begin
    case (op)
      2'b00: out = a + b;
      2'b01: out = a - b;
      2'b10: out = a & b;
      2'b11: out = a | b;
    endcase  
  end
  
  assign zero = (out == 4'd0);
endmodule

