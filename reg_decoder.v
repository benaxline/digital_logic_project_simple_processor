module reg_decoder(reg_num, clk, reg_enable);
    input clk;
    input [2:0] reg_num;
    output reg [7:0] reg_enable; //8 registers

    always @(clk) begin
        case(reg_num)
            3'b000 : reg_enable = 8'b10000000; 
            3'b001 : reg_enable = 8'b01000000;
            3'b010 : reg_enable = 8'b00100000;
            3'b011 : reg_enable = 8'b00010000;
            3'b100 : reg_enable = 8'b00001000; 
            3'b101 : reg_enable = 8'b00000100;
            3'b110 : reg_enable = 8'b00000010;
            3'b111 : reg_enable = 8'b00000001;
            default : reg_enable = 8'b00000000; 
        endcase
    end
endmodule