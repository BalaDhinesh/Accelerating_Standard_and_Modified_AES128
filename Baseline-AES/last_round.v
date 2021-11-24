module LAST_ROUND(clk, round, inp_data, inp_key, out_final_data);

input clk;
input [3:0] round;
input [127:0] inp_data;
input [127:0] inp_key;
output  [127:0] out_final_data;

wire [127:0] sub_data,shift_data,out_key;

GENERATE_KEY n0(.round(round),.inp_key(inp_key),.out_key(out_key));
SUB_BYTES n1(.inp_data(inp_data),.sub_data(sub_data));
SHIFT_ROWS n2(.inp_data(sub_data),.shift_data(shift_data));

assign out_final_data = out_key^shift_data;

endmodule