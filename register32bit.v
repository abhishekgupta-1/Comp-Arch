module reg_32bit(q,d,clk,reset);
    output [31:0] q;
    input [31:0] d;
    input clk;
    input reset;
    genvar j;
    generate for (j=0;j<32;j=j+1)
    begin : reg_loop
       dff_async_clear dff(d[j],reset,clk,q[j]);
   end
   endgenerate
   endmodule