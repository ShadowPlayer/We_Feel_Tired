//TB_Sinewave_Generator.v
//`include"Sinewave_Generator.v"
`timescale 1ns / 1ns
module TB_Sinewave_Generator;
wire [5:0] Duty_Output;
reg [5:0] Scale;
reg clock;
reg Enable_SW_0;

Sinewave_Generator UUT(
.Duty_Output(Duty_Output),
.sysclk(clock),
.Scale(Scale),
.Enable_SW_0(Enable_SW_0));

initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("Sinewave_Generator.vcd");
   $dumpvars();
end

initial begin: stopat
   #5000000; $finish;
end

initial begin: signals
	Enable_SW_0 = 1;
	Scale = 6'd12;
end
endmodule