//TB_Divider.v
//`include"Divider.v"
`timescale 1ns / 1ns
module TB_Divider;
reg clock;
reg [5:0]Scale;
wire Slow_clk;

Divider UUT(
.Slow_clk(Slow_clk),
.Scale(Scale),
.sysclk(clock));

initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("Divider.vcd");
   $dumpvars(Slow_clk);
end

initial begin: stopat
   #50000; $finish;
end

initial begin: signals
	Scale = 6'd;
end
endmodule