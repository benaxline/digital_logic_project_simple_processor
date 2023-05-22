`timescale 1ns / 1ps
 
module and_TB;
 
	reg [2:0] in1, in2;
	wire [2:0] bus, t0, t1, t2, t3, t4, t5, t6, t7, t8, temp, a_out, temp1, alu_out,  xor_out, add_out, sub_out, g;
	wire [2:0] and_out, or_out, divide_out, mod_out;
	reg clk;
	reg [3:0] func;
	wire data_out, a_in, g_out, g_in,  AddSub, AS_enable, XOR_enable;
	reg [4:0] count;
	wire [3:0] reg_in, reg_out;
	wire [4:0] current_state;
	wire [6:0] math_out;

	

	my_fsm cc(.current_state(current_state), .input1(in1), .input2(in2), .func(func), .clk(clk), .next_state(current_state), .data_out(data_out), .R_in(reg_in), .R_out(reg_out), .AddSub(AddSub), .a_in(a_in), .g_in(g_in), .g_out(g_out), .math_enables(math_out));

	//registers
	tri_buf D(.a(in2), .enable(data_out), .b(bus));

	register R0(.x(bus), .clk(clk), .enable(reg_in[3]), .y(t0));
	register R1(.x(bus), .clk(clk), .enable(reg_in[2]), .y(t1));
	register R2(.x(bus), .clk(clk), .enable(reg_in[1]), .y(t2));
	register R3(.x(bus), .clk(clk), .enable(reg_in[0]), .y(t3));

	tri_buf T0(.a(t0), .enable(reg_out[3]), .b(bus));
	tri_buf T1(.a(t1), .enable(reg_out[2]), .b(bus));
	tri_buf T2(.a(t2), .enable(reg_out[1]), .b(bus));
	tri_buf T3(.a(t3), .enable(reg_out[0]), .b(bus));

	register A(.x(bus), .clk(clk), .enable(a_in), .y(a_out));

	xor_function my_xor(.a(a_out), .b(bus), .g(xor_out));
	tri_buf xortri(.a(xor_out), .enable(math_out[6]), .b(g));

	adding addme(.a(a_out), .b(bus), .addsub(AddSub), .out(add_out));
	tri_buf addtri(.a(add_out), .enable(math_out[5]), .b(g));

	subbing subme(.a(a_out), .b(bus), .out(sub_out));
	tri_buf subtri(.a(sub_out), .enable(math_out[4]), .b(g));

	and_function andme(.a(a_out), .b(bus), .g(and_out));
	tri_buf andtri(.a(and_out), .enable(math_out[3]), .b(g));

	or_function orme(.a(a_out), .b(bus), .g(or_out));
	tri_buf ortri(.a(or_out), .enable(math_out[2]), .b(g));

	// divide divme(.dividend(a_out), .divisor(bus), .quotient(divide_out), .remainder(mod_out));
	// tri_buf divtri(.a(divide_out), .enable(math_out[1]), .b(g));
	// tri_buf modtri(.a(mod_out), .enable(math_out[0]), .b(g));


	register G(.x(g), .clk(clk), .enable(g_in), .y(temp1));
	tri_buf g_buf(.a(temp1), .enable(g_out), .b(bus));
	
	initial begin 
		count = 5'b00000;
	end
	
	always begin
		#50
		count=count+5'b00001;
	end
	
	always @(count) begin
		case (count)
			5'b00000 : begin clk = 1; func = 4'b0001; in1 = 3'b000; in2 = 3'b011; end
			5'b00001 : begin clk = 0; end
			5'b00010 : begin clk = 1; func = 4'b0001; in1 = 3'b001; in2 = 3'b101; end
			5'b00011 : begin clk = 0; end
			5'b00100 : begin clk = 1; func = 4'b0001; in1 = 3'b010; in2 = 3'b100; end
			5'b00101 : begin clk = 0; end
			5'b00110 : begin clk = 1; func = 4'b0001; in1 = 3'b011; in2 = 3'b001; end
			5'b00111 : begin clk = 0; end
			5'b01000 : begin clk = 1; func = 4'b0010; in1 = 3'b001; in2 = 3'b011; end
			5'b01001 : begin clk = 0; end
			5'b01010 : begin clk = 1; func = 4'b0010; in1 = 3'b010; in2 = 3'b000; end
			5'b01011 : begin clk = 0; end
			5'b01100 : begin clk = 1; func = 4'b0111; in1 = 3'b000; in2 = 3'b001; end
			5'b01101 : begin clk = 0; end
			5'b01110 : begin clk = 1; func = 4'b0111; in1 = 3'b000; in2 = 3'b001; end
			5'b01111 : begin clk = 0; end
			5'b10000 : begin clk = 1; func = 4'b0111; in1 = 3'b000; in2 = 3'b001; end
			5'b10001 : begin clk = 0; end


		endcase
	end

	initial begin
		$dumpfile("and_TB.vcd");
		$dumpvars(0, and_TB);
		#1000
		$finish;
	end
 
endmodule
