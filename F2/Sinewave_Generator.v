module Sinewave_Generator(input wire sysclk,
input wire Enable_SW_0,
input wire [5:0] Scale,
output wire [5:0] Duty_Output);

reg [5:0] count = 0;
reg [5:0] DC_Index = 0;
reg [5:0] Duty_Cycle = 0;
reg [5:0] Index_Count = 0;	

assign Duty_Output = Duty_Cycle*Enable_SW_0;

always @(posedge sysclk)begin
	count<=count+1'b1;
	if (&count==1) begin 
		DC_Index<=DC_Index+1'b1;
		if (DC_Index ==  (Scale - 6'b1)) begin
			Index_Count <= Index_Count + 1'b1;
			DC_Index <=1'b0;
		end
	end
end
	
always @ (*)begin
	case (Index_Count)//Duty_Cycle Lookup Table
        6'd0: Duty_Cycle = 6'd0;
        6'd1: Duty_Cycle = 6'd0;
        6'd2: Duty_Cycle = 6'd1;
        6'd3: Duty_Cycle = 6'd1;
        6'd4: Duty_Cycle = 6'd3;
        6'd5: Duty_Cycle = 6'd4;
        6'd6: Duty_Cycle = 6'd6;
        6'd7: Duty_Cycle = 6'd8;
        6'd8: Duty_Cycle = 6'd10;
        6'd9: Duty_Cycle = 6'd12;
        6'd10: Duty_Cycle = 6'd15;
        6'd11: Duty_Cycle = 6'd18;
        6'd12: Duty_Cycle = 6'd21;
        6'd13: Duty_Cycle = 6'd24;
        6'd14: Duty_Cycle = 6'd27;
        6'd15: Duty_Cycle = 6'd30;
        6'd16: Duty_Cycle = 6'd33;
        6'd17: Duty_Cycle = 6'd36;
        6'd18: Duty_Cycle = 6'd39;
        6'd19: Duty_Cycle = 6'd42;
        6'd20: Duty_Cycle = 6'd45;
        6'd21: Duty_Cycle = 6'd48;
        6'd22: Duty_Cycle = 6'd51;
        6'd23: Duty_Cycle = 6'd53;
        6'd24: Duty_Cycle = 6'd55;
        6'd25: Duty_Cycle = 6'd57;
        6'd26: Duty_Cycle = 6'd59;
        6'd27: Duty_Cycle = 6'd60;
        6'd28: Duty_Cycle = 6'd62;
        6'd29: Duty_Cycle = 6'd62;
        6'd30: Duty_Cycle = 7'd63;
        6'd31: Duty_Cycle = 7'd63;
        6'd32: Duty_Cycle = 7'd63;
        6'd33: Duty_Cycle = 7'd63;
        6'd34: Duty_Cycle = 6'd62;
        6'd35: Duty_Cycle = 6'd62;
        6'd36: Duty_Cycle = 6'd60;
        6'd37: Duty_Cycle = 6'd59;
        6'd38: Duty_Cycle = 6'd57;
        6'd39: Duty_Cycle = 6'd55;
        6'd40: Duty_Cycle = 6'd53;
        6'd41: Duty_Cycle = 6'd51;
        6'd42: Duty_Cycle = 6'd48;
        6'd43: Duty_Cycle = 6'd45;
        6'd44: Duty_Cycle = 6'd42;
        6'd45: Duty_Cycle = 6'd39;
        6'd46: Duty_Cycle = 6'd36;
        6'd47: Duty_Cycle = 6'd33;
        6'd48: Duty_Cycle = 6'd30;
        6'd49: Duty_Cycle = 6'd27;
        6'd50: Duty_Cycle = 6'd24;
        6'd51: Duty_Cycle = 6'd21;
        6'd52: Duty_Cycle = 6'd18;
        6'd53: Duty_Cycle = 6'd15;
        6'd54: Duty_Cycle = 6'd12;
        6'd55: Duty_Cycle = 6'd10;
        6'd56: Duty_Cycle = 6'd8;
        6'd57: Duty_Cycle = 6'd6;
        6'd58: Duty_Cycle = 6'd4;
        6'd59: Duty_Cycle = 6'd3;
        6'd60: Duty_Cycle = 6'd1;
        6'd61: Duty_Cycle = 6'd1;
        6'd62: Duty_Cycle = 6'd0;
		  6'd63: Duty_Cycle = 6'd0;
	endcase
	end
endmodule