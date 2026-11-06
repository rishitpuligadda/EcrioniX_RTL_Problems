module top_module(
  input  [7:0] in,
  output reg [2:0] out,
  output reg      valid
);

  // Your code here
  always @(*) begin
    casex (in)
      8'b00000001: begin valid = 1; out = 3'd0; end
      8'b0000001x: begin valid = 1; out = 3'd1; end
      8'b000001xx: begin valid = 1; out = 3'd2; end
      8'b00001xxx: begin valid = 1; out = 3'd3; end
      8'b0001xxxx: begin valid = 1; out = 3'd4; end
      8'b001xxxxx: begin valid = 1; out = 3'd5; end
      8'b01xxxxxx: begin valid = 1; out = 3'd6; end
      8'b1xxxxxxx: begin valid = 1; out = 3'd7; end
      default:     begin valid = 0; out = 3'd0; end
    endcase
  end
endmodule

