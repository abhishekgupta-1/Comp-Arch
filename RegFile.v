module RegFile(clk,reset,ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2); 
input clk, reset, RegWrite;

input [1:0] ReadReg1, ReadReg2, WriteReg;

input [31:0] WriteData;
output[31:0] ReadData1, ReadData2;
wire[31:0] out1,out2,out3,out4;

wire clk1, clk2,clk3 , clk4;
wire [0:3] out_decoder;
decoder2_4 dec(out_decoder,WriteReg);
and(clk1, clk, out_decoder[0], RegWrite);
and(clk2, clk, out_decoder[1], RegWrite);
and(clk3, clk, out_decoder[2], RegWrite);
and(clk4, clk, out_decoder[3], RegWrite);
reg_32bit a(out1,WriteData,clk1,reset);
reg_32bit b(out2,WriteData,clk2,reset);
reg_32bit c(out3,WriteData,clk3,reset);
reg_32bit d(out4,WriteData,clk4,reset);
mux4_1 mux1(ReadData1,out1,out2,out3,out4,ReadReg1);
mux4_1 mux2(ReadData2,out1,out2,out3,out4,ReadReg2);
endmodule