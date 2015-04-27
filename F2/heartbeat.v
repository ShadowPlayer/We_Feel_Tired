module heartbeat(input wire sysclk,
input wire reset,
output wire pulse);

parameter WIDTH=8;
reg [(WIDTH-1):0] count=0;
assign pulse=&count;

always @(posedge sysclk) begin
	if(reset)
		count<={WIDTH{1'b0}};
	else
		count<=count+1'b1;
	end
endmodule