module top_module(
  input            clk,
  input            rst,
  input            push,
  input            pop,
  output reg [3:0] count,
  output           full,
  output           empty
);

  // Your code here — handle push-only, pop-only, both-at-once, and neither, as four distinct cases.
	wire do_push = push && !full;
	wire do_pop  = pop && !empty;

	always @(posedge clk) begin
		if (rst) begin
			count <= 4'd0;
		end
		else begin
			case({do_push, do_pop})
				2'b10:   count <= count + {{3{1'b0}}, 1'b1};
				2'b01:   count <= count - {{3{1'b0}}, 1'b1};
				default: count <= count;
			endcase
		end
	end

	assign full  = (count == 4'd15);
	assign empty = (count == 4'd0);
endmodule

