module MOD_ADDITION(
  input clk,
  input [127:0] IN_KEY,
  input [127:0] IN_DATA,
  output reg [127:0] MOD_ADD
  );
  integer i;
  always @(posedge clk) begin
    for(i=0; i<16; i=i+1) begin
      MOD_ADD[8*i+:8] = (IN_KEY[8*i+:8] + IN_DATA[8*i+:8])% 256;
  end
  end
endmodule
  