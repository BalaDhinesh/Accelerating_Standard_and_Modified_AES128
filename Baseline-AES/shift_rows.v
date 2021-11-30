module SHIFT_ROWS(clk,inp_data,shift_data);

input clk;
input [127:0] inp_data;
output reg [127:0] shift_data = 128'b0;

    always @(posedge clk) begin
      shift_data[127:120] = inp_data[127:120];  
      shift_data[119:112] = inp_data[87:80];
      shift_data[111:104] = inp_data[47:40];
      shift_data[103:96] = inp_data[7:0];

      shift_data[95:88] = inp_data[95:88];
      shift_data[87:80] = inp_data[55:48];
      shift_data[79:72] = inp_data[15:8];
      shift_data[71:64] = inp_data[103:96];

      shift_data[63:56] = inp_data[63:56];
      shift_data[55:48] = inp_data[23:16];
      shift_data[47:40] = inp_data[111:104];
      shift_data[39:32] = inp_data[71:64];

      shift_data[31:24] = inp_data[31:24];
      shift_data[23:16] = inp_data[119:112];
      shift_data[15:8] = inp_data[79:72];
      shift_data[7:0] = inp_data[39:32]; 
    end

endmodule