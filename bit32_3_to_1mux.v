module bit32_3to1_mux(out,sel,in1,in2,in3);
    input [31:0] in1, in2, in3;
    output [31:0] out;
    input [1:0] sel;
    wire[31:0] out1;
    bit32_2to1mux mux1(out1,sel[0],in1,in2);
    bit32_2to1mux mux2(out,sel[1],out1,in3);
endmodule