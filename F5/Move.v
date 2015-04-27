module Move (input wire sysclk,
	input wire Reset_Sw,
	input wire Bt_Up,
	input wire Bt_Down,
	input wire Bt_Left,
	input wire Bt_Right,
	output wire [5:0] DC_X,
	output wire [5:0] DC_Y);


reg [5:0] Duty_X = 0;
reg [5:0] Duty_Y = 0;

assign DC_X = Duty_X;
assign DC_Y = Duty_Y;

always @(posedge sysclk) begin
 	if (Reset_Sw) begin
 	Duty_X <= 0;
	Duty_Y <= 0;	
 	end else begin
		if (Bt_Up)
	 		Duty_Y <= Duty_Y + 6'd4;
	 	if (Bt_Down)
	 		Duty_Y <= Duty_Y - 6'd4;
	 	if (Bt_Left)
	 		Duty_X <= Duty_X - 6'd4;
	 	if (Bt_Right)
	 		Duty_X <= Duty_X + 6'd4;
	end
end
endmodule