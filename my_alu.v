module my_alu(p, q, math_out, g);
    input [2:0] p, q;
	input [6:0] math_out;
	output [2:0] g;
	wire [2:0] xor_out, add_out, sub_out, and_out, or_out, divide_out, mod_out;
	


	xor_function my_xor(.a(p), .b(q), .g(xor_out));
	tri_buf xortri(.a(xor_out), .enable(math_out[6]), .b(g));

	adding addme(.a(p), .b(q), .addsub(AddSub), .out(add_out));
	tri_buf addtri(.a(add_out), .enable(math_out[5]), .b(g));

	subbing subme(.a(p), .b(q), .out(sub_out));
	tri_buf subtri(.a(sub_out), .enable(math_out[4]), .b(g));

	and_function andme(.a(p), .b(q), .g(and_out));
	tri_buf andtri(.a(and_out), .enable(math_out[3]), .b(g));

	or_function orme(.a(p), .b(q), .g(or_out));
	tri_buf ortri(.a(or_out), .enable(math_out[2]), .b(g));

	divide divme(.dividend(p), .divisor(q), .quotient(divide_out), .remainder(mod_out));
	tri_buf divtri(.a(divide_out), .enable(math_out[1]), .b(g));
	tri_buf modtri(.a(mod_out), .enable(math_out[0]), .b(g));

 
endmodule