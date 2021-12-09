module ROUND_ITERATION(
    input clk, 
    input [127:0] IN_DATA, 
    input [127:0] IN_KEY, 
    output reg [127:0] OUT_DATA
);

wire [127:0] SB_DATA, SHIFT_DATA, MIXED_DATA;

SUB_BYTES SB(.clk(clk), .IN_DATA(IN_DATA), .SB_DATA(SB_DATA));
SHIFT_ROWS SR(.clk(clk), .IN_DATA(SB_DATA), .SHIFT_DATA(SHIFT_DATA));
MIX_COLUMNS MC(.clk(clk), .IN_DATA(SHIFT_DATA), .MIXED_DATA(MIXED_DATA));

always @(posedge clk) OUT_DATA <= IN_KEY ^ MIXED_DATA;

endmodule