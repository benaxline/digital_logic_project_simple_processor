module RAM_ROM(address, code);
    input [4:0] address;
    output reg [22:0] code;

    always @(address) begin
        case (address)
            5'h00 : begin code <= {4'b0001, 3'b000, 16'h000C}; end // LOAD R0 12
            5'h01 : begin code <= {4'b0001, 3'b001, 16'h0009}; end // LOAD R1 9
            5'h02 : begin code <= {4'b0001, 3'b010, 16'h0003}; end // LOAD R2 3
            5'h03 : begin code <= {4'b0001, 3'b011, 16'h0014}; end // LOAD R3 20
            5'h04 : begin code <= {4'b0001, 3'b100, 16'h000D}; end // LOAD R4 13
            5'h05 : begin code <= {4'b0001, 3'b101, 16'h0015}; end // LOAD R5 21
            5'h06 : begin code <= {4'b0001, 3'b110, 16'h0019}; end // LOAD R6 25
            5'h07 : begin code <= {4'b0001, 3'b111, 16'h001E}; end // LOAD R7 30

            5'h08 : begin code <= {4'b0010, 3'b000, 3'b100, 13'h000}; end // MOV R0 R4
            5'h09 : begin code <= {4'b0010, 3'b101, 3'b111, 13'h000}; end // MOV R5 R7
            5'h0A : begin code <= {4'b0010, 3'b010, 3'b001, 13'h000}; end // MOV R2 R1

            5'h0B : begin code <= {4'b0011, 3'b011, 3'b000, 13'h000}; end // ADD R3 R0

            default: begin code <= {4'b0000, 18'h0000}; end



        endcase
    end
endmodule