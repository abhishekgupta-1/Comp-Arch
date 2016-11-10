
module ANDarray (RegDst,ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp0,ALUOp1,Op);
input [5:0] Op;
output RegDst,ALUSrc,MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp0,ALUOp1;
wire Rformat, lw,sw,beq;
assign Rformat= (~Op[0])& (~Op[1])& (~Op[2])& (~Op[3])& (~Op[4])& (~Op[5]);
assign lw = (Op[5]) & (~Op[4]) & (~Op[3]) & (~Op[2]) & (Op[1]) & (Op[0]);
assign sw = (Op[5]) & (~Op[4]) & (Op[3]) & (~Op[2]) & (Op[1]) & (Op[0]);
assign beq = (~Op[5]) & (~Op[4]) & (~Op[3]) & (Op[2]) & (~Op[1]) & (~Op[0]);
// complete rest of the module
assign RegDst=Rformat;
assign ALUSrc = lw | sw;
assign MemtoReg = lw;
assign RegWrite = Rformat | lw;
assign MemRead = lw;
assign MemWrite = sw;
assign Branch = beq;
assign ALUOp1 = Rformat;
assign ALUOp0 = beq;
endmodule