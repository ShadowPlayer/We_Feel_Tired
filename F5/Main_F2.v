//`include"Frequency_Adj.v"//Finding Frequency Scale
//`include"Divider.v"//frequency modulation 
//waveforms
//`include"Sum.v"
//doubledebouncer
//`include"doubledebounce.v"

module Main_F2 (input wire sysclk,
input wire [3:0] Enable_SW,
input wire Bt_Plus,
input wire Bt_Minus,
input wire Enable_F2,
output wire Pulse);

//Frequency_Adj output, Waveforms' input
wire [5:0] Scale;

//Frequency Adjustment
Frequency_Adj Fq_Adj (.sysclk(sysclk),.Plus(Bt_Plus&Enable_F2),.Minus(Bt_Minus&Enable_F2),
.Scale(Scale));
//Waveforms Generator.

Sum Sum_pulse (.sysclk(sysclk),.Enable_SW(Enable_SW),.Pulse(Pulse),.Scale(Scale));
endmodule