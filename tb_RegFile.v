module tb_RegFile;

reg clk, reset, RegWrite;
reg[31:0] WriteData;
wire[31:0] ReadData1, ReadData2;
reg[1:0] ReadReg1, ReadReg2, WriteReg;

RegFile regfile1(clk,reset,ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2); 

initial
begin
clk = 0;
reset = 0;
RegWrite = 0;
#20
reset = 1;
WriteData = 32'HAAAAFFFF;
ReadReg1 = 2'b00;
ReadReg2 = 2'b01;
#20 
WriteReg = 2'b10;
RegWrite = 1;
#20
RegWrite = 0;
ReadReg1 = 2'b10;
#20
$stop;
end

always #5 clk=~clk;

endmodule