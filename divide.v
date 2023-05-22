module divide (dividend, divisor, quotient, remainder);
    input [2:0] dividend, divisor;
    output reg [2:0] quotient, remainder;
    reg [2:0] temp = 3'b000;
    reg [2:0] div = dividend;    
    reg condition = 1'b1;
    wire [2:0] temp1;

    
    always @ (quotient) begin;
        
        while (condition) begin
            if (divisor == div) begin
                quotient = temp + 3'b001;
                remainder = 3'b000;
                condition = 1'b0;
            end
            else if (divisor > div) begin
                quotient = 3'b000;
                remainder = div;
                condition = 1'b0;
            end
            else begin
                div = div - divisor;
                temp = temp + 3'b001;
            end
        end
    end
endmodule