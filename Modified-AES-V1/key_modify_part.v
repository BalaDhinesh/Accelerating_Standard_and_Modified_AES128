module KEY_MODIFY_PART(
  input clk,
  input [127:0] IN_KEY,
  output [127:0] KEY_OUT
);
  wire [127:0] perm_key;
  wire [31:0] w0_tmp,w1_tmp,w2_tmp,w3_tmp,w0,w1,w2,w3;

  assign w0_tmp = IN_KEY[127:96];
  assign w1_tmp = IN_KEY[95:64];
  assign w2_tmp = IN_KEY[63:32];
  assign w3_tmp = IN_KEY[31:0];
  assign w0 = w0_tmp ^ RCON((w0_tmp[31:24] + 3)%32); 
  assign w1 = w1_tmp ^ RCON((w1_tmp[31:24] + 5)%32); 
  assign w2 = w2_tmp ^ RCON((w2_tmp[31:24] + 7)%32); 
  assign w3 = w3_tmp ^ RCON((w3_tmp[31:24] + 9)%32); 
  assign KEY_OUT = {w0,w1,w2,w3};
  function [31:0] RCON;
        input [3:0] ROUND_KEY;
        case (ROUND_KEY)
            4'h0: RCON = 32'h01_00_00_00;
            4'h1: RCON = 32'h02_00_00_00;
            4'h2: RCON = 32'h04_00_00_00;
            4'h3: RCON = 32'h08_00_00_00;
            4'h4: RCON = 32'h10_00_00_00;
            4'h5: RCON = 32'h20_00_00_00;
            4'h6: RCON = 32'h40_00_00_00;
            4'h7: RCON = 32'h80_00_00_00;
            4'h8: RCON = 32'h1b_00_00_00;
            4'h9: RCON = 32'h36_00_00_00;
            default: RCON = 32'h00_00_00_00;
        endcase
    endfunction
endmodule