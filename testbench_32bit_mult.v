
module tb_32bit2to1mux;
reg [31:0] INP1, INP2;
reg SEL;
wire [31:0] out;
bit32_2to1mux M1(out,SEL,INP1,INP2);

initial
begin
INP1=32'b10101010101010101010101010101010;
INP2=32'b11110000111100001111000011110000;
SEL=1'b0;
#100 SEL=1'b1;
#1000 $stop;
end
endmodule