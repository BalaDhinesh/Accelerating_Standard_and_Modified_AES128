module MIX_COLUMNS(clk,inp_data,mixed_data);

input clk;
input [127:0] inp_data;
output reg [127:0] mixed_data;

always @(posedge clk) begin
    mixed_data[127:120] = mixcolumn(inp_data[127:120],inp_data[119:112],inp_data[111:104],inp_data[103:96]);
    mixed_data[119:112] = mixcolumn(inp_data[119:112],inp_data[111:104],inp_data[103:96],inp_data[127:120]);
    mixed_data[111:104] = mixcolumn(inp_data[111:104],inp_data[103:96],inp_data[127:120],inp_data[119:112]);
    mixed_data[103:96] = mixcolumn(inp_data[103:96],inp_data[127:120],inp_data[119:112],inp_data[111:104]);

    mixed_data[95:88] = mixcolumn(inp_data[95:88],inp_data[87:80],inp_data[79:72],inp_data[71:64]);
    mixed_data[87:80] = mixcolumn(inp_data[87:80],inp_data[79:72],inp_data[71:64],inp_data[95:88]);
    mixed_data[79:72] = mixcolumn(inp_data[79:72],inp_data[71:64],inp_data[95:88],inp_data[87:80]);
    mixed_data[71:64] = mixcolumn(inp_data[71:64],inp_data[95:88],inp_data[87:80],inp_data[79:72]);

    mixed_data[63:56] = mixcolumn(inp_data[63:56],inp_data[55:48],inp_data[47:40],inp_data[39:32]);
    mixed_data[55:48] = mixcolumn(inp_data[55:48],inp_data[47:40],inp_data[39:32],inp_data[63:56]);
    mixed_data[47:40] = mixcolumn(inp_data[47:40],inp_data[39:32],inp_data[63:56],inp_data[55:48]);
    mixed_data[39:32] = mixcolumn(inp_data[39:32],inp_data[63:56],inp_data[55:48],inp_data[47:40]);

    mixed_data[31:24] = mixcolumn(inp_data[31:24],inp_data[23:16],inp_data[15:8],inp_data[7:0]);
    mixed_data[23:16] = mixcolumn(inp_data[23:16],inp_data[15:8],inp_data[7:0],inp_data[31:24]);
    mixed_data[15:8] = mixcolumn(inp_data[15:8],inp_data[7:0],inp_data[31:24],inp_data[23:16]);
    mixed_data[7:0] = mixcolumn(inp_data[7:0],inp_data[31:24],inp_data[23:16],inp_data[15:8]);
end
   
function [7:0] mixcolumn;
input [7:0] i1,i2,i3,i4;
    begin
        mixcolumn[7] = i1[6]^i2[6]^i2[7]^i3[7]^i4[7];
        mixcolumn[6] = i1[5]^i2[5]^i2[6]^i3[6]^i4[6];
        mixcolumn[5] = i1[4]^i2[4]^i2[5]^i3[5]^i4[5];
        mixcolumn[4] = i1[3]^i1[7]^i2[3]^i2[4]^i2[7]^i3[4]^i4[4];
        mixcolumn[3] = i1[2]^i1[7]^i2[2]^i2[3]^i2[7]^i3[3]^i4[3];
        mixcolumn[2] = i1[1]^i2[1]^i2[2]^i3[2]^i4[2];
        mixcolumn[1] = i1[0]^i1[7]^i2[0]^i2[1]^i2[7]^i3[1]^i4[1];
        mixcolumn[0] = i1[7]^i2[7]^i2[0]^i3[0]^i4[0];
    end
endfunction

endmodule