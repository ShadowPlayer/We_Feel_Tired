module Main_F4 (input wire sysclk,
	input wire Reset_Sw,
	input wire Storage_Sw,
	input wire Bt_Up,
	input wire Bt_Down,
	input wire Bt_Left,
	input wire Bt_Right,
	output reg Pulse_X,
	output reg Pulse_Y);

wire [5:0] Move_X;
wire [5:0] Move_Y;
wire [5:0] DC_X;
wire [5:0] DC_Y;
reg [5:0] count=0;

Move Move (.Bt_Up(Bt_Up),.Bt_Down(Bt_Down),.Bt_Left(Bt_Left),.Bt_Right(Bt_Right),
.DC_X(Move_X),.DC_Y(Move_Y),.sysclk(sysclk),.Reset_Sw(Reset_Sw));

RAM Storage (.Bt_Up(Bt_Up),.Bt_Down(Bt_Down),.Bt_Left(Bt_Left),.Bt_Right(Bt_Right),
.Storage_Sw(Storage_Sw),.sysclk(sysclk),.Duty_X(Move_X),.Duty_Y(Move_Y),
.Reset_Sw(Reset_Sw),.DC_X(DC_X),.DC_Y(DC_Y));

always @(posedge sysclk) begin
	count<= count + 1;
end

always @(*) begin
	if (Storage_Sw) begin
		Pulse_X = (count < DC_X);
		Pulse_Y = (count < DC_Y);
	end else begin
		Pulse_X = (count < Move_X);
		Pulse_Y = (count < Move_Y);
	end
end
endmodule 