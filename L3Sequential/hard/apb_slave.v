module top_module(
  input         pclk,
  input         preset_n,
  input  [3:0]  paddr,
  input         psel,
  input         penable,
  input         pwrite,
  input  [31:0] pwdata,
  output reg [31:0] prdata,
  output        pready
);

  // APB Slave containing Reg0 (offset 0x0) and Reg1 (offset 0x4)
	reg [31:0] reg0, reg1;

	always @(posedge pclk or negedge preset_n) begin
		if (!preset_n) begin
			reg0 <= 32'd0;
			reg1 <= 32'd0;
		end
		else if (psel && penable && pwrite) begin
			case(paddr)
				4'h0: reg0 <= pwdata;
				4'd4: reg1 <= pwdata;
				default: ;
			endcase
		end
	end	

	assign prdata = (psel && penable && !pwrite) ?
					(paddr == 4'h0 ? reg0 :
					 paddr == 4'h4 ? reg1 : 32'd0) : 32'd0;

	assign pready = 1'b1;
endmodule

