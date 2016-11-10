module Testing;
    reg d,clk,rst;
    wire q;
    dff_sync_clear dff(d,rst,clk,q);
    
    always @ (posedge clk)
    begin
        $display("d=%b, clk=%b, q=%b\n",d,clk,rst,q);
    end
    initial
    begin
    #0 clk = 0;  
   end
    always #5 
    begin
    clk <= ~clk ; 
end  
   always #15
   begin
       d <= ~d;
   end
    initial
    begin
        d = 0; rst = 0;
        #4
        d = 1; rst = 1;
        #50
        d=1; rst = 0;
        #20
        d = 1; rst = 1;
    end
endmodule