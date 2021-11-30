module GENERATE_KEY(clk,round,inp_key,out_key);
    input clk;
    input [3:0] round; // Round number
    input [127:0]inp_key; // 128-bit Input Key
    output [127:0] out_key; // 128-bit Output Key
    wire [31:0] w0,w1,w2,w3,temp; // Wires for intermediate connections

    assign w0 = inp_key[31:0];
    assign w1 = inp_key[63:32];
    assign w2 = inp_key[95:64];
    assign w3 = inp_key[127:96];

    assign out_key[127:96] = w0^temp^round_constant(round);
    assign out_key[95:64] = w0^temp^round_constant(round)^w1;
    assign out_key[63:32] = w0^temp^round_constant(round)^w1^w2;
    assign out_key[31:0] = w0^temp^round_constant(round)^w1^w2^w3;

    BACKWARD_SUBSTITUTION_BOX s0(.a(w3[23:16]),.c(temp[15:8]));
    BACKWARD_SUBSTITUTION_BOX s1(.a(w3[15:8]),.c(temp[7:0]));
    BACKWARD_SUBSTITUTION_BOX s2(.a(w3[7:0]),.c(temp[31:24]));
    BACKWARD_SUBSTITUTION_BOX s3(.a(w3[31:24]),.c(temp[23:16]));

    function [31:0] round_constant;
        input [3:0] round;
        case (round)
            4'h0: round_constant = 32'h01_00_00_00;
            4'h1: round_constant = 32'h02_00_00_00;
            4'h2: round_constant = 32'h04_00_00_00;
            4'h3: round_constant = 32'h08_00_00_00;
            4'h4: round_constant = 32'h10_00_00_00;
            4'h5: round_constant = 32'h20_00_00_00;
            4'h6: round_constant = 32'h40_00_00_00;
            4'h7: round_constant = 32'h80_00_00_00;
            4'h8: round_constant = 32'h1b_00_00_00;
            4'h9: round_constant = 32'h36_00_00_00;
            default: round_constant = 32'h00_00_00_00;
        endcase
    endfunction
endmodule
    
