module SHIFT_ROWS(
  input clk,
  input [127:0] IN_DATA,
  output [127:0] SHIFT_DATA
);

reg [127:0] SHIFT_DATA_REG = 128'b0;

  always @(*) begin
      SHIFT_DATA_REG[127:120] = IN_DATA[127:120];  
      SHIFT_DATA_REG[119:112] = IN_DATA[87:80];
      SHIFT_DATA_REG[111:104] = IN_DATA[47:40];
      SHIFT_DATA_REG[103:96] = IN_DATA[7:0];

      SHIFT_DATA_REG[95:88] = IN_DATA[95:88];
      SHIFT_DATA_REG[87:80] = IN_DATA[55:48];
      SHIFT_DATA_REG[79:72] = IN_DATA[15:8];
      SHIFT_DATA_REG[71:64] = IN_DATA[103:96];

      SHIFT_DATA_REG[63:56] = IN_DATA[63:56];
      SHIFT_DATA_REG[55:48] = IN_DATA[23:16];
      SHIFT_DATA_REG[47:40] = IN_DATA[111:104];
      SHIFT_DATA_REG[39:32] = IN_DATA[71:64];

      SHIFT_DATA_REG[31:24] = IN_DATA[31:24];
      SHIFT_DATA_REG[23:16] = IN_DATA[119:112];
      SHIFT_DATA_REG[15:8] = IN_DATA[79:72];
      SHIFT_DATA_REG[7:0] = IN_DATA[39:32]; 
    end

    assign SHIFT_DATA = SHIFT_DATA_REG;

endmodule

// module SHIFT_ROWS(clk,inp_data,inp_key,shift_data);

// input clk;
// input [127:0] inp_data,inp_key;
// output reg [127:0] shift_data;

// wire [2:0] rank_number0, rank_number1, rank_number2, rank_number3;
// wire [7:0] temp00, temp01, temp02, temp03;
// wire [7:0] temp10, temp11, temp12, temp13;
// wire [7:0] temp20, temp21, temp22, temp23;
// wire [7:0] temp30, temp31, temp32, temp33;

