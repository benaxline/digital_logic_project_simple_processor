`timescale 1ns / 1ps
 
module test_TB;

	reg [2:0] in1, in2;
	wire [2:0] bus, t1, t2, t3, t4, t5, t6, t7, t8, temp, a_out, temp1, alu_out,  xor_out, add_out, sub_out, g;
	reg clk;
	reg [3:0] func;
	wire data_out, a_in, g_out, g_in,  AddSub, AS_enable, XOR_enable;
	reg [4:0] count;
	wire [3:0] reg_in, reg_out;
	wire [4:0] current_state;




	state_machine cc(.current_state(current_state), .input1(in1), .input2(in2), .func(func), .clk(clk), .next_state(current_state), .data_out(data_out), .R_in(reg_in), .R_out(reg_out), .AddSub(AddSub), .Rh_in(a_in), .Rl_in(g_in), .Rl_out(g_out), .AS_enable(AS_enable), .XOR_enable(XOR_enable));
	// my_fsm f1(.func(func), .clk(clk), .reg_enable(reg_enable), .buf_enable(buf_enable), .input1(a), .input2(b), .en_D(en_D), .g_buf_en(gbuf_en), .en_A(en_A), .g_en(G_en));
	tri_buf D(.a(in2), .enable(data_out), .b(bus));

	// register R0(.x(bus), .clk(clk), .enable(reg_in[7]), .y(t1));
	// register R1(.x(bus), .clk(clk), .enable(reg_in[6]), .y(t2));
	// register R2(.x(bus), .clk(clk), .enable(reg_in[5]), .y(t3));
	// register R3(.x(bus), .clk(clk), .enable(reg_in[4]), .y(t4));
	register R4(.x(bus), .clk(clk), .enable(reg_in[3]), .y(t5));
	register R5(.x(bus), .clk(clk), .enable(reg_in[2]), .y(t6));
	register R6(.x(bus), .clk(clk), .enable(reg_in[1]), .y(t7));
	register R7(.x(bus), .clk(clk), .enable(reg_in[0]), .y(t8));

	// tri_buf T0(.a(t1), .enable(reg_out[7]), .b(bus));
 	// tri_buf T1(.a(t2), .enable(reg_out[6]), .b(bus));
	// tri_buf T2(.a(t3), .enable(reg_out[5]), .b(bus));
	// tri_buf T3(.a(t4), .enable(reg_out[4]), .b(bus));
	tri_buf T4(.a(t5), .enable(reg_out[3]), .b(bus));
 	tri_buf T5(.a(t6), .enable(reg_out[2]), .b(bus));
	tri_buf T6(.a(t7), .enable(reg_out[1]), .b(bus));
	tri_buf T7(.a(t8), .enable(reg_out[0]), .b(bus));

	register A(.x(bus), .clk(clk), .enable(a_in), .y(a_out));
	// xor_function my_xor(.a(a_out), .b(bus), .g(xor_out));
	// adding addme(.a(a_out), .b(bus), .addsub(AddSub), .out(add_out));
	// subbing subme(.a(a_out), .b(bus), .out(sub_out));
	// mux mymux(.a(xor_out), .b(add_out), .c(sub_out), .out(g));
	// register G(.x(g), .clk(clk), .enable(g_in), .y(temp1));
	// tri_buf G_buf(.a(temp1), .enable(g_out), .b(bus));

	// register A(.x(bus), .clk(clk), .enable(a_in), .y(a_out));
	// my_alu ALU(.p(a_out), .q(bus), .addsub(AddSub), .XOR_enable(XOR_enable), .r(alu_out));
	// register G(.x(alu_out), .clk(clk), .enable(g_in), .y(temp1));
	// tri_buf G_buf(.a(temp1), .enable(g_out), .b(bus));

	




	initial begin 
		count = 5'b00000;
	end
	
	always begin
		#50
		count=count+5'b00001;
	end

	
	
	always @(*) begin
		case (count)
		5'b00000 : begin func = 4'b0001; in1 = 3'b000; in2 = 3'b011;  clk = 1;     end
		5'b00001 : begin func = 4'b0001; in1 = 3'b000; in2 = 3'b011;  clk = 0;    end
		5'b00010 : begin func = 4'b0001; in1 = 3'b000; in2 = 3'b011;  clk = 1;     end
        5'b00011 : begin func = 4'b0001; in1 = 3'b001; in2 = 3'b101;  clk = 1;     end

        5'b00100 : begin func = 4'b0001;  in1 = 3'b001; in2 = 3'b101;  clk = 0;     end
		5'b00101 : begin func = 4'b0001;  in1 = 3'b001; in2 = 3'b101;  clk = 1;    end
		5'b00110 : begin func = 4'b0001;  in1 = 3'b010; in2 = 3'b110;  clk = 1;     end
        5'b00111 : begin func = 4'b0001;  in1 = 3'b010; in2 = 3'b110;  clk = 0;     end

		5'b01000 : begin func = 4'b0001;  in1 = 3'b010; in2 = 3'b110;  clk = 1;     end
		5'b01001 : begin func = 4'b0001;  in1 = 3'b011; in2 = 3'b001;  clk = 1;    end
		5'b01010 : begin func = 4'b0001;  in1 = 3'b011; in2 = 3'b001;  clk = 0;     end
        5'b01011 : begin func = 4'b0001;  in1 = 3'b011; in2 = 3'b001;  clk = 1;     end

		5'b01100 : begin func = 4'b0001;  in1 = 3'b100; in2 = 3'b000;  clk = 1;     end
		5'b01101 : begin func = 4'b0001;  in1 = 3'b100; in2 = 3'b000;  clk = 0;    end
		5'b01110 : begin func = 4'b0001;  in1 = 3'b100; in2 = 3'b000;  clk = 1;     end
        5'b01111 : begin func = 4'b0001;  in1 = 3'b101; in2 = 3'b001;  clk = 1;     end


		default : func = 4'b0000;
        

	endcase
end

	initial begin
		$dumpfile("test_TB.vcd");
		$dumpvars(0, test_TB);
		#1000
		$finish;
	end
 
endmodule
