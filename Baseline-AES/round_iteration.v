module ROUND_ITERATION(clk, round, inp_data, inp_key, out_key, out_data);

input clk;
input [3:0] round;
input [127:0] inp_data;
input [127:0] inp_key;
output [127:0] out_key;
output [127:0] out_data;

wire [127:0] sub_data,shift_data,mixed_data;

GENERATE_KEY m0(.clk(clk),.round(round), .inp_key(inp_key), .out_key(out_key));
SUB_BYTES m1(.clk(clk),.inp_data(inp_data), .sub_data(sub_data));
SHIFT_ROWS m2(.clk(clk),.inp_data(sub_data), .shift_data(shift_data));
MIX_COLUMNS m3(.clk(clk),.inp_data(shift_data), .mixed_data(mixed_data));

assign out_data = out_key^mixed_data;

endmodule