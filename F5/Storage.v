module Storage (input wire sysclk,
input wire Storage_SW,
input wire Reset_SW,
input wire [5:0] Duty_X,
input wire [5:0] Duty_Y,
input wire Bt_Up,
input wire Bt_Down,
input wire Bt_Left,
input wire Bt_Right,
output wire [5:0] DC_X,
output wire [5:0] DC_Y);

reg [7:0] Addr = 8'b0; //Storage address 
reg [5:0] count = 6'b0;//sysclk count 
reg [5:0] RAM_X [0:255];
reg [5:0] RAM_Y [0:255];
reg [7:0] Reading_Count = 0 ;
reg [8:0] Reset_Addr = 0;

/*initial begin
	for (Reset_Addr = 0; Reset_Addr < 9'd256; Reset_Addr = 
		Reset_Addr + 1'b1)begin
			RAM_X[Reset_Addr] = 1'b0;
			RAM_Y[Reset_Addr] = 1'b0;
	end
end*/

always @(posedge sysclk) begin 
	 count<= count + 1'b1;
	 if (&count)
	 Reading_Count<=Reading_Count+1'b1;
	 if(Reset_SW)begin
		for (Reset_Addr = 0; Reset_Addr < 9'd256; Reset_Addr = 
			Reset_Addr + 1'b1) begin
			RAM_X[Reset_Addr] <= 1'b0;
			RAM_Y[Reset_Addr] <= 1'b0;
		end
	end	
end 

always @(Bt_Down,Bt_Left,Bt_Right,Bt_Up)begin
	if (Storage_SW&~Reset_SW) begin
		Addr <= Addr + 1'b1;
		RAM_X[Addr] <= Duty_X;
		RAM_Y[Addr] <= Duty_Y;
	end else if (~Storage_SW&~Reset_SW) begin
		RAM_X[Addr]<=Duty_X;
		RAM_Y[Addr]<=Duty_Y;
	end
end

assign DC_X = RAM_X[Reading_Count];
assign DC_Y = RAM_Y [Reading_Count];


endmodule 