module RegFile32(clk,reset,ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2); 

input clk, reset, RegWrite;
input[31:0] WriteData;
output[31:0] ReadData1, ReadData2;
input[4:0] ReadReg1, ReadReg2, WriteReg;
reg[1023:0] registers;

always @ (posedge clk)
begin
if (RegWrite)
registers[WriteReg*32 +: 32] <= WriteData;
end

always @ (reset)
begin
if (!reset)
registers = 1024'b00;
end


assign ReadData1 = registers[ReadReg1*32 +: 32];
assign ReadData2 = registers[ReadReg2*32 +: 32];

integer i;
   initial
   begin
      for(i=0;i<32;i=i+1)
      begin:init //100110-10100-11101-11011-11011-101101
         registers[32*i +:32] =32'hFFFFFFFF;
      end
   end

endmodule