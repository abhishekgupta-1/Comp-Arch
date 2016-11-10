module tb_RegFile32;

reg clk, reset, RegWrite;
reg[31:0] WriteData;
wire[31:0] ReadData1, ReadData2;
reg[4:0] ReadReg1, ReadReg2, WriteReg;

RegFile32 regfile1(clk,reset,ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2); 

initial
begin
clk = 0;
reset = 0;
RegWrite = 0;
#20
reset = 1;
WriteData = 32'HAAAAFFFF;
ReadReg1 = 5'b00000;
ReadReg2 = 5'b01000;
#20 
WriteReg = 5'b10000;
RegWrite = 1;
#20
WriteReg = 5'b00000;
ReadReg1 = 5'b10000;
#20
RegWrite = 0;
ReadReg2 = 5'b00000;
#20
$stop;
end

always #5 clk=~clk;

endmodule