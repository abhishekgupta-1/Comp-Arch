module ALU(in1, in2,binvert,carryin,op,result,carryout);
    input [31:0] in1,in2;
    output [31:0] result;
    input [1:0] op;
    input carryin;
    input binvert;
    output carryout;
    wire [31:0] andresult,orresult,sum,
    binvertresult;
    wire[31:0] b_inv;
    assign b_inv = ~in2;    
    bit32_2to1mux mux1(binvertresult,
    binvert,in2,b_inv);

    bit32AND ander(andresult,in1,binvertresult);
    bit32OR orer(orresult,in1,binvertresult);
    FA_dataflow adde(carryout,sum,in1,binvertresult,
    carryin);
    
    bit32_3to1_mux mux2(result,op,andresult,
    orresult,sum);
    
endmodule