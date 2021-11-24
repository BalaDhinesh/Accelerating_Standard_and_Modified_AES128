module AES_128_bit(clk,inp_data,inp_key,out_data);

input clk;
input[127:0] inp_data;
input[127:0] inp_key;
output[127:0] out_data;

wire [127:0] round0_out_data,round2_out_data,round3_out_data,round4_out_data,round5_out_data,round6_out_data,round7_out_data,round8_out_data,round9_out_data);
wire [127:0] keyout1, keyout2, keyout3, keyout4, keyout5, keyout6, keyout7, keyout8, keyout9;

assign round0_out_data = inp_data^inp_key;

ROUND_ITERATION r1(.clk(clk), 
                    .round(4'b0000), 
                    .inp_data(round0_out_data), 
                    .inp_key(inp_key),
                    .out_key(keyout1),
                    .out_data(round1_out_data));

ROUND_ITERATION r2(.clk(clk), 
                    .round(4'b0001), 
                    .inp_data(round1_out_data),
                    .inp_key(keyout1),
                    .out_key(keyout2),
                    .out_data(round2_out_data));

ROUND_ITERATION r3(.clk(clk), 
                    .round(4'b0010), 
                    .inp_data(round2_out_data),
                    .inp_key(keyout2),
                    .out_key(keyout3),
                    .out_data(round3_out_data));

ROUND_ITERATION r4(.clk(clk), 
                    .round(4'b0011), 
                    .inp_data(round3_out_data),
                    .inp_key(keyout3),
                    .out_key(keyout4),
                    .out_data(round4_out_data));

ROUND_ITERATION r5(.clk(clk), 
                    .round(4'b0100),
                    .inp_data(round4_out_data),
                    .inp_key(keyout4),
                    .out_key(keyout5),
                    .out_data(round5_out_data));

ROUND_ITERATION r6(.clk(clk), 
                    .round(4'b0101),
                    .inp_data(round5_out_data),
                    .inp_key(keyout5),
                    .out_key(keyout6),
                    .out_data(round6_out_data));

ROUND_ITERATION r7(.clk(clk), 
                    .round(4'b0110),
                    .inp_data(round6_out_data),
                    .inp_key(keyout6),
                    .out_key(keyout7),
                    .out_data(round7_out_data));

ROUND_ITERATION r8(.clk(clk), 
                    .round(4'b0111),
                    .inp_data(round7_out_data),
                    .inp_key(keyout7),
                    .out_key(keyout8),
                    .out_data(round8_out_data));

ROUND_ITERATION r9(.clk(clk), 
                    .round(4'b1000),
                    .inp_data(round8_out_data),
                    .inp_key(keyout8),
                    .out_key(keyout9),
                    .out_data(round9_out_data));

LAST_ROUND r10(.clk(clk), 
                .round(4'b1001),
                .inp_data(round9_out_data),
                .inp_key(keyout9),
                .out_data(out_data));

endmodule