//TB_Frequency_Adj.v
//`include"Frequency_adj.v"
`timescale 1ns / 1ns
module TB_Frequency_Adj;
wire [5:0] Scale;
reg clock;
reg Plus;
reg Minus;

Frequency_adj UUT(
.Plus(Plus),
.Minus(Minus),
.sysclk(clock),
.Scale(Scale));

initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("Frequency_adj.vcd");
   $dumpvars(Scale);
end

initial begin: stopat
   #2000; $finish;
end
initial begin: signals
	Plus = 0;
	Minus = 0;
	#110 Plus = 1;
	#111 Plus = 0;
	#120 Plus = 1;
	#121 Plus = 0;
	#130 Minus = 1;
	#131 Minus = 0;
	#140 Minus = 1;
	#141 Minus = 0;
   end
endmodule