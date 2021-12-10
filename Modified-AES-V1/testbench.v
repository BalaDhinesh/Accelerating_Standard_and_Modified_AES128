// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

  `include "MODIFIED_AES128_V1_top.v"
  `include "Generate_Key.v"
  `include "Mix_Column.v"
  `include "Round_Last.v"
  `include "forward_substitution_box.v"
  `include "Round.v"
  `include "Shift_Row.v"
  `include "Sub_Bytes.v"
  `include "mod_addition.v"
  `include "key_modify_part.v"


module testbench;
  reg clk;
  reg [127:0] datain;
  reg [127:0] key;
  wire [127:0] dataout;
  
  MODIFIED_AES_V1 AES128_DUT(clk,datain,key,dataout);
  initial 
    begin  
      clk = 0;
      datain = 128'h4142434445464748494a4b4c4d4e4f54;
      key = 128'h000102030405060708090a0b0c0d0e0f;
      #500 $display("Encrypted value: %h",dataout[127:0]);
      $dumpfile("dump.vcd"); $dumpvars;
      #100 $finish;
  end
  always #5  clk =  ! clk; 
endmodule
