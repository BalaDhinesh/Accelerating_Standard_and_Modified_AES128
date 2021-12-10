// Code your testbench here
// or browse Examples

`timescale 1ns / 1ps

 `include "aes_top.v"
 `include "generate_key.v"
 `include "mix_columns.v"
 `include "last_round.v"
 `include "forward_substitution_box.v"
 `include "round_iteration.v"
 `include "shift_rows.v"
 `include "sub_bytes.v"

module testbench;
  reg clk;
  reg reset;

  reg [31:0] inp_data_0;
  reg [31:0] inp_data_1;
  reg [31:0] inp_data_2;
  reg [31:0] inp_data_3;

  reg [31:0] inp_key_0;
  reg [31:0] inp_key_1;
  reg [31:0] inp_key_2;
  reg [31:0] inp_key_3;

  wire [31:0] out_data_0;
  wire [31:0] out_data_1;
  wire [31:0] out_data_2;
  wire [31:0] out_data_3;
  wire [127:0] out_data;

  AES128 AES128_DUT(clk,reset,inp_data_0,inp_data_1,inp_data_2,inp_data_3,inp_key_0,inp_key_1,inp_key_2,inp_key_3,out_data_0,out_data_1,out_data_2,out_data_3);
  initial 
    begin  
      clk = 0;
      reset = 0;
      {inp_data_3,inp_data_2,inp_data_1,inp_data_0} = 128'h4142434445464748494a4b4c4d4e4f43;
      {inp_key_3,inp_key_2,inp_key_1,inp_key_0} = 128'h000102030405060708090a0b0c0d0e0f;
      #300 $display("Encrypted value: %h",{out_data_3,out_data_2,out_data_1,out_data_0});
      
      #100 $finish;
  end
  assign out_data = {out_data_3,out_data_2,out_data_1,out_data_0};
  always #5  clk =  ! clk; 
endmodule
