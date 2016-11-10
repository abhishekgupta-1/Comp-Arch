module instructon_memory (DataRead, ReadAddress);
input [4:0] ReadAddress;
output[31:0] DataRead;
reg[32*32-1:0] data;
assign DataRead = data[32*ReadAddress +: 32];
integer i;
   initial
   begin
      for(i=0;i<32;i=i+1)
      begin:init //100110-10100-11101-11011-11011-101101
         data[32*i +:32] =32'b0000000000100001100000000100000;
      end
   end
endmodule