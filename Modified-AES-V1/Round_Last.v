module LAST_ROUND(
    input clk, 
    input [3:0] ROUND_KEY,
    input [127:0] IN_DATA, 
    input [127:0] IN_KEY, 
    output [127:0] OUT_DATA
);

  wire [127:0] sb,sr,mcl,keyout,mod_out,keyout_0;

  GENERATE_KEY t0(clk,ROUND_KEY,IN_KEY,keyout_0);
  GENERATE_KEY t1(clk,ROUND_KEY,keyout_0,keyout);

  SUB_BYTES t2(clk,IN_DATA,sb);
  MOD_ADDITION t3(.clk(clk), .IN_KEY(keyout_0), .IN_DATA(sb), .MOD_ADD(mod_out));

  SHIFT_ROWS t4(clk,mod_out,sr);
assign OUT_DATA= keyout^sr;

endmodule

