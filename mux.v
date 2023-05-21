module mux(a, b, c,d,  sel, out);
    input [2:0] a, b, c,d;
    input [1:0] sel;
    output [2:0] out;

    //always @* begin
        case(sel)
            2'b00 : begin out <= a; end
            2'b01 : begin out <= b; end
            2'b10 : begin out <= c; end
            default: begin out <= 3'bzzz; end
        endcase
    //end
    //assign out = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a);

endmodule