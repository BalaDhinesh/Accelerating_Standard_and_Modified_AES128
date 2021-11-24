module GENERATE_KEY(rc,keyin,keyout);
    input [3:0] rc; // Round-Code
    input [127:0]keyin; // 128-bit Input Key
    output [127:0] keyout; // 128-bit Output Key
    wire [31:0] w0,w1,w2,w3,temp; // Wires for intermediate connections

    assign w0 = keyin[127:96];
    assign w1 = keyin[95:64];
    assign w2 = keyin[63:32];
    assign w3 = keyin[31:0];
    
