`timescale 1ns / 1ps

`include "top_module.v"
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

AES_128_bit AES_128_bit_inst(
    .clk(clk),
    .inp_data(inp_data),
    .inp_key(inp_key),
    .out_data(out_data)
);

initial begin
    clk=0;
    inp_data=128'h54494D47206E616C6F4E20726F6E6F43;
    inp_key=128'h100F0E0D0C0B0A090807060504030201;
    #290 $display("Encrypted Value: %h", out_data[127:0]);
    #10 $finish;
end
always #5 clk = !clk;

endmodule