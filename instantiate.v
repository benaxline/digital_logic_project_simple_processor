module instantiate();



    state_machine cc(.current_state(current_state), .input1(in1), .input2(in2), .func(func), .clk(clk), .next_state(current_state), .data_out(data_out), .R_in(reg_in), .R_out(reg_out), .AddSub(AddSub), .Rh_in(a_in), .Rl_in(g_in), .Rl_out(g_out), .AS_enable(AS_enable), .XOR_enable(XOR_enable));
	tri_buf D(.a(in2), .enable(data_out), .b(bus));

	register R0(.x(bus), .clk(clk), .enable(reg_in[7]), .y(t1));
	register R1(.x(bus), .clk(clk), .enable(reg_in[6]), .y(t2));
	register R2(.x(bus), .clk(clk), .enable(reg_in[5]), .y(t3));
	register R3(.x(bus), .clk(clk), .enable(reg_in[4]), .y(t4));
	register R4(.x(bus), .clk(clk), .enable(reg_in[3]), .y(t5));
	register R5(.x(bus), .clk(clk), .enable(reg_in[2]), .y(t6));
	register R6(.x(bus), .clk(clk), .enable(reg_in[1]), .y(t7));
	register R7(.x(bus), .clk(clk), .enable(reg_in[0]), .y(t8));

	tri_buf T0(.a(t1), .enable(reg_out[7]), .b(bus));
 	tri_buf T1(.a(t2), .enable(reg_out[6]), .b(bus));
	tri_buf T2(.a(t3), .enable(reg_out[5]), .b(bus));
	tri_buf T3(.a(t4), .enable(reg_out[4]), .b(bus));
	tri_buf T4(.a(t5), .enable(reg_out[3]), .b(bus));
 	tri_buf T5(.a(t6), .enable(reg_out[2]), .b(bus));
	tri_buf T6(.a(t7), .enable(reg_out[1]), .b(bus));
	tri_buf T7(.a(t8), .enable(reg_out[0]), .b(bus));

	

	register A(.x(bus), .clk(clk), .enable(a_in), .y(a_out));
	xor_function my_xor(.a(a_out), .b(bus), .g(xor_out));
	adding addme(.a(a_out), .b(bus), .addsub(AddSub), .out(add_out));
	subbing subme(.a(a_out), .b(bus), .out(sub_out));
	mux mymux(.a(xor_out), .b(add_out), .c(sub_out), .out(g));
	register G(.x(g), .clk(clk), .enable(g_in), .y(temp1));
	tri_buf G_buf(.a(temp1), .enable(g_out), .b(bus));

endmodule
