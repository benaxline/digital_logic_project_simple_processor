`timescale 1ns / 1ps
 
module proj_TB;
    //inputs
	reg [3:0] count, Rx, Ry, D; 
    reg [2:0] sel;
    wire clk, rst; 
	wire [15:0] bus;


    //outputs
	wire [3:0] saved_output;

    //registers
	register myreg1 (.D(D), .clk(clk), .rst(rst), .Q(saved_output));
 	register myreg2 (.D(D), .clk(clk), .rst(rst), .Q(saved_output));
    register myreg3 (.D(D), .clk(clk), .rst(rst), .Q(saved_output));
    register myreg4 (.D(D), .clk(clk), .rst(rst), .Q(saved_output));
    
	register A(.x(bus), .enable(A_in), .y(Awire), .clk(clk));
	ALU my_alu(.p(Awire), .q(Bus), .addsub(addsub), .r(ALU_out));
	register G(.x(ALU_out), .enable(G_in), .r(G_out));
	tri_buf G_Buf(.a(G_out), .enable(enable), .b(Bus));



	// tri_buf buf1(.a(), .enable(), .b());
	// my_alu alu1(.p(), .q(), .addsub(), .r());
	// my_fsm fsm(.command(), .a_in(), .g_in(), .g_out(), .addsub());


    

	initial begin 
		count = 4'b0000;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	
	always @(count) begin
		case (count)
		4'b0000 : begin D = 4'b0000; clk = 0; rst = 0; end
		4'b0001 : begin D = 4'b0000; clk = 0; rst = 1; end
		4'b0010 : begin D = 4'b0000; clk = 1; rst = 0; end
        4'b0011 : begin D = 4'b0000; clk = 1; rst = 1; end

        4'b0100 : begin D = 4'b0001; clk = 0; rst = 0; end
		4'b0101 : begin D = 4'b0001; clk = 0; rst = 1; end
		4'b0110 : begin D = 4'b0001; clk = 1; rst = 0; end
        4'b0111 : begin D = 4'b0001; clk = 1; rst = 1; end

        4'b1000 : begin D = 4'b0010; clk = 0; rst = 0; end
		4'b1001 : begin D = 4'b0010; clk = 0; rst = 1; end
		4'b1010 : begin D = 4'b0010; clk = 1; rst = 0; end
        4'b1011 : begin D = 4'b0010; clk = 1; rst = 1; end

        4'b1100 : begin D = 4'b0011; clk = 0; rst = 0; end
		4'b1101 : begin D = 4'b0011; clk = 0; rst = 1; end
		4'b1110 : begin D = 4'b0011; clk = 1; rst = 0; end
        4'b1111 : begin D = 4'b0011; clk = 1; rst = 1; end


		default : begin D = 4'b1111; clk = 1; rst = 0; end
	endcase
	end

	initial begin
		$dumpfile("proj_TB.vcd");
		$dumpvars(0, proj_TB);
		#1000
		$finish;
	end
 
endmodule
