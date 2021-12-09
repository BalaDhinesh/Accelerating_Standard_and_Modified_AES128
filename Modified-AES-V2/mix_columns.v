module MIX_COLUMNS(
    input clk,
    input [127:0] IN_DATA,
    output [127:0] MIXED_DATA
);

reg [127:0] MIXED_DATA_REG;

  always @(*) begin
    MIXED_DATA_REG[127:120] = MIXCOLUMN(IN_DATA[127:120],IN_DATA[119:112],IN_DATA[111:104],IN_DATA[103:96]);
    MIXED_DATA_REG[119:112] = MIXCOLUMN(IN_DATA[119:112],IN_DATA[111:104],IN_DATA[103:96],IN_DATA[127:120]);
    MIXED_DATA_REG[111:104] = MIXCOLUMN(IN_DATA[111:104],IN_DATA[103:96],IN_DATA[127:120],IN_DATA[119:112]);
    MIXED_DATA_REG[103:96] = MIXCOLUMN(IN_DATA[103:96],IN_DATA[127:120],IN_DATA[119:112],IN_DATA[111:104]);

    MIXED_DATA_REG[95:88] = MIXCOLUMN(IN_DATA[95:88],IN_DATA[87:80],IN_DATA[79:72],IN_DATA[71:64]);
    MIXED_DATA_REG[87:80] = MIXCOLUMN(IN_DATA[87:80],IN_DATA[79:72],IN_DATA[71:64],IN_DATA[95:88]);
    MIXED_DATA_REG[79:72] = MIXCOLUMN(IN_DATA[79:72],IN_DATA[71:64],IN_DATA[95:88],IN_DATA[87:80]);
    MIXED_DATA_REG[71:64] = MIXCOLUMN(IN_DATA[71:64],IN_DATA[95:88],IN_DATA[87:80],IN_DATA[79:72]);

    MIXED_DATA_REG[63:56] = MIXCOLUMN(IN_DATA[63:56],IN_DATA[55:48],IN_DATA[47:40],IN_DATA[39:32]);
    MIXED_DATA_REG[55:48] = MIXCOLUMN(IN_DATA[55:48],IN_DATA[47:40],IN_DATA[39:32],IN_DATA[63:56]);
    MIXED_DATA_REG[47:40] = MIXCOLUMN(IN_DATA[47:40],IN_DATA[39:32],IN_DATA[63:56],IN_DATA[55:48]);
    MIXED_DATA_REG[39:32] = MIXCOLUMN(IN_DATA[39:32],IN_DATA[63:56],IN_DATA[55:48],IN_DATA[47:40]);

    MIXED_DATA_REG[31:24] = MIXCOLUMN(IN_DATA[31:24],IN_DATA[23:16],IN_DATA[15:8],IN_DATA[7:0]);
    MIXED_DATA_REG[23:16] = MIXCOLUMN(IN_DATA[23:16],IN_DATA[15:8],IN_DATA[7:0],IN_DATA[31:24]);
    MIXED_DATA_REG[15:8] = MIXCOLUMN(IN_DATA[15:8],IN_DATA[7:0],IN_DATA[31:24],IN_DATA[23:16]);
    MIXED_DATA_REG[7:0] = MIXCOLUMN(IN_DATA[7:0],IN_DATA[31:24],IN_DATA[23:16],IN_DATA[15:8]);
end

assign MIXED_DATA = MIXED_DATA_REG;
   
function [7:0] MIXCOLUMN;
input [7:0] IN1, IN2, IN3, IN4;
    begin
        MIXCOLUMN[7] = IN1[6]^IN2[6]^IN2[7]^IN3[7]^IN4[7];
        MIXCOLUMN[6] = IN1[5]^IN2[5]^IN2[6]^IN3[6]^IN4[6];
        MIXCOLUMN[5] = IN1[4]^IN2[4]^IN2[5]^IN3[5]^IN4[5];
        MIXCOLUMN[4] = IN1[3]^IN1[7]^IN2[3]^IN2[4]^IN2[7]^IN3[4]^IN4[4];
        MIXCOLUMN[3] = IN1[2]^IN1[7]^IN2[2]^IN2[3]^IN2[7]^IN3[3]^IN4[3];
        MIXCOLUMN[2] = IN1[1]^IN2[1]^IN2[2]^IN3[2]^IN4[2];
        MIXCOLUMN[1] = IN1[0]^IN1[7]^IN2[0]^IN2[1]^IN2[7]^IN3[1]^IN4[1];
        MIXCOLUMN[0] = IN1[7]^IN2[7]^IN2[0]^IN3[0]^IN4[0];
    end
