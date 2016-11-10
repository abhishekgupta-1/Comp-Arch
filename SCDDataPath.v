module SCDDataPath(ALUout, pcread, reset, clk);
output[31:0] ALUout;
input clk, reset;
reg[4:0] pcwrite;
input[4:0] pcread;
wire[31:0] ReadMemData,in1,in2,aluresult,signextended,instruction, ReadData1, ReadData2, WriteData;
wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp2;
wire o0, o1, o2, carryout;
wire[4:0] WriteReg;
//pc register
//reg_5bit pc(pcread, pcwrite, clk, reset);
//instruction memory
instructon_memory instru_mem(instruction, pcread);
//Generating signals
ANDarray control_unit(RegDst,ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp0,ALUOp1,instruction[31:26]);
//Register File
assign WriteReg = (RegDst==1)? instruction[15:11] : instruction[20:16];
RegFile32 register_file(clk,reset,instruction[25:21],instruction[20:16],WriteData,WriteReg,RegWrite,ReadData1,ReadData2);
//ALU Control and ALU
sign_extender sign_extend(signextended, instruction[15:0]);
bit32_2to1mux alu_src_mux(in2,ALUSrc,ReadData2,signextended);
alu_control alu_con_instancce(o0,o1,o2,instruction[5:0], ALUOp1, ALUOp0);
ALU alu_instance(ReadData1,in2,o2,o2,{o1,o0},ALUout,carryout);
//data_memory
data_memory data_mem_instance(clk,ALUout[4:0],ReadData2,MemWrite,ReadMemData);
bit32_2to1mux data_mem_mux(WriteData,MemtoReg,ALUout,ReadMemData);
endmodule
