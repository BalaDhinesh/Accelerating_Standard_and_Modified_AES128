module MODIFIED_AES128_V2(clk,IN_DATA,IN_KEY,OUT_DATA);

input clk;
input[127:0] IN_DATA;
input[127:0] IN_KEY;
output[127:0] OUT_DATA;

wire [127:0] ROUND0_OUT_DATA,ROUND1_OUT_DATA,ROUND2_OUT_DATA,ROUND3_OUT_DATA,ROUND4_OUT_DATA,ROUND5_OUT_DATA,ROUND6_OUT_DATA,ROUND7_OUT_DATA,ROUND8_OUT_DATA,ROUND9_OUT_DATA;
wire [127:0] OUT_KEY1, OUT_KEY2, OUT_KEY3, OUT_KEY4, OUT_KEY5, OUT_KEY6, OUT_KEY7, OUT_KEY8, OUT_KEY9;

assign ROUND0_OUT_DATA = IN_DATA^IN_KEY;

ROUND_ITERATION r1(.clk(clk), 
                    .ROUND_KEY(4'b0000), 
                    .IN_DATA(ROUND0_OUT_DATA), 
                    .IN_KEY(IN_KEY),
                    .OUT_KEY(OUT_KEY1),
                    .OUT_DATA(ROUND1_OUT_DATA));

ROUND_ITERATION r2(.clk(clk), 
                    .ROUND_KEY(4'b0001), 
                    .IN_DATA(ROUND1_OUT_DATA),
                    .IN_KEY(OUT_KEY1),
                    .OUT_KEY(OUT_KEY2),
                    .OUT_DATA(ROUND2_OUT_DATA));

ROUND_ITERATION r3(.clk(clk), 
                    .ROUND_KEY(4'b0010), 
                    .IN_DATA(ROUND2_OUT_DATA),
                    .IN_KEY(OUT_KEY2),
                    .OUT_KEY(OUT_KEY3),
                    .OUT_DATA(ROUND3_OUT_DATA));

ROUND_ITERATION r4(.clk(clk), 
                    .ROUND_KEY(4'b0011), 
                    .IN_DATA(ROUND3_OUT_DATA),
                    .IN_KEY(OUT_KEY3),
                    .OUT_KEY(OUT_KEY4),
                    .OUT_DATA(ROUND4_OUT_DATA));

ROUND_ITERATION r5(.clk(clk), 
                    .ROUND_KEY(4'b0100),
                    .IN_DATA(ROUND4_OUT_DATA),
                    .IN_KEY(OUT_KEY4),
                    .OUT_KEY(OUT_KEY5),
                    .OUT_DATA(ROUND5_OUT_DATA));

ROUND_ITERATION r6(.clk(clk), 
                    .ROUND_KEY(4'b0101),
                    .IN_DATA(ROUND5_OUT_DATA),
                    .IN_KEY(OUT_KEY5),
                    .OUT_KEY(OUT_KEY6),
                    .OUT_DATA(ROUND6_OUT_DATA));

ROUND_ITERATION r7(.clk(clk), 
                    .ROUND_KEY(4'b0110),
                    .IN_DATA(ROUND6_OUT_DATA),
                    .IN_KEY(OUT_KEY6),
                    .OUT_KEY(OUT_KEY7),
                    .OUT_DATA(ROUND7_OUT_DATA));

ROUND_ITERATION r8(.clk(clk), 
                    .ROUND_KEY(4'b0111),
                    .IN_DATA(ROUND7_OUT_DATA),
                    .IN_KEY(OUT_KEY7),
                    .OUT_KEY(OUT_KEY8),
                    .OUT_DATA(ROUND8_OUT_DATA));

ROUND_ITERATION r9(.clk(clk), 
                    .ROUND_KEY(4'b1000),
                    .IN_DATA(ROUND8_OUT_DATA),
                    .IN_KEY(OUT_KEY8),
                    .OUT_KEY(OUT_KEY9),
                    .OUT_DATA(ROUND9_OUT_DATA));

LAST_ROUND r10(.clk(clk), 
                .ROUND_KEY(4'b1001),
                .IN_DATA(ROUND9_OUT_DATA),
                .IN_KEY(OUT_KEY9),
                .OUT_DATA(OUT_DATA));

endmodule