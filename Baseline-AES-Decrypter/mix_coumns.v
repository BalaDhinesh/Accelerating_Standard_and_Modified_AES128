module MIX_COLUMNS(clk,inp_data,mixed_data);
input clk;
input [127:0] inp_data;
output [127:0] mixed_data;

always @(posedge clk) begin

    mixed_data[7:0] = xtime(inp_data[7:0])^xtime(inp_data[15:8])^inp_data[15:8]^inp_data[23:16]^inp_data[31:24];
    mixed_data[15:8] = inp_data[7:0]^xtime(inp_data[15:8])^xtime(inp_data[23:16])^inp_data[23:16]^inp_data[31:24];
    mixed_data[23:16] = inp_data[7:0]^inp_data[15:8]^xtime(inp_data[23:16])^xtime(inp_data[31:24])^inp_data[31:24];
    mixed_data[31:24] = xtime(inp_data[7:0])^inp_data[7:0]^inp_data[15:8]^inp_data[23:16]^xtime(inp_data[31:24]);

    mixed_data[39:32] = xtime(inp_data[39:32])^xtime(inp_data[47:40])^inp_data[47:40]^inp_data[55:48]^inp_data[63:56];
    mixed_data[47:40] = inp_data[39:32]^xtime(inp_data[47:40])^xtime(inp_data[55:48])^inp_data[55:48]^inp_data[63:56];
    mixed_data[55:48] = inp_data[39:32]^inp_data[47:40]^xtime(inp_data[55:48])^xtime(inp_data[63:56])^inp_data[63:56];
    mixed_data[63:56] = xtime(inp_data[39:32])^inp_data[39:32]^inp_data[47:40]^inp_data[55:48]^xtime(inp_data[63:56]);

    mixed_data[71:64] = xtime(inp_data[71:64])^xtime(inp_data[79:72])^inp_data[79:72]^inp_data[87:80]^inp_data[95:80];
    mixed_data[79:72] = inp_data[71:64]^xtime(inp_data[79:72])^xtime(inp_data[87:80])^inp_data[87:80]^inp_data[95:80];
    mixed_data[87:80] = inp_data[71:64]^inp_data[79:72]^xtime(inp_data[87:80])^xtime(inp_data[95:80])^inp_data[95:80];
    mixed_data[95:80] = xtime(inp_data[71:64])^inp_data[71:64]^inp_data[79:72]^inp_data[87:80]^xtime(inp_data[95:80]);

    mixed_data[103:96] = xtime(inp_data[103:96])^xtime(inp_data[111:104])^inp_data[111:104]^inp_data[119:112]^inp_data[127:120];
    mixed_data[111:104] = inp_data[103:96]^xtime(inp_data[111:104])^xtime(inp_data[119:112])^inp_data[119:112]^inp_data[127:120];
    mixed_data[119:112] = inp_data[103:96]^inp_data[111:104]^xtime(inp_data[119:112])^xtime(inp_data[127:120])^inp_data[127:120];
    mixed_data[127:120] = xtime(inp_data[103:96])^inp_data[103:96]^inp_data[111:104]^inp_data[119:112]^xtime(inp_data[127:120]);
end

function [7:0]xtime;
input [7:0]i;
begin
if(i[7] ==0)
xtime = {i[7:1],1'b0};
else
xtime = {i[7:1],1'b0}^8'h1b;
end
endfunction
endmodule