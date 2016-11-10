module tb_adder;
reg[15:0] inp;
wire[31:0] outp;
wire[31:0] outshift;
sign_extender signe(outp,inp);
shifter shif(outshift,outp);
initial
begin
inp = 16'hFAAA;
#20
inp = 16'h0AAA;
#20
$stop;
end
endmodule