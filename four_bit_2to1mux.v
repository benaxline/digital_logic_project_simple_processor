module four_bit_2to1mux (sel,a,b,chosen);
 
	input sel;
	input[3:0] a, b;
	output reg[3:0] chosen;
	
	always @(a, b, sel) begin
		if (sel == 1'b1)
			chosen = b;
		else
			chosen = a;
	end
 
endmodule
