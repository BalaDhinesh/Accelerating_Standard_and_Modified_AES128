module AES128(
    input clk,
    input reset,
    
    input [31:0] IN_DATA0,
    input [31:0] IN_DATA1,
    input [31:0] IN_DATA2, 
    input [31:0] IN_DATA3,
    
    input [31:0] IN_KEY0,
    input [31:0] IN_KEY1,
    input [31:0] IN_KEY2,
    input [31:0] IN_KEY3,
    
    output [31:0] OUT_DATA0, 
    output [31:0] OUT_DATA1,
    output [31:0] OUT_DATA2,
    output [31:0] OUT_DATA3
);
wire [127:0] IN_DATA, IN_KEY, OUT_DATA;

assign IN_DATA = {IN_DATA3, IN_DATA2, IN_DATA1, IN_DATA0};
assign IN_KEY = {IN_KEY3, IN_KEY2, IN_KEY1, IN_KEY0};
assign {OUT_DATA3, OUT_DATA2, OUT_DATA1, OUT_DATA0} = OUT_DATA;

reg [127:0] R0_OUT_DATA, KEY;
wire [127:0] R1_OUT_DATA, R2_OUT_DATA, R3_OUT_DATA, R4_OUT_DATA, R5_OUT_DATA, R6_OUT_DATA, R7_OUT_DATA, R8_OUT_DATA, R9_OUT_DATA;
wire [127:0] OUT_KEYW1, OUT_KEYW2, OUT_KEYW3, OUT_KEYW4, OUT_KEYW5, OUT_KEYW6, OUT_KEYW7, OUT_KEYW8, OUT_KEYW9;
wire [127:0] OUT_KEYR0, OUT_KEYR1, OUT_KEYR2, OUT_KEYR3, OUT_KEYR4, OUT_KEYR5, OUT_KEYR6, OUT_KEYR7, OUT_KEYR8, OUT_KEYR9;

always @(posedge clk) begin
    R0_OUT_DATA <= IN_DATA ^ IN_KEY;
    KEY <= IN_KEY;
end

GENERATE_KEY
        K1 (.clk(clk), .ROUND_KEY(4'd0), .IN_KEY(KEY),       .OUT_KEY(OUT_KEYW1), .OUT_KEY_R(OUT_KEYR0)),
        K2 (.clk(clk), .ROUND_KEY(4'd1), .IN_KEY(OUT_KEYW1), .OUT_KEY(OUT_KEYW2), .OUT_KEY_R(OUT_KEYR1)),
        K3 (.clk(clk), .ROUND_KEY(4'd2), .IN_KEY(OUT_KEYW2), .OUT_KEY(OUT_KEYW3), .OUT_KEY_R(OUT_KEYR2)),
        K4 (.clk(clk), .ROUND_KEY(4'd3), .IN_KEY(OUT_KEYW3), .OUT_KEY(OUT_KEYW4), .OUT_KEY_R(OUT_KEYR3)),
        K5 (.clk(clk), .ROUND_KEY(4'd4), .IN_KEY(OUT_KEYW4), .OUT_KEY(OUT_KEYW5), .OUT_KEY_R(OUT_KEYR4)),
        K6 (.clk(clk), .ROUND_KEY(4'd5), .IN_KEY(OUT_KEYW5), .OUT_KEY(OUT_KEYW6), .OUT_KEY_R(OUT_KEYR5)),
        K7 (.clk(clk), .ROUND_KEY(4'd6), .IN_KEY(OUT_KEYW6), .OUT_KEY(OUT_KEYW7), .OUT_KEY_R(OUT_KEYR6)),
        K8 (.clk(clk), .ROUND_KEY(4'd7), .IN_KEY(OUT_KEYW7), .OUT_KEY(OUT_KEYW8), .OUT_KEY_R(OUT_KEYR7)),
        K9 (.clk(clk), .ROUND_KEY(4'd8), .IN_KEY(OUT_KEYW8), .OUT_KEY(OUT_KEYW9), .OUT_KEY_R(OUT_KEYR8)),
        K10(.clk(clk), .ROUND_KEY(4'd9), .IN_KEY(OUT_KEYW9), .OUT_KEY() ,         .OUT_KEY_R(OUT_KEYR9));

ROUND_ITERATION R1(.clk(clk), 
                    .IN_DATA(R0_OUT_DATA), 
                    .IN_KEY(OUT_KEYR0),
                    .OUT_DATA(R1_OUT_DATA));

ROUND_ITERATION R2(.clk(clk), 
                    .IN_DATA(R1_OUT_DATA),
                    .IN_KEY(OUT_KEYR1),
                    .OUT_DATA(R2_OUT_DATA));

ROUND_ITERATION R3(.clk(clk), 
                    .IN_DATA(R2_OUT_DATA),
                    .IN_KEY(OUT_KEYR2),
                    .OUT_DATA(R3_OUT_DATA));

ROUND_ITERATION R4(.clk(clk), 
                    .IN_DATA(R3_OUT_DATA),
                    .IN_KEY(OUT_KEYR3),
                    .OUT_DATA(R4_OUT_DATA));

ROUND_ITERATION R5(.clk(clk), 
                    .IN_DATA(R4_OUT_DATA),
                    .IN_KEY(OUT_KEYR4),
                    .OUT_DATA(R5_OUT_DATA));

ROUND_ITERATION R6(.clk(clk), 
                    .IN_DATA(R5_OUT_DATA),
                    .IN_KEY(OUT_KEYR5),
                    .OUT_DATA(R6_OUT_DATA));

ROUND_ITERATION R7(.clk(clk), 
                    .IN_DATA(R6_OUT_DATA),
                    .IN_KEY(OUT_KEYR6),
                    .OUT_DATA(R7_OUT_DATA));

ROUND_ITERATION R8(.clk(clk), 
                    .IN_DATA(R7_OUT_DATA),
                    .IN_KEY(OUT_KEYR7),
                    .OUT_DATA(R8_OUT_DATA));

ROUND_ITERATION R9(.clk(clk), 
                    .IN_DATA(R8_OUT_DATA),
                    .IN_KEY(OUT_KEYR8),
                    .OUT_DATA(R9_OUT_DATA));

LAST_ROUND R10(.clk(clk), 
                .IN_DATA(R9_OUT_DATA),
                .IN_KEY(OUT_KEYR9),
                .OUT_DATA(OUT_DATA));


endmodule