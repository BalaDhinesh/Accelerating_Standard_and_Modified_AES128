module SUB_BYTES(
    input clk,
    input [127:0] IN_DATA,
    input [127:0] IN_KEY,
    output [127:0] SB_DATA
);

reg [127:0] SB_DATA;
wire [127:0] SB_DATA_W;
wire [127:0] XOR_KEY0, XOR_KEY1, XOR_KEY2, XOR_KEY3;
wire [127:0] MODIFIED_IN_DATA;

    assign XOR_KEY0 = IN_KEY[127:120]^IN_KEY[95:88]^IN_KEY[63:56]^IN_KEY[31:24];
    assign XOR_KEY1 = IN_KEY[119:112]^IN_KEY[87:80]^IN_KEY[55:48]^IN_KEY[23:16];
    assign XOR_KEY2 = IN_KEY[111:104]^IN_KEY[79:72]^IN_KEY[47:40]^IN_KEY[15:8];
    assign XOR_KEY3 = IN_KEY[103:96]^IN_KEY[71:64]^IN_KEY[39:32]^IN_KEY[7:0];

    assign MODIFIED_IN_DATA[127:120] = IN_DATA[127:120]^XOR_KEY0;
    assign MODIFIED_IN_DATA[119:112] = IN_DATA[119:112]^XOR_KEY1;
    assign MODIFIED_IN_DATA[111:104] = IN_DATA[111:104]^XOR_KEY2;
    assign MODIFIED_IN_DATA[103:96] = IN_DATA[103:96]^XOR_KEY3;
    assign MODIFIED_IN_DATA[95:88] = IN_DATA[95:88]^XOR_KEY0;
    assign MODIFIED_IN_DATA[87:80] = IN_DATA[87:80]^XOR_KEY1;
    assign MODIFIED_IN_DATA[79:72] = IN_DATA[79:72]^XOR_KEY2;
    assign MODIFIED_IN_DATA[71:64] = IN_DATA[71:64]^XOR_KEY3;
    assign MODIFIED_IN_DATA[63:56] = IN_DATA[63:56]^XOR_KEY0;
    assign MODIFIED_IN_DATA[55:48] = IN_DATA[55:48]^XOR_KEY1;
    assign MODIFIED_IN_DATA[47:40] = IN_DATA[47:40]^XOR_KEY2;
    assign MODIFIED_IN_DATA[39:32] = IN_DATA[39:32]^XOR_KEY3;
    assign MODIFIED_IN_DATA[31:24] = IN_DATA[31:24]^XOR_KEY0;
    assign MODIFIED_IN_DATA[23:16] = IN_DATA[23:16]^XOR_KEY1;
    assign MODIFIED_IN_DATA[15:8] = IN_DATA[15:8]^XOR_KEY2;
    assign MODIFIED_IN_DATA[7:0] = IN_DATA[7:0]^XOR_KEY3;

    FORWARD_SUBSTITUTION_BOX INST0(.clk(clk), .A(MODIFIED_IN_DATA[127:120]), .C(SB_DATA_W[127:120]));
    FORWARD_SUBSTITUTION_BOX INST1(.clk(clk), .A(MODIFIED_IN_DATA[119:112]), .C(SB_DATA_W[119:112]));
    FORWARD_SUBSTITUTION_BOX INST2(.clk(clk), .A(MODIFIED_IN_DATA[111:104]), .C(SB_DATA_W[111:104]));
    FORWARD_SUBSTITUTION_BOX INST3(.clk(clk), .A(MODIFIED_IN_DATA[103:96]), .C(SB_DATA_W[103:96]));
    
    FORWARD_SUBSTITUTION_BOX INST4(.clk(clk), .A(MODIFIED_IN_DATA[95:88]), .C(SB_DATA_W[95:88]));
    FORWARD_SUBSTITUTION_BOX INST5(.clk(clk), .A(MODIFIED_IN_DATA[87:80]), .C(SB_DATA_W[87:80]));
    FORWARD_SUBSTITUTION_BOX INST6(.clk(clk), .A(MODIFIED_IN_DATA[79:72]), .C(SB_DATA_W[79:72]));
    FORWARD_SUBSTITUTION_BOX INST7(.clk(clk), .A(MODIFIED_IN_DATA[71:64]), .C(SB_DATA_W[71:64]));

    FORWARD_SUBSTITUTION_BOX INST8(.clk(clk), .A(MODIFIED_IN_DATA[63:56]), .C(SB_DATA_W[63:56]));
    FORWARD_SUBSTITUTION_BOX INST9(.clk(clk), .A(MODIFIED_IN_DATA[55:48]), .C(SB_DATA_W[55:48]));
    FORWARD_SUBSTITUTION_BOX INST10(.clk(clk), .A(MODIFIED_IN_DATA[47:40]), .C(SB_DATA_W[47:40]));
    FORWARD_SUBSTITUTION_BOX INST11(.clk(clk), .A(MODIFIED_IN_DATA[39:32]), .C(SB_DATA_W[39:32]));
    
    FORWARD_SUBSTITUTION_BOX INST12(.clk(clk), .A(MODIFIED_IN_DATA[31:24]), .C(SB_DATA_W[31:24]));
    FORWARD_SUBSTITUTION_BOX INST13(.clk(clk), .A(MODIFIED_IN_DATA[23:16]), .C(SB_DATA_W[23:16]));
    FORWARD_SUBSTITUTION_BOX INST14(.clk(clk), .A(MODIFIED_IN_DATA[15:8]), .C(SB_DATA_W[15:8]));
    FORWARD_SUBSTITUTION_BOX INST15(.clk(clk), .A(MODIFIED_IN_DATA[7:0]), .C(SB_DATA_W[7:0]));
  
  always @(*) begin
        SB_DATA <= SB_DATA_W;
    end

