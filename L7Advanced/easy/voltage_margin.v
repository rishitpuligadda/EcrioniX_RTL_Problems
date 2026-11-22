module top_module(
  input  [7:0] vsense,
  output over_voltage,
  output under_voltage,
  output fault
);

  // Your code here — over_voltage=(vsense>200); under_voltage=(vsense<50); fault = over_voltage || under_voltage.
	assign over_voltage  = (vsense > 200);
	assign under_voltage = (vsense < 50);
	assign fault         = (over_voltage || under_voltage);
endmodule

