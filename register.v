module register(x, clk, enable, y);
    //4-bit register
    //given in lecture 10 - modified
    input [15:0] x;
    input clk, enable;
    output reg [15:0] y;

    always @(clk or  enable) begin
        if (enable == 1'b1)
            y <= x; 
        
    end

endmodule