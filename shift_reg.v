module shift_register_4(inp, clk, outp);
    input inp;
    output outp;
    input clk;
    reg rst;
    wire o1, o2, o3;
    initial
       rst<=0;
    dff_sync_clear dff1(inp,rst,clk, o1);
    dff_sync_clear dff2(o1,rst,clk, o2);
    dff_sync_clear dff3(o2,rst,clk, o3);
    dff_sync_clear dff4(o3,rst,clk, outp);
    

endmodule