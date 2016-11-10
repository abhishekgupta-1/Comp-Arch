module tb_multiplexer;
    reg[31:0] q1,q2,q3,q4;
    wire[31:0] regData;
    reg[1:0] reg_no;
    mux4_1 test_mux(regData,q1,q2,q3,q4,reg_no);
    
    initial
    begin
        q1 <= 32'HAFAFAFAF;
        q2 <= 32'H00000000;
        q3 <= 32'HFFFFFFFF;
        q4 <= 32'HA0A0A0A0;
        reg_no = 00;
        #20 reg_no = 01;
        #20 reg_no = 10;
        #20 reg_no = 11;
    end
endmodule