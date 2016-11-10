module testbench_shift_register;
    reg[0:15] sequence;
    wire outp;
    reg inp, clk;
    shift_register_4 inst(inp,clk,outp);
    integer i;
    initial
    begin
        sequence = 16'b0101111100001010;
        inp = 0;
        clk = 1;
        
    end
    always #5 clk=~clk;
    initial
    begin
        #100 
        for (i = 0; i < 16; i=i+1)
        begin
            #8
            inp = sequence[i];
        end
    end
endmodule