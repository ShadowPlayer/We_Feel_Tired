module PWM_Generator(input wire sysclk,
input wire [3:0] SW,
output wire Pulse);
reg [5:0] count = 0;
assign Pulse = count < (SW*4'd4);
always @(posedge sysclk)
		count<=count+1'b1;
endmodule