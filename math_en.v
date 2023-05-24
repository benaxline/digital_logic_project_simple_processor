module math_en(func, enables);
    input [3:0] func;
    output reg [6:0] enables;

    always @(func) begin
        case (func)
        4'b0011 : begin enables = 7'b0100000; end //add
        4'b0100 : begin enables = 7'b0010000; end //subtract
        4'b0101 : begin enables = 7'b1000000; end //xor
        4'b0110 : begin enables = 7'b0000100; end //or
        4'b0111 : begin enables = 7'b0001000; end //and
        4'b1000 : begin enables = 7'b0000010; end //divide
        4'b1001 : begin enables = 7'b0000001; end //modulo
        default : begin enables = 7'b0000000; end //nothing enabled

        endcase
    end

endmodule