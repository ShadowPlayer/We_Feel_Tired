//TB_Divider.v
//`include"Divider.v"
`timescale 1ns / 1ns
module TB_Main_F3;
reg [3:0] Enable_SW;
reg reset;
reg Bt_Next;
reg Bt_Pre;
reg Bt_Auto;
reg clock;
wire Pulse_X;
wire Pulse_Y;

Main_F3 UUT(.sysclk(clock),
.reset(reset),
.Bt_Next(Bt_Next),
.Bt_Pre(Bt_Pre),
.Bt_Auto(Bt_Auto),
.Pulse_X(Pulse_X),
.Pulse_Y(Pulse_Y));

initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("Main_F3.vcd");
   $dumpvars();
end

initial begin: stopat
   #200000000; $finish;
end

initial begin: signals
	reset=0;
	Bt_Next=0;
	Bt_Pre=0;
	Bt_Auto=0;
	#1 reset = 1'b1;
	#30 reset = 1'b0;
		
	#200 Bt_Pre= 1'b1;
	#130000000 Bt_Pre = 1'b0;
		
	/*#10000 Bt_Pre = 1'b1;
	#130000000 Bt_Pre = 1'b0;
		
	#10000 Bt_Next = 1'b1;
	#130000000 Bt_Next=1'b0;*/
				
	//#1; $finish;  // terminates simulation
end
endmodule