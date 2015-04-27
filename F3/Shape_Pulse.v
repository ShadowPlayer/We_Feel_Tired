//`include"Circle_X.v"
//`include"Circle_Y.v"
//`include"Eight_X.v"
//`include"Eight_Y.v"
//`include"Square_X.v"
//`include"Square_Y.v"
//`include"Solidsquare_X.v"
//`include"Solidsquare_Y.v"

module Shape_Pulse( input wire sysclk,
input wire [3:0] Enable_SW,
output wire Pulse_X,
output wire Pulse_Y);

wire Circle_X;
wire Circle_Y;
wire Eight_X;
wire Eight_Y;
wire Square_X;
wire Square_Y;
wire Solidsquare_X;
wire Solidsquare_Y;
reg Output_X;
reg Output_Y;

assign Pulse_X = Output_X;
assign Pulse_Y = Output_Y;

always @ (*)begin
	case (Enable_SW)
	default:begin
		Output_X <= Circle_X;
		Output_Y <= Circle_Y;
		end
	4'b0010:begin
		Output_X <= Eight_X; 
		Output_Y <= Eight_Y;
		end
	4'b0100:begin
		Output_X <= Square_X;
		Output_Y <= Square_Y;
		end
	4'b1000:begin
		Output_X <= Solidsquare_X;
		Output_Y <= Solidsquare_Y;
		end
	endcase
	end

Circle_X CX(.sysclk(sysclk),.Enable_SW_0(Enable_SW[0]),
.Pulse(Circle_X));

Circle_Y CY(.sysclk(sysclk),.Enable_SW_0(Enable_SW[0]),
.Pulse(Circle_Y));

Eight_X EX(.sysclk(sysclk),.Enable_SW_1(Enable_SW[1]),
.Pulse(Eight_X));

Eight_Y EY(.sysclk(sysclk),.Enable_SW_1(Enable_SW[1]),
.Pulse(Eight_Y));	

Square_X SX(.sysclk(sysclk),.Enable_SW_2(Enable_SW[2]),
.Pulse(Square_X));

Square_Y SY(.sysclk(sysclk),.Enable_SW_2(Enable_SW[2]),
.Pulse(Square_Y));

Solidsquare_X SSX(.sysclk(sysclk),.Enable_SW_3(Enable_SW[3]),
.Pulse(Solidsquare_X));

Solidsquare_Y SSY(.sysclk(sysclk),.Enable_SW_3(Enable_SW[3]),
.Pulse(Solidsquare_Y));
	
endmodule
	
	
