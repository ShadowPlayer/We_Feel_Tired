module Main_F4 (input wire sysclk,
	input wire Reset_Sw,
	input wire Storage_Sw,
	input wire Bt_up,
	input wire Bt_Down,
	input wire Bt_Left,
	input wire Bt_Right,
	output wire Pulse_X,
	output wire Pulse_Y);

reg [5:0] Move_X;
reg [5:0] Move_Y;
reg [5:0] DC_X;
reg [5:0] DC_Y;
reg [5:0] count=0;

Quad_Debounce Quad_Deb (.X0(Bt_Up),.X1(Bt_Down),.X2(Bt_Left),.X3(Bt_Right),
.X0_deb(Up_deb),.X1_deb(Down_deb),.X2_deb(Left_deb),.X3_deb(Right_deb),
.sysclk(sysclk));

Move Move (.Bt_Up(Up_deb),.Bt_Down(Down_deb),.Bt_Left(Left_deb),.Bt_Right(Right_deb),
.Duty_X(Move_X),.Duty_Y(Move_Y),.sysclk(sysclk).Reset_Sw(Reset_Sw));

RAM Storage (.Bt_Up(Up_deb),.Bt_Down(Down_deb),.Bt_Left(Left_deb),.Bt_Right(Right_deb),
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