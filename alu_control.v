module alu_control(o0,o1,o2,op, ALUOp1, ALUOp0);
    output o0,o1,o2;
    input [5:0] op;
    input ALUOp1, ALUOp0;
    
    assign o2 = ALUOp0 | (ALUOp1 & op[1]);
    assign o1 = (~ALUOp1) | (~op[2]);
    assign o0 = ALUOp1 & (op[3] | op[0]);
endmodule