module Frequency_Adj(input wire sysclk,
input wire Plus,
input wire Minus,
output reg [5:0] Scale);

reg [3:0] Address = 0;

always @(posedge sysclk) begin
	if (Plus & (Address<4'd7))
		Address <= Address + 1'b1;
	if (Minus & (Address>4'd0))
	Address <= Address - 1'b1;
end
always @ (*)  begin 
	case (Address)
	4'd0: Scale = 6'd41;// f = 300 HZ
	4'd1: Scale = 6'd31;// f = 400 HZ
	4'd2: Scale = 6'd24;// f = 500 HZ
	4'd3: Scale = 6'd20;// f = 600 HZ
	4'd4: Scale = 6'd17;// f = 700 HZ
	4'd5: Scale = 6'd15;// f = 800 HZ
	4'd6: Scale = 6'd14;// f = 900 HZ
	4'd7: Scale = 6'd12;// f = 1000 HZ
	default: Scale = 6'd41;// the code won't execute this statement
	endcase
end
endmodule