module tb_bit32_3to1_mux;
    reg[31:0] in1,in2,in3;
    wire[31:0] out;
    reg[1:0] sel;
    bit32_3to1_mux mux2(out,sel,in1,in2,in3);
    initial
    begin
        in1 = 32'b00000000000000000000000000000000;
        in2 = 32'b11111111111111111111111111111111;
        in3 = 32'b10101010101010101010101010101010;
        sel = 2'b11;
        #100
        sel = 2'b00;
        #100
        sel = 2'b01;
        #100
        sel = 2'b00;
    end
endmodule