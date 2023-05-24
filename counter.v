module counter(clk,address,rst); 
    input clk; 
    input rst;
    output reg [4:0] address; 
    reg [2:0] clocks;

    initial begin 
        address = 5'b0000; 
        clocks = 3'b000;
    end

    always @(posedge clk) begin 
        if (rst == 1'b0) begin
            clocks = 3'b000;
            address = 5'b0000; 
        end else
            clocks = clocks +3'b001 ;
    end

    always @ (clocks) begin 
        if (address == 5'b0011 || address == 5'b0010 || address == 5'b0001 ) begin 
            if (clocks == 3'b010) begin 
                address = address + 5'b0001; 
                clocks = 3'b0; 
            end 
        end
        else 
        if (clocks == 3'b011) begin 
            address = address + 5'b0001; 
            clocks = 3'b0; 
        end 
    end

endmodule