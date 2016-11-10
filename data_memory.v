
module data_memory(clk,Address,WriteData,MemWrite,ReadData); 
input clk, MemWrite;
input[31:0] WriteData;
output[31:0] ReadData;
input[4:0] Address;
reg[1023:0] registers;

always @ (posedge clk)
begin
if (MemWrite)
registers[Address*32 +: 32] <= WriteData;
end

assign ReadData = registers[Address*32 +: 32];

endmodule