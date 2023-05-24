module inst(clk, rst);
    input clk;
    input rst;

    wire [15:0] bus1, bus3, t0, t1, t2, t3, t4, t5, t6, t7, t8, temp, a_out, temp1, alu_out,  xor_out, add_out, sub_out, g, data;
	wire [2:0] and_out, or_out, divide_out, mod_out;
	wire clk, rst;
	wire [3:0] func, s0, s1, s2, s3;
	wire data_out, a_in, g_out, g_in,  AddSub, AS_enable, XOR_enable;
	wire [7:0] bus1_buf_en, bus2_buf_en, bus3_buf_en, reg_en;
	wire [4:0] current_state;
	wire [6:0] math_enables;
	wire [22:0] code;
	wire [4:0] address;
	wire [4:0] ad;

	wire [2:0] switch_choice;
	wire [6:0] hex0, hex1, hex2, hex3;

	RAM_ROM rom(.address(address), .code(code), .sw(switch_choice));

    counter count(.clk(clk), .address(address), .rst(rst));

	new_fsm cc(.code(code), .clk(clk), .current_state(current_state), .next_state(current_state), .data_out(data_out), .bus1_buf_en(bus1_buf_en), .bus2_buf_en(bus2_buf_en), .g_in(g_in), .g_out(g_out), .reg_en(reg_en), .math_enables(math_enables), .d(data));
	// my_fsm cc(.current_state(current_state), .input1(in1), .input2(in2), .func(func), .clk(clk), .next_state(current_state), .data_out(data_out), .R_in(reg_in), .R_out(reg_out), .AddSub(AddSub), .a_in(a_in), .g_in(g_in), .g_out(g_out), .math_enables(math_out));

	reg_decoder buf3(.reg_num(switch_choice), .clk(clk), .reg_enable(bus3_buf_en));

	//registers
	tri_buf D(.a(data), .enable(data_out), .b(bus1));

	register R0(.x(bus1), .clk(clk), .enable(reg_en[7]), .y(t0));
	register R1(.x(bus1), .clk(clk), .enable(reg_en[6]), .y(t1));
	register R2(.x(bus1), .clk(clk), .enable(reg_en[5]), .y(t2));
	register R3(.x(bus1), .clk(clk), .enable(reg_en[4]), .y(t3));
	register R4(.x(bus1), .clk(clk), .enable(reg_en[3]), .y(t4));
	register R5(.x(bus1), .clk(clk), .enable(reg_en[2]), .y(t5));
	register R6(.x(bus1), .clk(clk), .enable(reg_en[1]), .y(t6));
	register R7(.x(bus1), .clk(clk), .enable(reg_en[0]), .y(t7));


	tri_buf T0(.a(t0), .enable(bus2_buf_en[7]), .b(bus1));
	tri_buf T1(.a(t1), .enable(bus2_buf_en[6]), .b(bus1));
	tri_buf T2(.a(t2), .enable(bus2_buf_en[5]), .b(bus1));
	tri_buf T3(.a(t3), .enable(bus2_buf_en[4]), .b(bus1));
	tri_buf T4(.a(t4), .enable(bus2_buf_en[3]), .b(bus1));
	tri_buf T5(.a(t5), .enable(bus2_buf_en[2]), .b(bus1));
	tri_buf T6(.a(t6), .enable(bus2_buf_en[1]), .b(bus1));
	tri_buf T7(.a(t7), .enable(bus2_buf_en[0]), .b(bus1));

	tri_buf B3T0(.a(t0), .enable(bus3_buf_en[7]), .b(bus3));
	tri_buf B3T1(.a(t1), .enable(bus3_buf_en[6]), .b(bus3));
	tri_buf B3T2(.a(t2), .enable(bus3_buf_en[5]), .b(bus3));
	tri_buf B3T3(.a(t3), .enable(bus3_buf_en[4]), .b(bus3));
	tri_buf B3T4(.a(t4), .enable(bus3_buf_en[3]), .b(bus3));
	tri_buf B3T5(.a(t5), .enable(bus3_buf_en[2]), .b(bus3));
	tri_buf B3T6(.a(t6), .enable(bus3_buf_en[1]), .b(bus3));
	tri_buf B3T7(.a(t7), .enable(bus3_buf_en[0]), .b(bus3));

	register A(.x(bus1), .clk(clk), .enable(a_in), .y(a_out));

	my_alu alu( .p(a_out), .q(bus1), .math_out(math_enables), .g(g));
	

	register G(.x(g), .clk(clk), .enable(g_in), .y(temp1));
	tri_buf g_buf(.a(temp1), .enable(g_out), .b(bus1));

	assign s3 = {bus3[15], bus3[14], bus3[13], bus3[12]};
	assign s2 = {bus3[11], bus3[10], bus3[9], bus3[8]};
	assign s1 = {bus3[7], bus3[6], bus3[5], bus3[4]};
	assign s0 = {bus3[3], bus3[2], bus3[1], bus3[0]};

	hex_to_7seg h3(.hex(s3), .sevenseg(hex3));
	hex_to_7seg h2(.hex(s2), .sevenseg(hex2));
	hex_to_7seg h1(.hex(s1), .sevenseg(hex1));
	hex_to_7seg h0(.hex(s0), .sevenseg(hex0));

	



endmodule