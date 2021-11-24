module GENERATE_KEY(rc,key,keyout);
    input [3:0] rc; // rc number
    input [127:0]key; // 128-bit Input Key
    output [127:0] keyout; // 128-bit Output Key
    wire [31:0] w0,w1,w2,w3,temp; // Wires for intermediate connections

    assign w0 = key[127:96];
    assign w1 = key[95:64];
    assign w2 = key[63:32];
    assign w3 = key[31:0];

    assign keyout[127:96] = w0^temp^rcon(rc);
    assign keyout[95:64] = w0^temp^rcon(rc)^w1;
    assign keyout[63:32] = w0^temp^rcon(rc)^w1^w2;
    assign keyout[31:0] = w0^temp^rcon(rc)^w1^w2^w3;

    FORWARD_SUBSTITUTION_BOX s0(.a(w3[23:16]),.c(temp[31:24]));
    FORWARD_SUBSTITUTION_BOX s1(.a(w3[15:8]),.c(temp[23:16]));
    FORWARD_SUBSTITUTION_BOX s2(.a(w3[7:0]),.c(temp[15:8]));
    FORWARD_SUBSTITUTION_BOX s3(.a(w2[31:24]),.c(temp[7:0]));

    function [31:0] rcon;
        input [3:0] rc;
        case (rc)
            4'h0: rcon = 32'h01_00_00_00;
            4'h1: rcon = 32'h02_00_00_00;
            4'h2: rcon = 32'h04_00_00_00;
            4'h3: rcon = 32'h08_00_00_00;
            4'h4: rcon = 32'h10_00_00_00;
            4'h5: rcon = 32'h20_00_00_00;
            4'h6: rcon = 32'h40_00_00_00;
            4'h7: rcon = 32'h80_00_00_00;
            4'h8: rcon = 32'h1b_00_00_00;
            4'h9: rcon = 32'h36_00_00_00;
            default: rcon = 32'h00_00_00_00;
        endcase
    endfunction
endmodule
    
