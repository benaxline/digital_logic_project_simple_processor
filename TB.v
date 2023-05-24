module TB;
    reg clk;
    wire rst;

    inst instthis(.clk(clk), .rst(rst));

    initial begin
        clk = 0;
    end

    always begin 
        #20
        clk = ~clk;
        
    end


    initial begin
        $dumpfile("TB.vcd");
        $dumpvars(0, TB);
        #1000
        $finish;
    end

endmodule