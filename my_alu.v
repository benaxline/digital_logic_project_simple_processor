module my_alu(p, q, addsub, XOR_enable, r);
    input [2:0] p, q;
    input addsub,  XOR_enable;
    output reg [2:0] r;
    wire [2:0] t1, t2;
    wire [1:0] temporary;
    
    //add sub
    add_sub_function as(.a(p), .b(q), .addsub(addsub), .g(t1));

    // XOR
    xor_function xOR(.a(p), .b(q), .g(t2));

    assign temporary = {addsub, XOR_enable};

    always @(temporary) begin
        if (temporary == 2'b01)
            r = t2;
        else if (temporary == 2'b10)
            r = t1;
    end
 
endmodule