endmodule
// module SUB_BYTES(clk,inp_data,inp_key,sub_data);

// input clk;
// input [127:0] inp_data,inp_key;
// output reg [127:0] sub_data;

// wire [127:0] sub_data_temp, xor_key0, xor_key1, xor_key2, xor_key3, modified_inp_data;

//     assign xor_key0 = inp_key[127:120]^inp_key[95:88]^inp_key[63:56]^inp_key[31:24];
//     assign xor_key1 = inp_key[119:112]^inp_key[87:80]^inp_key[55:48]^inp_key[23:16];
//     assign xor_key2 = inp_key[111:104]^inp_key[79:72]^inp_key[47:40]^inp_key[15:8];
//     assign xor_key3 = inp_key[103:96]^inp_key[71:64]^inp_key[39:32]^inp_key[7:0];

//     assign modified_inp_data[127:120] = inp_data[127:120]^xor_key0;
//     assign modified_inp_data[119:112] = inp_data[119:112]^xor_key1;
//     assign modified_inp_data[111:104] = inp_data[111:104]^xor_key2;
//     assign modified_inp_data[103:96] = inp_data[103:96]^xor_key3;
//     assign modified_inp_data[95:88] = inp_data[95:88]^xor_key0;
//     assign modified_inp_data[87:80] = inp_data[87:80]^xor_key1;
//     assign modified_inp_data[79:72] = inp_data[79:72]^xor_key2;
//     assign modified_inp_data[71:64] = inp_data[71:64]^xor_key3;
//     assign modified_inp_data[63:56] = inp_data[63:56]^xor_key0;
//     assign modified_inp_data[55:48] = inp_data[55:48]^xor_key1;
//     assign modified_inp_data[47:40] = inp_data[47:40]^xor_key2;
//     assign modified_inp_data[39:32] = inp_data[39:32]^xor_key3;
//     assign modified_inp_data[31:24] = inp_data[31:24]^xor_key0;
//     assign modified_inp_data[23:16] = inp_data[23:16]^xor_key1;
//     assign modified_inp_data[15:8] = inp_data[15:8]^xor_key2;
//     assign modified_inp_data[7:0] = inp_data[7:0]^xor_key3;

//     FORWARD_SUBSTITUTION_BOX s0(.clk(clk), .A(modified_inp_data[127:120]),.C(sub_data_temp[127:120]));
//     FORWARD_SUBSTITUTION_BOX s1(.clk(clk), .A(modified_inp_data[119:112]),.C(sub_data_temp[119:112]));
//     FORWARD_SUBSTITUTION_BOX s2(.clk(clk), .A(modified_inp_data[111:104]),.C(sub_data_temp[111:104]));
//     FORWARD_SUBSTITUTION_BOX s3(.clk(clk), .A(modified_inp_data[103:96]),.C(sub_data_temp[103:96]));

//     FORWARD_SUBSTITUTION_BOX s4(.clk(clk), .A(modified_inp_data[95:88]),.C(sub_data_temp[95:88]));
//     FORWARD_SUBSTITUTION_BOX s5(.clk(clk), .A(modified_inp_data[87:80]),.C(sub_data_temp[87:80]));
//     FORWARD_SUBSTITUTION_BOX s6(.clk(clk), .A(modified_inp_data[79:72]),.C(sub_data_temp[79:72]));
//     FORWARD_SUBSTITUTION_BOX s7(.clk(clk), .A(modified_inp_data[71:64]),.C(sub_data_temp[71:64]));

//     FORWARD_SUBSTITUTION_BOX s8(.clk(clk), .A(modified_inp_data[63:56]),.C(sub_data_temp[63:56]));
//     FORWARD_SUBSTITUTION_BOX s9(.clk(clk), .A(modified_inp_data[55:48]),.C(sub_data_temp[55:48]));
//     FORWARD_SUBSTITUTION_BOX s10(.clk(clk), .A(modified_inp_data[47:40]),.C(sub_data_temp[47:40]));
//     FORWARD_SUBSTITUTION_BOX s11(.clk(clk), .A(modified_inp_data[39:32]),.C(sub_data_temp[39:32]));

//     FORWARD_SUBSTITUTION_BOX s12(.clk(clk), .A(modified_inp_data[31:24]),.C(sub_data_temp[31:24]));
//     FORWARD_SUBSTITUTION_BOX s13(.clk(clk), .A(modified_inp_data[23:16]),.C(sub_data_temp[23:16]));
//     FORWARD_SUBSTITUTION_BOX s14(.clk(clk), .A(modified_inp_data[15:8]),.C(sub_data_temp[15:8]));
//     FORWARD_SUBSTITUTION_BOX s15(.clk(clk), .A(modified_inp_data[7:0]),.C(sub_data_temp[7:0]));

//     always @(posedge clk) begin
//         sub_data <= sub_data_temp;
//     end

// endmodule