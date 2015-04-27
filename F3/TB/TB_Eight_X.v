//TB_Eight_X.v
//`include"Sinewave_Generator.v"
`timescale 1ns / 1ns
module TB_Eight_X;
wire Pulse;
reg clock;
reg Enable_SW_1;

Eight_X UUT(
.Pulse(Pulse),
.sysclk(clock),
.Enable_SW_1(Enable_SW_1));

initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("Eight_X.vcd");
   $dumpvars(Pulse);
end

initial begin: stopat
   #500000; $finish;
end

initial begin: signals
	Enable_SW_1 = 1;
   #20000 Enable_SW_1=0;
   #80000 Enable_SW_1=1;
end
endmodule