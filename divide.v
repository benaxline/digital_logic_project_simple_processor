module divide (dividend, divisor, quotient, remainder);
    input [2:0] dividend, divisor;
    output [2:0] quotient, remainder;
    
    assign quotient = dividend/divisor;
    assign remainder = dividend%divisor;

endmodule