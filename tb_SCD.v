
module tb_scdp;    
wire [31:0] ALU_output;     
reg [4:0] PC;   
reg reset,clk;  
SCDDataPath scdp(ALU_output, PC, reset, clk);
initial    
begin           
$monitor("at time %0d IPC = %d, Reset = %d , CLK = %d ,   ALU Output = %d",$time,PC,reset,clk, ALU_output);           
#0 clk = 0;  
PC = 5;          
#120 reset = 1;       
#400 $stop;    
end  
always      
begin         
#20 clk = ~clk;     
end 
endmodule