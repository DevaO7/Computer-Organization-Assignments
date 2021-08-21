//                              -*- Mode: Verilog -*-
// Filename        : seq-mult.v
// Description     : Sequential multiplier
// Author          : Nitin Chandrachoodan , Devaganthan 

// This implementation corresponds to a sequential multiplier that implements multiplication of two numbers in
// twos complement format.




`define width 8
`define ctrwidth 4

module seq_mult (
		 // Outputs
		 p, rdy, 
		 // Inputs
		 clk, reset, a, b
		 ) ;

input clk, reset;
input [`width-1:0] 	 a, b;
output reg [`width*2 - 1:0] p;
output reg rdy;
reg [`width*2-1:0] multiplier , multiplicand;
reg [`ctrwidth:0] ctr;
always @(posedge clk or posedge reset) 
    if (reset) begin
        rdy <= 0;
        p 	<= 0;
        ctr <= 0;
        multiplier <= {{`width{a[`width-1]}}, a}; // sign-extend
        multiplicand <= {{`width{b[`width-1]}}, b}; // sign-extend
    end
    else begin
        if (ctr < `width*2) begin
            p <= p + ((multiplier[ctr])?(multiplicand<<ctr):0);
            ctr = ctr + 1;
        end
    
    else
        rdy <= 1;
    end


endmodule


        




