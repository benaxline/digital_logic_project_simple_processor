module tri_buf(a, b, enable);
    input [2:0] a; //bits based on in and out
    input enable;
    output reg [2:0] b;

    always @(enable or a) begin
        if  (enable) begin
            b = a;
        end else begin
            b = 3'bzzz;
        end
    end

endmodule