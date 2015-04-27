module heartbeat(input wire sysclk,
output wire pulse);
parameter WIDTH=8;
reg [(WIDTH-1):0] count=0;
assign pulse=&count;
always @(posedge sysclk) begin
		count<=count+1'b1;
end

endmodule