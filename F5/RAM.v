module RAM (input wire sysclk,
input wire Reset_Sw,
input wire Storage_Sw,
input wire Bt_Up,
input wire Bt_Down,
input wire Bt_Left,
input wire Bt_Right,
input wire  [5:0] Duty_X,
input wire  [5:0] Duty_Y,
output wire [5:0] DC_X,
output wire [5:0] DC_Y);

reg [5:0] RAM_X [0:255];
reg [5:0] RAM_Y [0:255];
reg [7:0] Reading_Count = 0;
reg [8:0] Reset_Addr;
reg [11:0] count_12bit = 0; // 256
reg [7:0] Addr = 8'b0; //Storage address 

initial begin
	for (Reset_Addr = 0; Reset_Addr < 9'd256; Reset_Addr = 
		Reset_Addr + 1'b1)begin
			RAM_X[Reset_Addr] = 0;
			RAM_Y[Reset_Addr] = 0;
	end
end

assign DC_X = RAM_X[Reading_Count];
assign DC_Y = RAM_Y[Reading_Count];

always @(posedge sysclk) begin
	count_12bit<= count_12bit + 1'b1;
	if (&count_12bit) begin
		Reading_Count<=Reading_Count+1'b1;
			if ((Reading_Count == Addr-1'b1)||Addr==1'b0)
				Reading_Count <= 0;
	end
	if (Reset_Sw) begin
		for (Reset_Addr = 0; Reset_Addr < 9'd256; Reset_Addr = Reset_Addr + 1'b1) begin
			RAM_X[Reset_Addr] <= 1'b0;
			RAM_Y[Reset_Addr] <= 1'b0;
		end
	end else begin 
		if (Storage_Sw) begin
				RAM_X[Addr] <= Duty_X;
				RAM_Y[Addr] <= Duty_Y;
			if (Bt_Up||Bt_Down||Bt_Left||Bt_Right)// begin
	 			Addr <= (Addr + 1'b1);
			/*	RAM_X[Addr] <= Duty_X;
				RAM_Y[Addr] <= Duty_Y;
			end 
			if (Bt_Down) begin
	 			Addr <= (Addr + 1'b1);
				RAM_X[Addr] <= Duty_X;
				RAM_Y[Addr] <= Duty_Y;
			end 
			if (Bt_Left) begin
	 			Addr <= (Addr + 1'b1);
				RAM_X[Addr] <= Duty_X;
				RAM_Y[Addr] <= Duty_Y;
			end 
			if (Bt_Right) begin
	 			Addr <= (Addr + 1'b1);
				RAM_X[Addr] <= Duty_X;
				RAM_Y[Addr] <= Duty_Y;
			end */
		end
	end
end
endmodule