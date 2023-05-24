module new_fsm (code, clk, current_state, next_state, data_out, bus1_buf_en, bus2_buf_en, g_in, g_out, reg_en, math_enables, d);
    input clk;
    input [22:0] code;
    input [4:0] current_state; 
    output reg [4:0] next_state;
    
    output reg data_out, g_in, g_out;
    output reg [7:0] bus1_buf_en, bus2_buf_en;
    output [7:0] reg_en;
    output reg [6:0] math_enables; // [xor, add, sub, and, or, divide, modulo]
    output [15:0] bus1, bus2, d;
    output [3:0] func;
    output [2:0] in1, in2;
    wire [7:0] temp1, temp2, temp3;
    wire [8:0] temp;
    

    assign func = {code[22], code[21], code[20], code[19]};
    assign in1 = {code[18], code[17], code[16]};
    assign in2 = {code[15], code[14], code[13]};
    assign d = {in2, code[12], code[11], code[10], code[9], code[8], code[7], code[6], code[5], code[4], code[3], code[2], code[1], code[0]};
    assign temp = {func, current_state};
    
    

    reg_decoder i1(.reg_num(in1), .clk(clk), .reg_enable(temp1));
    reg_decoder i2(.reg_num(in2), .clk(clk), .reg_enable(temp2));

    assign reg_en = temp1;


    always @ (clk) begin
        case(temp)
            //load
            9'b000100000 : begin next_state = 5'b00001; data_out = 1'b1; bus1_buf_en = temp1; bus2_buf_en <= 8'b00000000; g_in = 1'b0; g_out = 1'b0;  end
            //move
            9'b001000000 : begin next_state = 5'b00010; data_out = 1'b0; bus1_buf_en = temp2; bus2_buf_en = 8'b00000000; g_in = 1'b0; g_out = 1'b0;  end
            //add
            9'b001100000 : begin next_state = 5'b00011; data_out = 1'b0; bus1_buf_en <= temp1; bus2_buf_en = temp2; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0100000;  end
            9'b001100011 : begin next_state = 5'b00100; data_out = 1'b0; bus1_buf_en <= temp1; bus2_buf_en = temp2; g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0100000;  end
            9'b001100100 : begin next_state = 5'b00101; data_out = 1'b0; bus1_buf_en = temp1; bus2_buf_en <= temp2; g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0100000;  end
            //subtract
            9'b010000000 : begin next_state = 5'b00111; data_out = 1'b0; bus1_buf_en <= temp1; bus2_buf_en = temp2; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0010000;  end
            9'b010000111 : begin next_state = 5'b01000; data_out = 1'b0; bus1_buf_en = temp1; bus2_buf_en = temp2; g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0010000;  end
            9'b010001000 : begin next_state = 5'b01001; data_out = 1'b0; bus1_buf_en = temp1; bus2_buf_en <= temp2; g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0010000;  end
            //xor
            9'b010100000 : begin next_state = 5'b01010; data_out = 1'b0; bus1_buf_en <= temp1;bus2_buf_en = temp2; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b1000000;  end
            9'b010101010 : begin next_state = 5'b01011; data_out = 1'b0; bus1_buf_en <= temp1;bus2_buf_en = temp2; g_in = 1'b1; g_out = 1'b0; math_enables = 7'b1000000;  end
            9'b010101011 : begin next_state = 5'b01100; data_out = 1'b0; bus1_buf_en = temp1 ;bus2_buf_en = temp2; g_in = 1'b1; g_out = 1'b1; math_enables = 7'b1000000;  end
            //or
            9'b011000000 : begin next_state = 5'b01101; data_out = 1'b0; bus1_buf_en <= temp1; bus2_buf_en = temp2; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0000100;  end
            9'b011001101 : begin next_state = 5'b01110; data_out = 1'b0; bus1_buf_en <= temp1; bus2_buf_en = temp2; g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0000100;  end
            9'b011001110 : begin next_state = 5'b01111; data_out = 1'b0; bus1_buf_en = temp1; bus2_buf_en = temp2; g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0000100;  end
            //and
            9'b011100000 : begin next_state = 5'b10000; data_out = 1'b0; bus1_buf_en <= temp1; bus2_buf_en = temp2; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0001000;  end
            9'b011110000 : begin next_state = 5'b10001; data_out = 1'b0; bus1_buf_en <= temp1; bus2_buf_en = temp2; g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0001000;  end
            9'b011110001 : begin next_state = 5'b10010; data_out = 1'b0; bus1_buf_en = temp1 ;bus2_buf_en = temp2; g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0001000;  end
            //divide
            9'b100000000 : begin next_state = 5'b10011; data_out = 1'b0; bus1_buf_en <= temp1; bus2_buf_en = temp2; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0000010;  end
            9'b100010011 : begin next_state = 5'b10100; data_out = 1'b0; bus1_buf_en <= temp1; bus2_buf_en = temp2;    g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0000010;  end
            9'b100010100 : begin next_state = 5'b10101; data_out = 1'b0; bus1_buf_en = temp1; bus2_buf_en = temp2; g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0000010;  end
            //modulo
            9'b100100000 : begin next_state = 5'b10110; data_out = 1'b0; bus1_buf_en <= temp1; bus2_buf_en = temp2; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0000001;  end
            9'b100110110 : begin next_state = 5'b10111; data_out = 1'b0; bus1_buf_en <= temp1; bus2_buf_en = temp2;    g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0000001;  end
            9'b100110111 : begin next_state = 5'b11000; data_out = 1'b0; bus1_buf_en = temp1 ;bus2_buf_en = temp2;  g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0000001;  end
            default begin next_state = 5'b00000; data_out = 1'b0;  bus1_buf_en <= 8'b00000000; bus2_buf_en <= 8'b00000000; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0000000; end
        endcase
    end
endmodule
        

