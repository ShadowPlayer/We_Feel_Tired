//TB_Divider.v
//`include"Divider.v"
`timescale 1ns / 1ns
module TB_Key_Proc;
wire [3:0] Enable_SW;
reg Bt_Next;
reg Bt_Pre;
reg Bt_Auto;
reg clock;
Key_Proc UUT(.sysclk(clock),
.Bt_Next(Bt_Next),
.Bt_Pre(Bt_Pre),
.Bt_Auto(Bt_Auto),
.Enable_SW(Enable_SW));

initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("Key_Proc.vcd");
   $dumpvars();
end

initial begin: stopat
   #100000000; $finish;
end

initial begin: signals
	Bt_Next=0;
	Bt_Pre=0;
	Bt_Auto=0;
	
	#300 Bt_Auto = 1'b1;
	#20 Bt_Auto=1'b0;

	#30000000 Bt_Auto = 1'b1;
	#20 Bt_Auto=1'b0;
    
	#30000000 Bt_Auto = 1'b1;
	#20 Bt_Auto=1'b0;	
	/*#10000 Bt_Pre = 1'b1;
	#130000000 Bt_Pre = 1'b0;
		
	#10000 Bt_Next = 1'b1;
	#130000000 Bt_Next=1'b0;*/
				
	//#1; $finish;  // terminates simulation
end
endmodule