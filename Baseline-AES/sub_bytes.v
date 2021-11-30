module SUB_BYTES(clk,inp_data,sub_data);

input clk;
input [127:0] inp_data;
output reg [127:0] sub_data;

wire [127:0] sub_data_temp;

    FORWARD_SUBSTITUTION_BOX s0(.a(inp_data[127:120]),.c(sub_data_temp[127:120]));
    FORWARD_SUBSTITUTION_BOX s1(.a(inp_data[119:112]),.c(sub_data_temp[119:112]));
    FORWARD_SUBSTITUTION_BOX s2(.a(inp_data[111:104]),.c(sub_data_temp[111:104]));
    FORWARD_SUBSTITUTION_BOX s3(.a(inp_data[103:96]),.c(sub_data_temp[103:96]));

    FORWARD_SUBSTITUTION_BOX s4(.a(inp_data[95:88]),.c(sub_data_temp[95:88]));
    FORWARD_SUBSTITUTION_BOX s5(.a(inp_data[87:80]),.c(sub_data_temp[87:80]));
    FORWARD_SUBSTITUTION_BOX s6(.a(inp_data[79:72]),.c(sub_data_temp[79:72]));
    FORWARD_SUBSTITUTION_BOX s7(.a(inp_data[71:64]),.c(sub_data_temp[71:64]));

    FORWARD_SUBSTITUTION_BOX s8(.a(inp_data[63:56]),.c(sub_data_temp[63:56]));
    FORWARD_SUBSTITUTION_BOX s9(.a(inp_data[55:48]),.c(sub_data_temp[55:48]));
    FORWARD_SUBSTITUTION_BOX s10(.a(inp_data[47:40]),.c(sub_data_temp[47:40]));
    FORWARD_SUBSTITUTION_BOX s11(.a(inp_data[39:32]),.c(sub_data_temp[39:32]));

    FORWARD_SUBSTITUTION_BOX s12(.a(inp_data[31:24]),.c(sub_data_temp[31:24]));
    FORWARD_SUBSTITUTION_BOX s13(.a(inp_data[23:16]),.c(sub_data_temp[23:16]));
    FORWARD_SUBSTITUTION_BOX s14(.a(inp_data[15:8]),.c(sub_data_temp[15:8]));
    FORWARD_SUBSTITUTION_BOX s15(.a(inp_data[7:0]),.c(sub_data_temp[7:0]));

    always @(posedge clk) begin
        sub_data <= sub_data_temp;
    end

endmodule