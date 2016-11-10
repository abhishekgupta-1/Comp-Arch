module decoder2_4 (register,reg_no);
output [0:3] register;
input [1:0] reg_no;
assign register = (reg_no==2'b00)? 4'b1000 : 
((reg_no==2'b01)? 4'b0100 : ((reg_no==2'b10)? 4'b0010 : 4'b0001) );
endmodule