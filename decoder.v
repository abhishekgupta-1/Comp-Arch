module DECODER(out,in);
    output [0:7] out;
    input [0:2] in;
    wire [0:2] negin;
    not (negin[0],in[0]);
    not (negin[1],in[1]);
    not (negin[2],in[2]);
    and (out[0],negin[0],negin[1],negin[2]);
    and (out[1],negin[0],negin[1],in[2]);
    and (out[2],negin[0],in[1],negin[2]);
    and (out[3],negin[0],in[1],in[2]);
    and (out[4],in[0],negin[1],negin[2]);
    and (out[5],in[0],negin[1],in[2]);
    and (out[6],in[0],in[1],negin[2]);
    and (out[7],in[0],in[1],in[2]);
endmodule