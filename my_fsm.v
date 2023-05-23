module my_fsm (input1, input2, current_state, func, clk, next_state, data_out, R_in, R_out, AddSub, a_in, g_in, g_out,  math_enables);
    input clk;
    input [15:0] input1, input2;
    input [3:0] func;
    input [4:0] current_state; 
    output reg [4:0] next_state;
    output reg data_out, AddSub,a_in, g_in, g_out;
    output reg [7:0] R_out, R_in;
    wire [7:0] temp1, temp2;
    wire [8:0] temp;
    output reg [6:0] math_enables; // [xor, add, sub, and, or, divide, modulo]

    
    assign temp = {func, current_state};

    reg_decoder in1(.reg_num(input1), .clk(clk), .reg_enable(temp1));
    reg_decoder in2(.reg_num(input2), .clk(clk), .reg_enable(temp2));

 


    always @ (clk) begin
        case(temp)
            //load
            9'b000100000 : begin next_state = 5'b00001; data_out = 1'b1; R_in = temp1; R_out <= 8'b00000000; AddSub = 1'b0; a_in = 1'b0;   g_in = 1'b0; g_out = 1'b0; end
            //move
            9'b001000000 : begin next_state = 5'b00010; data_out = 1'b0; R_in = temp1; R_out = temp2;  AddSub = 1'b0; a_in = 1'b0;   g_in = 1'b0; g_out = 1'b0; end
            //add
            9'b001100000 : begin next_state = 5'b00011; data_out = 1'b0; R_in <= 8'b00000000; R_out = temp1;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0100000; end
            9'b001100011 : begin next_state = 5'b00100; data_out = 1'b0; R_in <= 8'b00000000;R_out = temp2;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0100000; end
            9'b001100100 : begin next_state = 5'b00101; data_out = 1'b0; R_in = temp1; R_out <= 8'b00000000; AddSub = 1'b0; a_in = 1'b0;   g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0100000; end
            //subtract
            9'b010000000 : begin next_state = 5'b00111; data_out = 1'b0; R_in <= 8'b00000000;R_out = temp1;  AddSub = 1'b1; a_in = 1'b1;   g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0010000; end
            9'b010000111 : begin next_state = 5'b01000; data_out = 1'b0; R_in <= 8'b00000000;R_out = temp2;  AddSub = 1'b1; a_in = 1'b1;   g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0010000; end
            9'b010001000 : begin next_state = 5'b01001; data_out = 1'b0; R_in = temp1; R_out <= 8'b00000000; AddSub = 1'b1; a_in = 1'b0;   g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0010000; end
            //xor
            9'b010100000 : begin next_state = 5'b01010; data_out = 1'b0; R_in <= 8'b00000000;R_out = temp1;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b0; g_out = 1'b0; math_enables = 7'b1000000; end
            9'b010101010 : begin next_state = 5'b01011; data_out = 1'b0; R_in <= 8'b00000000;R_out = temp2;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b1; g_out = 1'b0; math_enables = 7'b1000000; end
            9'b010101011 : begin next_state = 5'b01100; data_out = 1'b0; R_in = temp1 ;R_out = 8'b00000000; AddSub = 1'b0; a_in = 1'b0;  g_in = 1'b1; g_out = 1'b1; math_enables = 7'b1000000; end
            //or
            9'b011000000 : begin next_state = 5'b01101; data_out = 1'b0; R_in <= 8'b00000000; R_out = temp1; AddSub = 1'b0; a_in = 1'b1; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0000100; end
            9'b011001101 : begin next_state = 5'b01110; data_out = 1'b0; R_in <= 8'b00000000; R_out = temp2;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0000100; end
            9'b011001110 : begin next_state = 5'b01111; data_out = 1'b0; R_in = temp1; R_out = 8'b00000000; AddSub = 1'b0; a_in = 1'b0;  g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0000100; end
            //and
            9'b011100000 : begin next_state = 5'b10000; data_out = 1'b0; R_in <= 8'b00000000; R_out = temp1; AddSub = 1'b0; a_in = 1'b1; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0001000; end
            9'b011110000 : begin next_state = 5'b10001; data_out = 1'b0; R_in <= 8'b00000000 ;R_out = temp2;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0001000; end
            9'b011110001 : begin next_state = 5'b10010; data_out = 1'b0; R_in = temp1 ;R_out = 8'b00000000; AddSub = 1'b0; a_in = 1'b0;  g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0001000; end
            //divide
            9'b100000000 : begin next_state = 5'b10011; data_out = 1'b0; R_in <= 8'b00000000; R_out = temp1; AddSub = 1'b0; a_in = 1'b1; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0000010; end
            9'b100010011 : begin next_state = 5'b10100; data_out = 1'b0; R_in <= 8'b00000000 ;R_out = temp2;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0000010; end
            9'b100010100 : begin next_state = 5'b10101; data_out = 1'b0; R_in = temp1 ;R_out = 8'b00000000; AddSub = 1'b0; a_in = 1'b0;  g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0000010; end
            //modulo
            9'b100100000 : begin next_state = 5'b10110; data_out = 1'b0; R_in <= 8'b00000000; R_out = temp1; AddSub = 1'b0; a_in = 1'b1; g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0000001; end
            9'b100110110 : begin next_state = 5'b10111; data_out = 1'b0; R_in <= 8'b00000000 ;R_out = temp2;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b1; g_out = 1'b0; math_enables = 7'b0000001; end
            9'b100110111 : begin next_state = 5'b11000; data_out = 1'b0; R_in = temp1 ;R_out = 8'b00000000; AddSub = 1'b0; a_in = 1'b0;  g_in = 1'b1; g_out = 1'b1; math_enables = 7'b0000001; end
            default begin next_state = 5'b00000; data_out = 1'b0; R_in <= 8'b00000000;R_out <= 8'b00000000; AddSub = 1'b0; a_in = 1'b0;   g_in = 1'b0; g_out = 1'b0; math_enables = 7'b0000000; end
        endcase
    end
endmodule
        

