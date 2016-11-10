module reg_5bit(q,d,clk,reset);
    output [4:0] q;
    input [4:0] d;
    input clk;
    input reset;
reg[4:0] q;
always @ (posedge clk)
q=d;
always @ (reset)
begin
if (!reset)
q=5'b00000;
end
endmodule