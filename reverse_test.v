`timescale 1ns / 1ns // `timescale time_unit/time_precision

module motor_test1(GPIO, SW, LEDR);
	inout [15:0] GPIO;
	input [6:0] SW;
	output [15:0]LEDR;
	
	wire on;
	wire reverse;

	assign GPIO[0] = on;
	assign GPIO[1] = reverse;
	assign GPIO[3] = reverse;
	assign GPIO[2] = ~reverse;
	assign GPIO[4] = ~reverse;

	assign on = SW[0];
	assign reverse = SW[1];

	assign LEDR[4:0] = GPIO[4:0];
	
endmodule

