module top_module(
  input      clk,
  input      rst,
  output reg [3:0] q
);
  always @(posedge clk) begin
     if (rst) begin
       q <= 4'd1;
     end
     else begin
        q <= {q[2:0], q[3] ^ q[2]};
     end
  end

  // Your code here — seed q to 4'b0001 on reset, then shift with feedback = q[3]^q[2].

endmodule

