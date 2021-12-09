module MIX_COLUMNS(clk,inp_data,mixed_data);

input clk;
input [127:0] inp_data;
output [127:0] mixed_data;

wire [31:0] temp1,temp2,temp3,temp4;
wire [31:0] temp_out1, temp_out2, temp_out3, temp_out4;

assign temp1 = inp_data[127:96];
assign temp2 = inp_data[95:64];
assign temp3 = inp_data[63:32];
assign temp4 = inp_data[31:0];

MULTIPLY_MIX m1 (clk,temp1,temp_out1);
MULTIPLY_MIX m2 (clk,temp2,temp_out2);
MULTIPLY_MIX m3 (clk,temp3,temp_out3);
MULTIPLY_MIX m4 (clk,temp4,temp_out4);

assign mixed_data = {temp_out1,temp_out2,temp_out3,temp_out4};

endmodule

module MULT_2x(clk,inp_data,out_data);
input clk;
input[7:0] inp_data;

output reg [7:0] out_data;
 
always @(posedge clk) begin
    out_data <= {inp_data[6:0],1'b0} ^ (8'h1b & {8{inp_data[7]}});
end

endmodule

module MULT_3x(clk,inp_data,out_data);
input clk;
input [7:0]inp_data;
output [7:0] out_data;
wire [7:0] temp;

MULT_2x m1(clk,inp_data,temp);

assign out_data = temp^inp_data;
endmodule

module MULTIPLY_MIX(clk,inp_data,out_data);
input clk;
input [31:0] inp_data;
output [31:0] out_data;

wire [7:0] temp1,temp2,temp3,temp4;
wire [7:0] mixed_data0,mixed_data1,mixed_data2,mixed_data3;
wire [7:0] m2_temp_out1,m2_temp_out2,m2_temp_out3,m2_temp_out4;
wire [7:0] m3_temp_out1,m3_temp_out2,m3_temp_out3,m3_temp_out4;

assign temp1=inp_data[31:24];
assign temp2=inp_data[23:16];
assign temp3=inp_data[15:8];
assign temp4=inp_data[7:0];

MULT_2x m1(clk,temp1,m2_temp_out1);
MULT_2x m2(clk,temp2,m2_temp_out2);
MULT_2x m3(clk,temp3,m2_temp_out3);
MULT_2x m4(clk,temp4,m2_temp_out4);

MULT_3x m5(clk,temp1,m3_temp_out1);
MULT_3x m6(clk,temp2,m3_temp_out2);
MULT_3x m7(clk,temp3,m3_temp_out3);
MULT_3x m8(clk,temp4,m3_temp_out4);

assign mixed_data0 = m2_temp_out1 ^m3_temp_out2^temp3^temp4;
assign mixed_data1 = temp1 ^m2_temp_out2 ^m3_temp_out3 ^ temp4;
assign mixed_data2 = temp1^temp2 ^ m2_temp_out3 ^m3_temp_out4;
assign mixed_data3 = m3_temp_out1 ^temp2^temp3^m2_temp_out4;

assign out_data = {mixed_data0,mixed_data1,mixed_data2,mixed_data3};
endmodule