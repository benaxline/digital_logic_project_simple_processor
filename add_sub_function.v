module add_sub_function (a, b, addsub, g);
	input addsub;
	input [2:0] a, b;
	output [2:0] g;

	wire temp, t;
	assign temp = ~b;

	fourBit_FA pls(.a(a),.b(b), .cin(addsub), .cout(t), .s(g));

	// always @ (*) begin
	// 	if (addsub)
	// 		g = a + b;
	// 	else
	// 		g = a - b;
	// end
endmodule 