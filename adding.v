module adding(a, b, out,  addsub);
    input [15:0] a, b;
    input addsub;
    output [15:0] out;

    wire temp;
    wire t;
    assign t = 1'b0;
    assign out = a+b;
    //fourBit_FA pls(.a(a),.b(b),.cin(t),.cout(temp),.s(out));
    
endmodule