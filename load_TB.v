`timescale 1ns / 1ps
 
module load_TB;
 
	
	wire [15:0] bus, t0, t1, t2, t3, t4, t5, t6, t7, t8, temp, a_out, temp1, alu_out,  xor_out, add_out, sub_out, g, data;
	wire [2:0] and_out, or_out, divide_out, mod_out;
	reg clk;
	reg [3:0] func;
	wire data_out, a_in, g_out, g_in,  AddSub, AS_enable, XOR_enable;
	reg [4:0] count;
	wire [7:0] bus1_buf_en, bus2_buf_en, reg_en;
	wire [4:0] current_state;
	wire [6:0] math_enables;
	wire [22:0] code;
	wire [4:0] address;
	wire [4:0] ad;

	RAM_ROM rom(.address(ad), .code(code));

	new_fsm cc(.code(code), .clk(clk), .current_state(current_state), .next_state(current_state), .address(address), .data_out(data_out), .bus1_buf_en(bus1_buf_en), .bus2_buf_en(bus2_buf_en), .g_in(g_in), .g_out(g_out), .reg_en(reg_en), .math_enables(math_enables), .d(data));
	// my_fsm cc(.current_state(current_state), .input1(in1), .input2(in2), .func(func), .clk(clk), .next_state(current_state), .data_out(data_out), .R_in(reg_in), .R_out(reg_out), .AddSub(AddSub), .a_in(a_in), .g_in(g_in), .g_out(g_out), .math_enables(math_out));

	address ads(.ad_in(address), .clk(clk), .ad_out(ad));


	//registers
	tri_buf D(.a(data), .enable(data_out), .b(bus));

	register R0(.x(bus), .clk(clk), .enable(reg_en[7]), .y(t0));
	register R1(.x(bus), .clk(clk), .enable(reg_en[6]), .y(t1));
	register R2(.x(bus), .clk(clk), .enable(reg_en[5]), .y(t2));
	register R3(.x(bus), .clk(clk), .enable(reg_en[4]), .y(t3));
	register R4(.x(bus), .clk(clk), .enable(reg_en[3]), .y(t4));
	register R5(.x(bus), .clk(clk), .enable(reg_en[2]), .y(t5));
	register R6(.x(bus), .clk(clk), .enable(reg_en[1]), .y(t6));
	register R7(.x(bus), .clk(clk), .enable(reg_en[0]), .y(t7));


	tri_buf T0(.a(t0), .enable(bus2_buf_en[7]), .b(bus));
	tri_buf T1(.a(t1), .enable(bus2_buf_en[6]), .b(bus));
	tri_buf T2(.a(t2), .enable(bus2_buf_en[5]), .b(bus));
	tri_buf T3(.a(t3), .enable(bus2_buf_en[4]), .b(bus));
	tri_buf T4(.a(t4), .enable(bus2_buf_en[3]), .b(bus));
	tri_buf T5(.a(t5), .enable(bus2_buf_en[2]), .b(bus));
	tri_buf T6(.a(t6), .enable(bus2_buf_en[1]), .b(bus));
	tri_buf T7(.a(t7), .enable(bus2_buf_en[0]), .b(bus));

	register A(.x(bus), .clk(clk), .enable(a_in), .y(a_out));

	my_alu alu( .p(a_out), .q(bus), .math_out(math_enables), .g(g));
	

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
			5'b00000 : begin clk = 1; end
			5'b00001 : begin clk = 0; end
			5'b00010 : begin clk = 1; end
			5'b00011 : begin clk = 0; end
			5'b00100 : begin clk = 1; end
			5'b00101 : begin clk = 0; end
			5'b00110 : begin clk = 1; end
			5'b00111 : begin clk = 0; end
			5'b01000 : begin clk = 1; end
			5'b01001 : begin clk = 0; end
			5'b01010 : begin clk = 1; end
			5'b01011 : begin clk = 0; end
			5'b01100 : begin clk = 1; end
			5'b01101 : begin clk = 0; end
			5'b01110 : begin clk = 1; end
			5'b01111 : begin clk = 0; end
			5'b10000 : begin clk = 1; end
			5'b10001 : begin clk = 0; end


		endcase
	end

	initial begin
		$dumpfile("load_TB.vcd");
		$dumpvars(0, load_TB);
		#1000
		$finish;
	end
 
endmodule
