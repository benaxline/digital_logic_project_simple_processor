module fourBit_FA(a,b,cin,cout,s);
	//some inputs and outputs are 1-bit, some are 4-bit
	input [2:0] a, b; 
	input cin;
	output [2:0] s;
	output cout;
	wire c1, c2, c3, c4; //c4 will be ignored 
	wire [3:0] temp;
	
	// adding
	FA a0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(c1));
	FA a1(.a(a[1]), .b(b[1]), .cin(c1), .s(s[1]), .cout(c2));
	FA a2(.a(a[2]), .b(b[2]), .cin(c2), .s(s[2]), .cout(c3));
	//FA a3(.a(a[3]), .b(b[3]), .cin(c3), .s(s[3]), .cout(cout));

	
endmodule