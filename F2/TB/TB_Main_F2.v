//TB_Divider.v
//`include"Divider.v"
`timescale 1ns / 1ns
module TB_Main_F2;
reg [3:0] Enable_SW;
reg reset;
reg Bt_Plus;
reg Bt_Minus;
reg clock;
wire Pulse;

Main_F2 UUT(.Enable_SW(Enable_SW),
.sysclk(clock),
.reset(reset),
.Bt_Minus(Bt_Minus),
.Bt_Plus(Bt_Plus),
.Pulse(Pulse));

initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("Main_F2.vcd");
   $dumpvars();
end

initial begin: stopat
   #10000000; $finish;
end

initial begin: signals
	reset=0;
	Bt_Plus=0;
	Bt_Minus=0;
	Enable_SW[0]=1;//Sine
	Enable_SW[1]=0;//Saw
	Enable_SW[2]=1;//Tri
	Enable_SW[3]=0;//Squ
	
	/*#1 reset = 1'b1;
	#30 reset = 1'b0;
	# 1000000 Enable_SW[0]=0;//Sine
	
	# 1000000 Enable_SW[1]=0;//Saw
	
	# 1000000 Enable_SW[2]=0;//Tri
	
	# 1000000 Enable_SW[3]=0;//Squ
	
	# 1000000 Enable_SW[0]=1;//Sine
	
	# 1000000 Enable_SW[1]=1;//Saw
	
	# 1000000 Enable_SW[2]=1;//Tri
	
	# 1000000 Enable_SW[3]=1;//Squ*/
	
	/*#200 Bt_Plus= 1'b1;
	#130000000 Bt_Plus = 1'b0;
		
	#10000 Bt_Minus = 1'b1;
	#130000000 Bt_Minus = 1'b0;
		
	#10000 Bt_Plus = 1'b1;
	#130000000 Bt_Plus=1'b0;*/
				
	//#1; $finish;  // terminates simulation
end
endmodule