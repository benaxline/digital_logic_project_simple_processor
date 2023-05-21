module state_machine (input1, input2, current_state, func, clk, next_state, data_out, R_in, R_out, AddSub, Rh_in, Rl_in, Rl_out, AS_enable, XOR_enable, sel);
    input clk;
    input [2:0] input1, input2;
    input [3:0] func;
    input [4:0] current_state; 
    output reg [4:0] next_state;
    output reg data_out, AddSub, Rh_in, Rl_in, Rl_out, AS_enable, XOR_enable;
    output reg [3:0] R_out, R_in;
    output reg [1:0] sel;
    wire [3:0] temp1, temp2;
    wire [8:0] temp;

    
    assign temp = {func, current_state};

    reg_decoder in1(.reg_num(input1), .clk(clk), .reg_enable(temp1));
    reg_decoder in2(.reg_num(input2), .clk(clk), .reg_enable(temp2));

    


    always @ (clk) begin
        case(temp)
            9'b000100000 : begin next_state = 5'b00001; data_out = 1'b1; R_in = temp1; R_out = 4'b0000; AddSub = 1'b0; Rh_in = 1'b0;   Rl_in = 1'b0; Rl_out = 1'b0; AS_enable = 1'b0; XOR_enable = 1'b0; end
            9'b001000000 : begin next_state = 5'b00010; data_out = 1'b0; R_in = temp1; R_out = temp2;  AddSub = 1'b0; Rh_in = 1'b0;   Rl_in = 1'b0; Rl_out = 1'b0; AS_enable = 1'b0; XOR_enable = 1'b0; end
            9'b001100000 : begin next_state = 5'b00011; data_out = 1'b0; R_in = 4'b0000;R_out = temp1;  AddSub = 1'b0; Rh_in = 1'b1;   Rl_in = 1'b0; Rl_out = 1'b0; AS_enable = 1'b1; XOR_enable = 1'b0; sel = 2'b00; end
            9'b001100011 : begin next_state = 5'b00100; data_out = 1'b0; R_in = 4'b0000;R_out = temp2;  AddSub = 1'b0; Rh_in = 1'b0;   Rl_in = 1'b1; Rl_out = 1'b0; AS_enable = 1'b1; XOR_enable = 1'b0; sel = 2'b00; end
            9'b001100100 : begin next_state = 5'b00101; data_out = 1'b0; R_in = temp1; R_out = 4'b0000; AddSub = 1'b0; Rh_in = 1'b0;   Rl_in = 1'b0; Rl_out = 1'b1; AS_enable = 1'b1; XOR_enable = 1'b0; sel = 2'b00; end
            9'b010000000 : begin next_state = 5'b00111; data_out = 1'b0; R_in = 4'b0000;R_out = temp1;  AddSub = 1'b1; Rh_in = 1'b1;   Rl_in = 1'b0; Rl_out = 1'b0; AS_enable = 1'b1; XOR_enable = 1'b0; sel = 2'b01; end
            9'b010000111 : begin next_state = 5'b01000; data_out = 1'b0; R_in = 4'b0000;R_out = temp2;  AddSub = 1'b1; Rh_in = 1'b0;   Rl_in = 1'b1; Rl_out = 1'b0; AS_enable = 1'b1; XOR_enable = 1'b0; sel = 2'b01; end
            9'b010001000 : begin next_state = 5'b01001; data_out = 1'b0; R_in = temp1; R_out = 4'b0000; AddSub = 1'b1; Rh_in = 1'b0;   Rl_in = 1'b0; Rl_out = 1'b1; AS_enable = 1'b1; XOR_enable = 1'b0; sel = 2'b01; end
            9'b010100000 : begin next_state = 5'b01010; data_out = 1'b0; R_in = 4'b0000;R_out = temp1;  AddSub = 1'b0; Rh_in = 1'b1;   Rl_in = 1'b0; Rl_out = 1'b0; AS_enable = 1'b0; XOR_enable = 1'b1; sel = 2'b10; end
            9'b010101010 : begin next_state = 5'b01011; data_out = 1'b0; R_in = 4'b0000;R_out = temp2;  AddSub = 1'b0; Rh_in = 1'b0;   Rl_in = 1'b1; Rl_out = 1'b0; AS_enable = 1'b0; XOR_enable = 1'b1; sel = 2'b10; end
            9'b010101011 : begin next_state = 5'b01100; data_out = 1'b0; R_in = 4'b0000;R_out = 4'b0000; AddSub = 1'b0; Rh_in = 1'b0;   Rl_in = 1'b0; Rl_out = 1'b1; AS_enable = 1'b0; XOR_enable = 1'b1; sel = 2'b10; end
            
            default begin next_state = 5'b00000; data_out = 1'b0; R_in <= 4'b0000;R_out <= 4'b0000; AddSub = 1'b0; Rh_in = 1'b0;   Rl_in = 1'b0; Rl_out = 1'b0; AS_enable = 1'b0; XOR_enable = 1'b0; end
        endcase
    end
endmodule
        

