module and_function (a, b, g);
    input [2:0] a, b;
    output [2:0] g;
    
    assign g = a & b;
endmodule