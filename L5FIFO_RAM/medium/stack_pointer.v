module top_module(
  input            clk,
  input            rst,
  input            push,
  input            pop,
  output reg [3:0] sp,
  output           full,
  output           empty
);

  // Your code here
	always @(posedge clk) begin
		if (rst) begin
			sp <= 4'd0;
		end
		else if (push && !full) begin
			sp <= sp + {{3{1'b0}}, 1'b1};
		end
		else if (pop && !empty) begin
			sp <= sp - {{3{1'b0}}, 1'b1};	
		end
	end

	assign full  = (sp == 4'd15);
	assign empty = (sp == 4'd0);
endmodule

