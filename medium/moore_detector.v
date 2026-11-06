module top_module(
  input   clk,
  input   areset_n,
  input   din,
  output  detected
);

  localparam s0 = 3'd0;
  localparam s1 = 3'd1;
  localparam s2 = 3'd2;
  localparam s3 = 3'd3;
  localparam s4 = 3'd4;
  reg [3:0] curr, next;

  always @(posedge clk or negedge areset_n) begin
    if (!areset_n) begin
      curr <= s0;
    end
    else begin
      curr <= next;
    end
  end

   always @(*) begin
      case(curr) 
        s0: begin
			if (din) next = s1;
			else    next = s0;
        end
		
		s1: begin
			if (din) next = s1;
			else    next = s2;
		end

		s2: begin
			if (din) next = s3;
			else    next = s0;
		end

		s3: begin
			if (din) next = s4;
			else    next = s2;
		end

		s4: begin
			if (din) next = s1;
			else    next = s2;
		end
		endcase
    end
  // Your code here — a 5-state FSM (S0..S4) tracking match progress works well.
	assign detected = (curr == s4);

  // Moore FSM detecting overlapping 1011

endmodule

