module MIX_COLUMNS(inp_data,mixed_data);

input [127:0] inp_data;
output [127:0] mixed_data;

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