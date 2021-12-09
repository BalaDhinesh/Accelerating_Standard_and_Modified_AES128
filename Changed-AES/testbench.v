`timescale 1ns / 1ps

`include "modified_aes128_v2_top.v"
`include "generate_Key.v"
`include "mix_Columns.v"
`include "last_round.v"
`include "forward_substitution_box.v"
`include "round_iteration.v"
`include "shift_rows.v"
`include "sub_bytes.v"

module testbench;

reg clk;
reg [127:0] inp_data;
reg [127:0] inp_key;
wire [127:0] out_data;

MODIFIED_AES128_V2 MODIFIED_AES128_V2_DUT(
    .clk(clk),
    .IN_DATA(inp_data),
    .IN_KEY(inp_key),
    .OUT_DATA(out_data)
);

initial begin
    clk=0;
    inp_data=128'h4142434445464748494a4b4c4d4e4f54;
    inp_key=128'h000102030405060708090a0b0c0d0e0f;
    //inp_data=128'h54494D47206E616C6F4E20726F6E6F43;
    //inp_key=128'h100F0E0D0C0B0A090807060504030201;
    #5000 $display("Encrypted Value: %h", out_data[127:0]);
    #10 $finish;
end
always #5 clk = !clk;

endmodule