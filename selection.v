module selection(sel);
    input [2:0] sel; 
    

    if (sel == 3'b001) begin 
        //run load Rx, D
        //load myload()
    end else if (sel = 3'b010) begin
        //run mov Rx, Ry
        //mov mymov()
    end else if (sel = 3'b011) begin
        //run add Rx, Ry
        //add myadd()
    end else begin
        //run xor Rx, Ry
        //xor myxor()
    end

endmodule