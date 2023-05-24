module counter(clk,address,rst, func); 
    input clk; 
    input rst;
    input [3:0] func;
    output reg [4:0] address; 
    reg [2:0] clocks;

    initial begin 
        address = 5'b0000; 
        clocks = 3'b000;
    end

    always @(negedge clk or clocks) begin 

        if (func >= 4'b0010) begin
            if (clocks == 3'b100) begin
                clocks = 3'b000;
                address = address + 1;
            end else
                clocks = clocks + 1;
        end else 
                address = address + 1;



        // if (rst == 1'b0) begin
        //     clocks = 3'b000;
        //     address = 5'b00000; 
        // end 

        // if (address == 5'b0011 || address == 5'b0010 || address == 5'b0001 ) begin 
        //     if (clocks == 3'b010) begin 
        //         address = address + 5'b0001; 
        //         clocks = 3'b0; 
        //     end 
        // end
        // else 
        // if (clocks == 3'b011) begin 
        //     address = address + 5'b0001; 
        //     clocks = 3'b0; 
        // end else
        //     clocks = clocks +3'b001 ;
    end

    // always @ (clocks) begin 
    //     if (address == 5'b0011 || address == 5'b0010 || address == 5'b0001 ) begin 
    //         if (clocks == 3'b010) begin 
    //             address = address + 5'b0001; 
    //             clocks = 3'b0; 
    //         end 
    //     end
    //     else 
    //     if (clocks == 3'b011) begin 
    //         address = address + 5'b0001; 
    //         clocks = 3'b0; 
    //     end 
    // end

endmodule