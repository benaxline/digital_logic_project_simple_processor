module my_fsm (input1, input2, current_state, func, clk, next_state, data_out, R_in, R_out, AddSub, a_in, g_in, g_out, sel,  math_enables);
    input clk;
    input [2:0] input1, input2;
    input [3:0] func;
    input [4:0] current_state; 
    output reg [4:0] next_state;
    output reg data_out, AddSub,a_in, g_in, g_out;
    output reg [3:0] R_out, R_in;
    output reg [1:0] sel;
    wire [3:0] temp1, temp2;
    wire [8:0] temp;
    output reg [2:0] math_enables; // [add, sub, xor]

    
    assign temp = {func, current_state};

    reg_decoder in1(.reg_num(input1), .clk(clk), .reg_enable(temp1));
    reg_decoder in2(.reg_num(input2), .clk(clk), .reg_enable(temp2));

 


    always @ (clk) begin
        case(temp)
            9'b000100000 : begin next_state = 5'b00001; data_out = 1'b1; R_in = temp1; R_out <= 4'b0000; AddSub = 1'b0; a_in = 1'b0;   g_in = 1'b0; g_out = 1'b0; end
            9'b001000000 : begin next_state = 5'b00010; data_out = 1'b0; R_in = temp1; R_out = temp2;  AddSub = 1'b0; a_in = 1'b0;   g_in = 1'b0; g_out = 1'b0; end
            9'b001100000 : begin next_state = 5'b00011; data_out = 1'b0; R_in <= 4'b0000;R_out = temp1;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b0; g_out = 1'b0; sel = 2'b00; math_enables = 3'b100; end
            9'b001100011 : begin next_state = 5'b00100; data_out = 1'b0; R_in <= 4'b0000;R_out = temp2;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b1; g_out = 1'b0; sel = 2'b00; math_enables = 3'b100; end
            9'b001100100 : begin next_state = 5'b00101; data_out = 1'b0; R_in = temp1; R_out <= 4'b0000; AddSub = 1'b0; a_in = 1'b0;   g_in = 1'b1; g_out = 1'b1; sel = 2'b00; math_enables = 3'b100; end
            9'b010000000 : begin next_state = 5'b00111; data_out = 1'b0; R_in <= 4'b0000;R_out = temp1;  AddSub = 1'b1; a_in = 1'b1;   g_in = 1'b0; g_out = 1'b0; sel = 2'b01; math_enables = 3'b010; end
            9'b010000111 : begin next_state = 5'b01000; data_out = 1'b0; R_in <= 4'b0000;R_out = temp2;  AddSub = 1'b1; a_in = 1'b1;   g_in = 1'b1; g_out = 1'b0; sel = 2'b01; math_enables = 3'b010; end
            9'b010001000 : begin next_state = 5'b01001; data_out = 1'b0; R_in = temp1; R_out <= 4'b0000; AddSub = 1'b1; a_in = 1'b0;   g_in = 1'b1; g_out = 1'b1; sel = 2'b01; math_enables = 3'b010; end
            9'b010100000 : begin next_state = 5'b01010; data_out = 1'b0; R_in <= 4'b0000;R_out = temp1;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b0; g_out = 1'b0; sel = 2'b10; math_enables = 3'b001; end
            9'b010101010 : begin next_state = 5'b01011; data_out = 1'b0; R_in <= 4'b0000;R_out = temp2;  AddSub = 1'b0; a_in = 1'b1;   g_in = 1'b1; g_out = 1'b0; sel = 2'b10; math_enables = 3'b001; end
            9'b010101011 : begin next_state = 5'b01100; data_out = 1'b0; R_in <= 4'b0000;R_out = 4'b0000; AddSub = 1'b0; a_in = 1'b0;  g_in = 1'b1; g_out = 1'b1; sel = 2'b10; math_enables = 3'b001; end
            
            default begin next_state = 5'b00000; data_out = 1'b0; R_in <= 4'b0000;R_out <= 4'b0000; AddSub = 1'b0; a_in = 1'b0;   g_in = 1'b0; g_out = 1'b0; math_enables = 3'b000; end
        endcase
    end
endmodule
        

