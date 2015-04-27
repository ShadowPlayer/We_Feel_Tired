//`include"Frequency_Adj.v"//Finding Frequency Scale
//`include"Divider.v"//frequency modulation 
//waveforms
//`include"Sum.v"
//doubledebouncer
//`include"doubledebounce.v"

module Main_F2 (input wire sysclk,
input wire [3:0] Enable_SW,
input wire reset,
input wire Bt_Plus,
input wire Bt_Minus,
output wire Pulse);

// Variables
//debouncer output
wire Plus_deb;
wire Minus_deb;
//Frequency_Adj output, Waveforms' input
wire [5:0] Scale;

//Sub modules
// Button Debounce
doubledebounce DB (.X0(Bt_Plus),.X1(Bt_Minus),.reset(reset),.X0_deb(Plus_deb),
.X1_deb(Minus_deb),.sysclk(sysclk));
//Frequency Adjustment
Frequency_Adj Fq_Adj (.sysclk(sysclk),.Plus(Plus_deb),.Minus(Minus_deb),
.Scale(Scale));
//Waveforms Generator.

Sum Sum_pulse (.sysclk(sysclk),.Enable_SW(Enable_SW),.Pulse(Pulse),.Scale(Scale));
endmodule