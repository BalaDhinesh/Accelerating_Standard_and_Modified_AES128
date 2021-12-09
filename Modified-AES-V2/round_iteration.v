module ROUND_ITERATION(
    input clk, 
    input [3:0] ROUND_KEY,
    input [127:0] IN_DATA, 
    input [127:0] IN_KEY,
    output [127:0] OUT_KEY, 
    output reg [127:0] OUT_DATA
);

wire [127:0] SB_DATA,SHIFT_DATA,MIXED_DATA;

GENERATE_KEY m0(.clk(clk), .ROUND_KEY(ROUND_KEY), .IN_KEY(IN_KEY), .OUT_KEY(OUT_KEY));
SUB_BYTES m1(.clk(clk), .IN_DATA(IN_DATA), .IN_KEY(IN_KEY), .SB_DATA(SB_DATA));
SHIFT_ROWS m2(.clk(clk), .IN_DATA(SB_DATA), .SHIFT_DATA(SHIFT_DATA));
MIX_COLUMNS m3(.clk(clk), .IN_DATA(SHIFT_DATA), .MIXED_DATA(MIXED_DATA));

always @(posedge clk) OUT_DATA <= OUT_KEY ^ MIXED_DATA;

endmodule