endfunction

endmodule
// module MIX_COLUMNS(clk,inp_data,mixed_data);

// input clk;
// input [127:0] inp_data;
// output reg [127:0] mixed_data;

// always @(posedge clk) begin
//     mixed_data[127:120] = mixcolumn(inp_data[127:120],inp_data[119:112],inp_data[111:104],inp_data[103:96]);
//     mixed_data[119:112] = mixcolumn(inp_data[119:112],inp_data[111:104],inp_data[103:96],inp_data[127:120]);
//     mixed_data[111:104] = mixcolumn(inp_data[111:104],inp_data[103:96],inp_data[127:120],inp_data[119:112]);
//     mixed_data[103:96] = mixcolumn(inp_data[103:96],inp_data[127:120],inp_data[119:112],inp_data[111:104]);

//     mixed_data[95:88] = mixcolumn(inp_data[95:88],inp_data[87:80],inp_data[79:72],inp_data[71:64]);
//     mixed_data[87:80] = mixcolumn(inp_data[87:80],inp_data[79:72],inp_data[71:64],inp_data[95:88]);
//     mixed_data[79:72] = mixcolumn(inp_data[79:72],inp_data[71:64],inp_data[95:88],inp_data[87:80]);
//     mixed_data[71:64] = mixcolumn(inp_data[71:64],inp_data[95:88],inp_data[87:80],inp_data[79:72]);

//     mixed_data[63:56] = mixcolumn(inp_data[63:56],inp_data[55:48],inp_data[47:40],inp_data[39:32]);
//     mixed_data[55:48] = mixcolumn(inp_data[55:48],inp_data[47:40],inp_data[39:32],inp_data[63:56]);
//     mixed_data[47:40] = mixcolumn(inp_data[47:40],inp_data[39:32],inp_data[63:56],inp_data[55:48]);
//     mixed_data[39:32] = mixcolumn(inp_data[39:32],inp_data[63:56],inp_data[55:48],inp_data[47:40]);

//     mixed_data[31:24] = mixcolumn(inp_data[31:24],inp_data[23:16],inp_data[15:8],inp_data[7:0]);
//     mixed_data[23:16] = mixcolumn(inp_data[23:16],inp_data[15:8],inp_data[7:0],inp_data[31:24]);
//     mixed_data[15:8] = mixcolumn(inp_data[15:8],inp_data[7:0],inp_data[31:24],inp_data[23:16]);
//     mixed_data[7:0] = mixcolumn(inp_data[7:0],inp_data[31:24],inp_data[23:16],inp_data[15:8]);
// end
   
// function [7:0] mixcolumn;
// input [7:0] i1,i2,i3,i4;
//     begin
//         mixcolumn[7] = i1[6]^i2[6]^i2[7]^i3[7]^i4[7];
//         mixcolumn[6] = i1[5]^i2[5]^i2[6]^i3[6]^i4[6];
//         mixcolumn[5] = i1[4]^i2[4]^i2[5]^i3[5]^i4[5];
//         mixcolumn[4] = i1[3]^i1[7]^i2[3]^i2[4]^i2[7]^i3[4]^i4[4];
//         mixcolumn[3] = i1[2]^i1[7]^i2[2]^i2[3]^i2[7]^i3[3]^i4[3];
//         mixcolumn[2] = i1[1]^i2[1]^i2[2]^i3[2]^i4[2];
//         mixcolumn[1] = i1[0]^i1[7]^i2[0]^i2[1]^i2[7]^i3[1]^i4[1];
//         mixcolumn[0] = i1[7]^i2[7]^i2[0]^i3[0]^i4[0];
//     end
// endfunction

// endmodule