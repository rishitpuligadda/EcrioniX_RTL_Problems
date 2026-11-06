module top_module(
  input  clk,
  input  load,
  input  [3:0] din,
  output sout
);
  reg [3:0] store;
  always @(posedge clk) begin
     if (load) begin
       store <= din;
     end
     else begin
        store <= {store[2:0], 1'b0};
     end
  end
  
  assign sout = store[3];

  // Your code here

endmodule

