module SUB_BYTES(inp_data,sub_data);

input [127:0] inp_data;
output [127:0] sub_data;

    FORWARD_SUBSTITUTION_BOX s0(.a(inp_data[127:120]),.c(sub_data[127:120]));
    FORWARD_SUBSTITUTION_BOX s1(.a(inp_data[119:112]),.c(sub_data[119:112]));
    FORWARD_SUBSTITUTION_BOX s2(.a(inp_data[111:104]),.c(sub_data[111:104]));
    FORWARD_SUBSTITUTION_BOX s3(.a(inp_data[103:96]),.c(sub_data[103:96]));

    FORWARD_SUBSTITUTION_BOX s4(.a(inp_data[95:88]),.c(sub_data[95:88]));
    FORWARD_SUBSTITUTION_BOX s5(.a(inp_data[87:80]),.c(sub_data[87:80]));
    FORWARD_SUBSTITUTION_BOX s6(.a(inp_data[79:72]),.c(sub_data[79:72]));
    FORWARD_SUBSTITUTION_BOX s7(.a(inp_data[71:64]),.c(sub_data[71:64]));

    FORWARD_SUBSTITUTION_BOX s8(.a(inp_data[63:56]),.c(sub_data[63:56]));
    FORWARD_SUBSTITUTION_BOX s9(.a(inp_data[55:48]),.c(sub_data[55:48]));
    FORWARD_SUBSTITUTION_BOX s10(.a(inp_data[47:40]),.c(sub_data[47:40]));
    FORWARD_SUBSTITUTION_BOX s11(.a(inp_data[39:32]),.c(sub_data[39:32]));

    FORWARD_SUBSTITUTION_BOX s12(.a(inp_data[31:24]),.c(sub_data[31:24]));
    FORWARD_SUBSTITUTION_BOX s13(.a(inp_data[23:16]),.c(sub_data[23:16]));
    FORWARD_SUBSTITUTION_BOX s14(.a(inp_data[15:8]),.c(sub_data[15:8]));
    FORWARD_SUBSTITUTION_BOX s15(.a(inp_data[7:0]),.c(sub_data[7:0]));

endmodule