//RANK_NUMBER_GEN r1(clk,inp_data,inp_key,rank_number0, rank_number1, rank_number2, rank_number3);
  // assign rank_value[0] = (inp_data[127:120]^inp_key[127:120])^(inp_data[95:88]^inp_key[95:88])^(inp_data[63:56]^inp_key[63:56])^(inp_data[31:24]^inp_key[31:24]);
  // assign rank_value[1] = (inp_data[119:112]^inp_key[119:112])^(inp_data[87:80]^inp_key[87:80])^(inp_data[55:48]^inp_key[55:48])^(inp_data[23:16]^inp_key[23:16]);
  // assign rank_value[2] = (inp_data[111:104]^inp_key[111:104])^(inp_data[79:72]^inp_key[79:72])^(inp_data[47:40]^inp_key[47:40])^(inp_data[15:8]^inp_key[15:8]);
  // assign rank_value[3] = (inp_data[103:96]^inp_key[103:96])^(inp_data[71:64]^inp_key[71:64])^(inp_data[39:32]^inp_key[39:32])^(inp_data[7:0]^inp_key[7:0]);

  // assign rank_number0 = ((rank_value[0]>rank_value[1])&&(rank_value[0]>rank_value[2])&&(rank_value[0]>rank_value[3]))?4'h3:
  //                       (((rank_value[0]>rank_value[1])&&(rank_value[0]>rank_value[2]))||((rank_value[0]>rank_value[2])&&(rank_value[0]>rank_value[3]))||((rank_value[0]>rank_value[3])&&(rank_value[0]>rank_value[1])))?4'h2:
  //                       ((rank_value[0]>rank_value[1])||(rank_value[0]>rank_value[2])||(rank_value[0]>rank_value[3]))?4'h1:4'h0;
  
  // assign rank_number1 = ((rank_value[1]>rank_value[0])&&(rank_value[1]>rank_value[2])&&(rank_value[1]>rank_value[3]))?4'h3:
  //                       (((rank_value[1]>rank_value[0])&&(rank_value[1]>rank_value[2]))||((rank_value[1]>rank_value[2])&&(rank_value[1]>rank_value[3]))||((rank_value[1]>rank_value[3])&&(rank_value[1]>rank_value[0])))?4'h2:
  //                       ((rank_value[1]>rank_value[0])||(rank_value[1]>rank_value[2])||(rank_value[1]>rank_value[3]))?4'h1:4'h0;

  // assign rank_number2 = ((rank_value[2]>rank_value[1])&&(rank_value[2]>rank_value[0])&&(rank_value[2]>rank_value[3]))?4'h3:
  //                       (((rank_value[2]>rank_value[1])&&(rank_value[2]>rank_value[0]))||((rank_value[2]>rank_value[0])&&(rank_value[2]>rank_value[3]))||((rank_value[2]>rank_value[3])&&(rank_value[2]>rank_value[1])))?4'h2:
  //                       ((rank_value[2]>rank_value[1])||(rank_value[2]>rank_value[0])||(rank_value[2]>rank_value[3]))?4'h1:4'h0;
  
  // assign rank_number3 = ((rank_value[3]>rank_value[1])&&(rank_value[3]>rank_value[2])&&(rank_value[3]>rank_value[0]))?4'h3:
  //                       (((rank_value[3]>rank_value[1])&&(rank_value[3]>rank_value[2]))||((rank_value[3]>rank_value[2])&&(rank_value[3]>rank_value[0]))||((rank_value[3]>rank_value[0])&&(rank_value[3]>rank_value[1])))?4'h2:
  //                       ((rank_value[3]>rank_value[1])||(rank_value[3]>rank_value[2])||(rank_value[3]>rank_value[0]))?4'h1:4'h0;

  // assign temp00 = (rank_number0*32+127)%128;
  // assign temp01 = (rank_number1*32+95)%128;
  // assign temp02 = (rank_number2*32+63)%128;
  // assign temp03 = (rank_number3*32+31)%128;

  // assign temp10 = (rank_number0*32+119)%128;
  // assign temp11 = (rank_number1*32+87)%128;
  // assign temp12 = (rank_number2*32+55)%128;
  // assign temp13 = (rank_number3*32+23)%128;

  // assign temp20 = (rank_number0*32+111)%128; 
  // assign temp21 = (rank_number1*32+79)%128;
  // assign temp22 = (rank_number2*32+47)%128;
  // assign temp23 = (rank_number3*32+15)%128;

  // assign temp30 = (rank_number0*32+103)%128;
  // assign temp31 = (rank_number1*32+71)%128;
  // assign temp32 = (rank_number2*32+39)%128;
  // assign temp33 = (rank_number3*32+7)%128;

      // always @(posedge clk) begin
      
      // shift_data[127:120] = inp_data[127:120];  
      // shift_data[119:112] = inp_data[87:80];
      // shift_data[111:104] = inp_data[47:40];
      // shift_data[103:96] = inp_data[7:0];

      // shift_data[95:88] = inp_data[95:88];
      // shift_data[87:80] = inp_data[55:48];
      // shift_data[79:72] = inp_data[15:8];
      // shift_data[71:64] = inp_data[103:96];

      // shift_data[63:56] = inp_data[63:56];
      // shift_data[55:48] = inp_data[23:16];
      // shift_data[47:40] = inp_data[111:104];
      // shift_data[39:32] = inp_data[71:64];

      // shift_data[31:24] = inp_data[31:24];
      // shift_data[23:16] = inp_data[119:112];
      // shift_data[15:8] = inp_data[79:72];
      // shift_data[7:0] = inp_data[39:32]; 

      // shift_data[127:120] <= inp_data[temp00+:8];
      // shift_data[119:112] <= inp_data[temp10+:8];
      // shift_data[111:104] <= inp_data[temp20+:8];
      // shift_data[103:96] <= inp_data[temp30+:8];

      // shift_data[95:88] <= inp_data[temp01+:8];
      // shift_data[87:80] <= inp_data[temp11+:8];
      // shift_data[79:72] <= inp_data[temp21+:8];
      // shift_data[71:64] <= inp_data[temp31+:8];

      // shift_data[63:56] <= inp_data[temp02+:8];
      // shift_data[55:48] <= inp_data[temp12+:8];
      // shift_data[47:40] <= inp_data[temp22+:8];
      // shift_data[39:32] <= inp_data[temp32+:8];

      // shift_data[31:24] <= inp_data[temp03+:8];
      // shift_data[23:16] <= inp_data[temp13+:8];
      // shift_data[15:8] <= inp_data[temp23+:8];
      // shift_data[7:0] <= inp_data[temp33+:8];
      //$display("Rank_value %h %h %h %h",rank_value[0],rank_value[1],rank_value[2],rank_value[3]);
      //$display("Rank Number %h %h %h %h",rank_number0,rank_number1,rank_number2,rank_number3);
//     end
// endmodule