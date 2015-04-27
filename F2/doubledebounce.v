//`include"heartbeat.v"
module doubledebounce (input wire X0,
input wire X1,
input wire sysclk,
input wire reset,
output wire X0_deb,
output wire X1_deb	//X0 represents the input for the "0" key, X1 for the "1" key
);

wire pulse;

// heartbeat generator instantiation
heartbeat #(21) hb(.sysclk(sysclk),.reset(reset),.pulse(pulse));

//debouncer variables
reg [2:0] ff0, ff1;   // debouncer flipflop chains for signal 0 and 1
reg ff0_out, ff1_out; // flipflops for single pulse on transition


always @(posedge sysclk) begin    //events which happen at every clock cycle	
  	ff0_out<=ff0[0]&ff0[1]&ff0[2]; 
	ff1_out<=ff1[0]&ff1[1]&ff1[2];
	if(reset) begin
	   ff0<=3'b0;
	   ff1<=3'b0;
	end
	else if(pulse) begin //debouncer section transitions are enabled by pulse
	     ff0[0]<=X0&(~X1);
	     ff0[1]<=ff0[0];
	     ff0[2]<=ff0[1];

	     ff1[0]<=X1&(~X0);
	     ff1[1]<=ff1[0];
	     ff1[2]<=ff1[1];
	   end
end


//output logic
assign	X0_deb=(ff0[0]&ff0[1]&ff0[2])&(~ff0_out);
assign	X1_deb=(ff1[0]&ff1[1]&ff1[2])&(~ff1_out);

endmodule
