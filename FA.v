module FA(a,b,cin,cout,s);
	//all inputs and outputs are 1-bit
	input a, b, cin;
	output cout, s;

	assign cout = (a&b&(~cin)) | ((~a)&b&cin) | (a&(~b)&cin) | (a&b&cin);
	assign s = ((~a)&b&(~cin)) | (a&(~b)&(~cin)) | ((~a)&(~b)&cin) | (a&b&cin);

endmodule