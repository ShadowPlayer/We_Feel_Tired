//TB_Divider.v
//`include"Divider.v"
`timescale 1ns / 1ns
module TB_Main_F4;
reg clock;
reg Reset_Sw;
reg Storage_Sw;
 reg Bt_Up;
 reg Bt_Down;
 reg Bt_Left;
	 reg Bt_Right;
	 reg  [5:0] Duty_X;
	 reg  [5:0] Duty_Y;
	 wire [5:0] DC_X;
	 wire [5:0] DC_Y;

RAM	 UUT(.sysclk(clock),
.Reset_Sw(Reset_Sw),
.Storage_Sw(Storage_Sw),
.Bt_Up(Bt_Up),
.Bt_Down(Bt_Down),
.Bt_Left(Bt_Left),
.Bt_Right(Bt_Right),
.Duty_X(Duty_X),
.Duty_Y(Duty_Y),
.DC_X(DC_X),
.DC_Y(DC_Y));

initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("RAM.vcd");
   $dumpvars();
end

initial begin: stopat
   #200000000; $finish;
end

initial begin: signals
	Reset_Sw=0;
	Bt_Up=0;
	Bt_Down=0;
	Bt_Left = 0;
	Bt_Right = 1'b0 ;
	Storage_Sw = 1'b1;
	Duty_X = 6'd30;
	Duty_Y = 6'd32;
	#200 Bt_Up = 1'b1;
	#20  Bt_Up = 0;
	
	#1000 Duty_X = 6'd50;
	#1 Duty_Y = 6'd52;
	#1000000 Bt_Left= 1'b1;
	#20  Bt_Left = 0;
		

				
	//#1; $finish;  // terminates simulation
end
endmodule