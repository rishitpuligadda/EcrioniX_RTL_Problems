module top_module(
  input  clk,
  input  en,
  output gclk
);

  // Your code here — latch en while clk is LOW (transparent latch), then AND with clk.
  // This is a level-sensitive latch: always @* if(!clk) en_latched=en;
	reg gen;
	always @(*) begin
		if (!clk) begin
			gen = en;
		end
	end
	assign gclk = gen & clk;
endmodule

