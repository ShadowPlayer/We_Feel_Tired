//TB_Triwave_Generator.v
//`include"Triwave_Generator.v"
`timescale 1ns / 1ns
module TB_Triwave_Generator;
wire [5:0] Duty_Output;
reg [5:0] Scale;
reg clock;
reg Enable_SW_2;


Triwave_Generator UUT(
.Duty_Output(Duty_Output),
.sysclk(clock),
.Scale(Scale),
.Enable_SW_2(Enable_SW_2));


initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("Triwave_Generator.vcd");
   $dumpvars();
end

initial begin: stopat
   #500000; $finish;
end

initial begin: signals
	Enable_SW_2 = 1;
	Scale = 6'd12;
end

endmodule