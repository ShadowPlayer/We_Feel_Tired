module heartbeat(input wire sysclk,
output wire pulse);

parameter WIDTH=8;
reg [(WIDTH-1):0] count=0;
assign pulse=&count;

<<<<<<< HEAD
always @(posedge sysclk)
=======
always @(posedge sysclk) begin
>>>>>>> origin/master
		count<=count+1'b1;
endmodule