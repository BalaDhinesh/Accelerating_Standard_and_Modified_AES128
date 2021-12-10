module ROUND_ITERATION(
    input clk, 
    input [3:0] ROUND_KEY, 
    input [127:0] IN_DATA, 
    input [127:0] IN_KEY, 
    output [127:0] OUT_KEY, 
    output [127:0] OUT_DATA
);

wire [127:0] keyout_0,keyout_1,sb,sr,mcl,xor_op;
  wire [127:0] mod_add;
  
  // modified here - CIPHER ROUND ALGORITHM
  GENERATE_KEY t0(clk,ROUND_KEY,IN_KEY,keyout_0);
  GENERATE_KEY t1(clk,ROUND_KEY,keyout_0,keyout_1);
  GENERATE_KEY t2(clk,ROUND_KEY,keyout_1,OUT_KEY);

  SUB_BYTES t3(clk,IN_DATA,sb);
assign xor_op = sb^keyout_0;
  SHIFT_ROWS t4(clk,xor_op,sr);
  MOD_ADDITION t5(.clk(clk), .IN_KEY(keyout_1), .IN_DATA(sr), .MOD_ADD(mod_add));
  MIX_COLUMNS t6(clk,mod_add,mcl);
assign OUT_DATA= OUT_KEY^mcl;

endmodule



