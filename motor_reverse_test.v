//timescale 1ns / 1ns //timescale time_unit/time_precision

module motor_reverse_test(GPIO, SW, LEDR);
	inout [15:0] GPIO;
	input [6:0] SW;
	output [15:0]LEDR;
	
	wire power;
	assign power = SW[0];
	
	wire reverse;
	assign reverse = SW[1];
	
	assign GPIO[0] = power;
	
	assign GPIO[1] = reverse;
	assign GPIO[3] = reverse;
	assign GPIO[2] = ~reverse;
	assign GPIO[4] = ~reverse;
	
	//assign GPIO[15:5] = 11{1'b0};
	assign LEDR[4:0]=GPIO[4:0];
	
	
	/**actual a1(.power(SW[0]), .reverse(SW[1]),.gpio0(GPIO[0]), .gpio1(GPIO[1]), .gpio2(GPIO[2]));
	
	*/
endmodule

/**
module actual(power, reverse, gpio0, gpio1, gpio2);
	input power;
	input reverse;
	output reg gpio0;
	output reg gpio1;
	output reg gpio2;
	
	always @(*)
	begin
		if(power == 1'b1)
			gpio0 <= 1'b1;
		else if(power == 1'b0)
			gpio0 <= 1'b0;
	end
	
	always @(*)
	begin
		if (reverse == 1'b1)
		begin
			gpio1 <= 1'b1;
			gpio2 <= 1'b0;
			
			end
		else if (reverse == 1'b0)
		begin
			gpio1 <= 1'b0;
			gpio2 <= 1'b1;
			end
	end
	
endmodule

/* TEST 1, SW[0] controls transistor
module motor_test1(GPIO, SW);
	inout [15:0]GPIO;
	input [6:0]SW;
	
	actual a1(.gpi(GPIO[0]), .s(SW[0]));
	
endmodule

module actual(gpi, s);
	output gpi;
	input s;
	
	assign gpi=s;
	
endmodule 
*/