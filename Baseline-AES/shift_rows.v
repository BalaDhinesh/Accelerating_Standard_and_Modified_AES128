module SHIFT_ROWS(inp_data,shift_data);

input [127:0] inp_data;
output [127:0] shift_data;

    assign  shift_data[127:120] = inp_data[127:120];  
    assign  shift_data[119:112] = inp_data[87:80];
    assign  shift_data[111:104] = inp_data[47:40];
    assign  shift_data[103:96] = inp_data[7:0];

    assign  shift_data[95:88] = inp_data[95:88];
    assign  shift_data[87:80] = inp_data[55:48];
    assign  shift_data[79:72] = inp_data[15:8];
    assign  shift_data[71:64] = inp_data[103:96];

    assign  shift_data[63:56] = inp_data[63:56];
    assign  shift_data[55:48] = inp_data[23:16];
    assign  shift_data[47:40] = inp_data[111:104];
    assign  shift_data[39:32] = inp_data[71:64];

    assign  shift_data[31:24] = inp_data[31:24];
    assign  shift_data[23:16] = inp_data[119:112];
    assign  shift_data[15:8] = inp_data[79:72];
    assign  shift_data[7:0] = inp_data[39:32]; 

endmodule