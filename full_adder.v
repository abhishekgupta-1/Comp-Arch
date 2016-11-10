module FADDER(s,c,x,y,z);
input x,y,z;
wire [0:7] d;
output s,c;
DECODER dec(d,{x,y,z});
assign s = d[1] | d[2] | d[4] | d[7],
c = d[3] | d[5] | d[6] | d[7];
endmodule