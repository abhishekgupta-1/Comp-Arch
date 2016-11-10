module adder(cout,result, input1, input2);
output[31:0] result;
input[31:0] input1, input2;
output cout;
assign {cout, result} = input1+input2;
endmodule
