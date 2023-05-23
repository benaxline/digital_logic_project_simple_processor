module reg_decoder(reg_num, clk, reg_enable);
    input clk;
    input [15:0] reg_num;
    output reg [7:0] reg_enable; //8 registers

    always @(clk) begin
        case(reg_num)
            16'h000 : reg_enable = 8'b10000000; 
            16'h001 : reg_enable = 8'b01000000;
            16'h002 : reg_enable = 8'b00100000;
            16'h003 : reg_enable = 8'b00010000;
            16'h004 : reg_enable = 8'b00001000; 
            16'h005 : reg_enable = 8'b00000100;
            16'h006 : reg_enable = 8'b00000010;
            16'h007 : reg_enable = 8'b00000001;
            default : reg_enable = 8'b00000000; 
        endcase
    end
endmodule