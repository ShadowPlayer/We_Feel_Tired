//`include"Sinewave_Generator.v"
//`include"Sawwave_Generator.v"
//`include"Triwave_Generator.v"
//`include"Squarewave_Generator.v"

module Sum (input wire sysclk,
input wire [3:0] Enable_SW,
input wire [5:0] Scale,
output wire Pulse);
//define automatic clipping factors
reg [2:0] Clip_Factor;
reg [5:0] count = 0;
wire [5:0] Duty_Output_Sine;
wire [5:0] Duty_Output_Tri;
wire [5:0] Duty_Output_Saw;
wire [5:0] Duty_Output_Square;
reg [5:0] Duty_Sum;

assign Pulse =(count < Duty_Sum);

always @(posedge sysclk) begin
	count<=count+1'b1;
end

Sinewave_Generator Slow_Sine(.sysclk(sysclk),.Enable_SW_0(Enable_SW[0]),
.Duty_Output(Duty_Output_Sine),.Scale(Scale));

Sawwave_Generator Slow_Saw(.sysclk(sysclk),.Enable_SW_1(Enable_SW[1]),
.Duty_Output(Duty_Output_Saw),.Scale(Scale));

Triwave_Generator Slow_Tri(.sysclk(sysclk),.Enable_SW_2(Enable_SW[2]),
.Duty_Output(Duty_Output_Tri),.Scale(Scale));

Squarewave_Generator Slow_Square(.sysclk(sysclk),.Enable_SW_3(Enable_SW[3]),
.Duty_Output(Duty_Output_Square),.Scale(Scale));

always @(*)begin
	case(Enable_SW)
		4'd3,4'd5,4'd6,4'd9,4'd10,4'd12: Clip_Factor=3'd2;
		4'd7,4'd11,4'd13,4'd14,4'd15: Clip_Factor=3'd4;
		default: Clip_Factor=3'd1;
	endcase
		if (Clip_Factor == 3'd2)
			Duty_Sum = (Duty_Output_Sine + Duty_Output_Saw + Duty_Output_Square + Duty_Output_Tri)/2;	
		else if	(Clip_Factor == 3'd4)
			Duty_Sum = (Duty_Output_Sine + Duty_Output_Saw + Duty_Output_Square + Duty_Output_Tri)/4;	
		else 
			Duty_Sum = (Duty_Output_Sine + Duty_Output_Saw + Duty_Output_Square + Duty_Output_Tri);
end	
endmodule