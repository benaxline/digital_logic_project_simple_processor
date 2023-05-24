module address(ad_in, clk, ad_out);
    input [4:0] ad_in;
    input clk;
    output reg [4:0] ad_out;

    always @(clk) begin 
        if (ad_in == 5'b00000)
            ad_out = ad_in + 5'b00001;
        else
            ad_out = 5'b00000;
    end

endmodule