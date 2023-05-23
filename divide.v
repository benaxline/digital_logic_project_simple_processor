module divide (dividend, divisor, quotient, remainder);
    input [15:0] dividend, divisor;
    output [15:0] quotient, remainder;
    
    assign quotient = dividend/divisor;
    assign remainder = dividend%divisor;

endmodule