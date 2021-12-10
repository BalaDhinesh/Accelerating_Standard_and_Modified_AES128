module MODIFIED_AES128_V1(
    input clk,    
  input [127:0] IN_DATA,
  input [127:0] IN_KEY,
  output [127:0] OUT_DATA
);


wire [127:0] R0_OUT_DATA, R1_OUT_DATA, R2_OUT_DATA, R3_OUT_DATA, R4_OUT_DATA, R5_OUT_DATA, R6_OUT_DATA, R7_OUT_DATA, R8_OUT_DATA, R9_OUT_DATA;
wire [127:0] OUT_KEY1, OUT_KEY2, OUT_KEY3, OUT_KEY4, OUT_KEY5, OUT_KEY6, OUT_KEY7, OUT_KEY8, OUT_KEY9;
  wire [127:0] PERM_KEY, PERM_KEY1;
  
  // modified here - KEY SCHEDULING ALGORITHM
  SUB_BYTES s1(.clk(clk),.IN_DATA(IN_KEY),.SB_DATA(PERM_KEY));	 
  KEY_MODIFY_PART k1(.clk(clk),.IN_KEY(PERM_KEY), .KEY_OUT(PERM_KEY1));
	
  assign R0_OUT_DATA = IN_DATA^PERM_KEY1;

ROUND_ITERATION R1(.clk(clk), 
                    .ROUND_KEY(4'b0000), 
                    .IN_DATA(R0_OUT_DATA), 
                   .IN_KEY(PERM_KEY1),
                    .OUT_KEY(OUT_KEY1),
                    .OUT_DATA(R1_OUT_DATA));

ROUND_ITERATION R2(.clk(clk), 
                    .ROUND_KEY(4'b0001), 
                    .IN_DATA(R1_OUT_DATA),
                    .IN_KEY(OUT_KEY1),
                    .OUT_KEY(OUT_KEY2),
                    .OUT_DATA(R2_OUT_DATA));

ROUND_ITERATION R3(.clk(clk), 
                    .ROUND_KEY(4'b0010), 
                    .IN_DATA(R2_OUT_DATA),
                    .IN_KEY(OUT_KEY2),
                    .OUT_KEY(OUT_KEY3),
                    .OUT_DATA(R3_OUT_DATA));

ROUND_ITERATION R4(.clk(clk), 
                    .ROUND_KEY(4'b0011), 
                    .IN_DATA(R3_OUT_DATA),
                    .IN_KEY(OUT_KEY3),
                    .OUT_KEY(OUT_KEY4),
                    .OUT_DATA(R4_OUT_DATA));

ROUND_ITERATION R5(.clk(clk), 
                    .ROUND_KEY(4'b0100),
                    .IN_DATA(R4_OUT_DATA),
                    .IN_KEY(OUT_KEY4),
                    .OUT_KEY(OUT_KEY5),
                    .OUT_DATA(R5_OUT_DATA));

ROUND_ITERATION R6(.clk(clk), 
                    .ROUND_KEY(4'b0101),
                    .IN_DATA(R5_OUT_DATA),
                    .IN_KEY(OUT_KEY5),
                    .OUT_KEY(OUT_KEY6),
                    .OUT_DATA(R6_OUT_DATA));

ROUND_ITERATION R7(.clk(clk), 
                    .ROUND_KEY(4'b0110),
                    .IN_DATA(R6_OUT_DATA),
                    .IN_KEY(OUT_KEY6),
                    .OUT_KEY(OUT_KEY7),
                    .OUT_DATA(R7_OUT_DATA));

ROUND_ITERATION R8(.clk(clk), 
                    .ROUND_KEY(4'b0111),
                    .IN_DATA(R7_OUT_DATA),
                    .IN_KEY(OUT_KEY7),
                    .OUT_KEY(OUT_KEY8),
                    .OUT_DATA(R8_OUT_DATA));

ROUND_ITERATION R9(.clk(clk), 
                    .ROUND_KEY(4'b1000),
                    .IN_DATA(R8_OUT_DATA),
                    .IN_KEY(OUT_KEY8),
                    .OUT_KEY(OUT_KEY9),
                    .OUT_DATA(R9_OUT_DATA));

LAST_ROUND R10(.clk(clk), 
                .ROUND_KEY(4'b1001),
                .IN_DATA(R9_OUT_DATA),
                .IN_KEY(OUT_KEY9),
                .OUT_DATA(OUT_DATA));

endmodule
