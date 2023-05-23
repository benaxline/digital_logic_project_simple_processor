module xor_function (a, b, g);
	input [15:0] a, b;
	output [15:0] g;
	
	assign g = a ^ b;

endmodule