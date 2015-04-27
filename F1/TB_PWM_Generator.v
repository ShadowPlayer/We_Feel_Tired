//TB_PWM_Generator.v
//`include"PWM_Generator.v"
`timescale 1ns / 1ns
module TB_PWM_Generator;
reg [3:0] SW;
wire Pulse;
reg clock;

PWM_Generator UUT(
.Pulse(Pulse),
.sysclk(clock),
.SW(SW));

initial begin: clockdef // clock definition block (only useful for synchroniser)
	clock = 1'b1;
	forever #10 clock=~clock; //the clock flips every 5ns
end

initial begin
   $dumpfile("PWM_Generator.vcd");
   $dumpvars(Pulse);
end

initial begin: stopat
   #50000; $finish;
end

initial begin: signals
   SW[0] =0;
   SW[1] =0;
   SW[2] =0;
   SW[3] =0;
   #2000 SW[0]=1;
   #10000 SW[3]=1;
   #15000 SW[2]=1;
   #20000 SW[1]=1;
end

endmodule