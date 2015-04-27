//TB_Squarewave_Generator.v
//`include"Squarewave_Generator.v"
`timescale 1ns / 1ns
module TB_Squarewave_Generator;
reg [5:0] Scale;
reg Enable_SW_3;
wire [5:0] Duty_Output;	
reg clock;

Squarewave_Generator UUT(
.Scale(Scale),
.sysclk(clock),
.Duty_Output(Duty_Output),
.Enable_SW_3(Enable_SW_3));

initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("Squarewave_Generator.vcd");
   $dumpvars();
end

initial begin: stopat
   #5000000; $finish;
end
initial begin: signals
	Enable_SW_3 = 1;
	Scale = 6'd12;
end

endmodule