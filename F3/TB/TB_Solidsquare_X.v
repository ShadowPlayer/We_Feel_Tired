//TB_Solidsquare_X.v
//`include"Sinewave_Generator.v"
`timescale 1ns / 1ns
module TB_Solidsquare_X;
wire Pulse;
reg clock;
reg Enable_SW_3;

Solidsquare_X UUT(
.Pulse(Pulse),
.sysclk(clock),
.Enable_SW_3(Enable_SW_3));

initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("Solidsquare_X.vcd");
   $dumpvars(Pulse);
end

initial begin: stopat
   #500000; $finish;
end

initial begin: signals
	Enable_SW_3 = 1;
   #20000 Enable_SW_3=0;
   #80000 Enable_SW_3=1;
end
endmodule