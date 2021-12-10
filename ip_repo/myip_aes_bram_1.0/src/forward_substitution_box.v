module FORWARD_SUBSTITUTION_BOX(
  input clk,
  input [7:0] A,
  output [7:0] C
);

reg [7:0] C_REG;

  always @(posedge clk) begin
    case (A)
    8'h00: C_REG <= 8'h63;
    8'h01: C_REG <= 8'h7c;
    8'h02: C_REG <= 8'h77;
    8'h03: C_REG <= 8'h7b;
    8'h04: C_REG <= 8'hf2;
    8'h05: C_REG <= 8'h6b;
    8'h06: C_REG <= 8'h6f;
    8'h07: C_REG <= 8'hc5;
    8'h08: C_REG <= 8'h30;
    8'h09: C_REG <= 8'h01;
    8'h0a: C_REG <= 8'h67;
    8'h0b: C_REG <= 8'h2b;
    8'h0c: C_REG <= 8'hfe;
    8'h0d: C_REG <= 8'hd7;
    8'h0e: C_REG <= 8'hab;
    8'h0f: C_REG <= 8'h76;
    8'h10: C_REG <= 8'hca;
    8'h11: C_REG <= 8'h82;
    8'h12: C_REG <= 8'hc9;
    8'h13: C_REG <= 8'h7d;
    8'h14: C_REG <= 8'hfa;
    8'h15: C_REG <= 8'h59;
    8'h16: C_REG <= 8'h47;
    8'h17: C_REG <= 8'hf0;
    8'h18: C_REG <= 8'had;
    8'h19: C_REG <= 8'hd4;
    8'h1a: C_REG <= 8'ha2;
    8'h1b: C_REG <= 8'haf;
    8'h1c: C_REG <= 8'h9c;
    8'h1d: C_REG <= 8'ha4;
    8'h1e: C_REG <= 8'h72;
    8'h1f: C_REG <= 8'hc0;
    8'h20: C_REG <= 8'hb7;
    8'h21: C_REG <= 8'hfd;
    8'h22: C_REG <= 8'h93;
    8'h23: C_REG <= 8'h26;
    8'h24: C_REG <= 8'h36;
    8'h25: C_REG <= 8'h3f;
    8'h26: C_REG <= 8'hf7;
    8'h27: C_REG <= 8'hcc;
    8'h28: C_REG <= 8'h34;
    8'h29: C_REG <= 8'ha5;
    8'h2a: C_REG <= 8'he5;
    8'h2b: C_REG <= 8'hf1;
    8'h2c: C_REG <= 8'h71;
    8'h2d: C_REG <= 8'hd8;
    8'h2e: C_REG <= 8'h31;
    8'h2f: C_REG <= 8'h15;
    8'h30: C_REG <= 8'h04;
    8'h31: C_REG <= 8'hc7;
    8'h32: C_REG <= 8'h23;
    8'h33: C_REG <= 8'hc3;
    8'h34: C_REG <= 8'h18;
    8'h35: C_REG <= 8'h96;
    8'h36: C_REG <= 8'h05;
    8'h37: C_REG <= 8'h9a;
    8'h38: C_REG <= 8'h07;
    8'h39: C_REG <= 8'h12;
    8'h3a: C_REG <= 8'h80;
    8'h3b: C_REG <= 8'he2;
    8'h3c: C_REG <= 8'heb;
    8'h3d: C_REG <= 8'h27;
    8'h3e: C_REG <= 8'hb2;
    8'h3f: C_REG <= 8'h75;
    8'h40: C_REG <= 8'h09;
    8'h41: C_REG <= 8'h83;
    8'h42: C_REG <= 8'h2c;
    8'h43: C_REG <= 8'h1a;
    8'h44: C_REG <= 8'h1b;
    8'h45: C_REG <= 8'h6e;
    8'h46: C_REG <= 8'h5a;
    8'h47: C_REG <= 8'ha0;
    8'h48: C_REG <= 8'h52;
    8'h49: C_REG <= 8'h3b;
    8'h4a: C_REG <= 8'hd6;
    8'h4b: C_REG <= 8'hb3;
    8'h4c: C_REG <= 8'h29;
    8'h4d: C_REG <= 8'he3;
    8'h4e: C_REG <= 8'h2f;
    8'h4f: C_REG <= 8'h84;
    8'h50: C_REG <= 8'h53;
    8'h51: C_REG <= 8'hd1;
    8'h52: C_REG <= 8'h00;
    8'h53: C_REG <= 8'hed;
    8'h54: C_REG <= 8'h20;
    8'h55: C_REG <= 8'hfc;
    8'h56: C_REG <= 8'hb1;
    8'h57: C_REG <= 8'h5b;
    8'h58: C_REG <= 8'h6a;
    8'h59: C_REG <= 8'hcb;
    8'h5a: C_REG <= 8'hbe;
    8'h5b: C_REG <= 8'h39;
    8'h5c: C_REG <= 8'h4a;
    8'h5d: C_REG <= 8'h4c;
    8'h5e: C_REG <= 8'h58;
    8'h5f: C_REG <= 8'hcf;
    8'h60: C_REG <= 8'hd0;
    8'h61: C_REG <= 8'hef;
    8'h62: C_REG <= 8'haa;
    8'h63: C_REG <= 8'hfb;
    8'h64: C_REG <= 8'h43;
    8'h65: C_REG <= 8'h4d;
    8'h66: C_REG <= 8'h33;
    8'h67: C_REG <= 8'h85;
    8'h68: C_REG <= 8'h45;
    8'h69: C_REG <= 8'hf9;
    8'h6a: C_REG <= 8'h02;
    8'h6b: C_REG <= 8'h7f;
    8'h6c: C_REG <= 8'h50;
    8'h6d: C_REG <= 8'h3c;
    8'h6e: C_REG <= 8'h9f;
    8'h6f: C_REG <= 8'ha8;
    8'h70: C_REG <= 8'h51;
    8'h71: C_REG <= 8'ha3;
    8'h72: C_REG <= 8'h40;
    8'h73: C_REG <= 8'h8f;
    8'h74: C_REG <= 8'h92;
    8'h75: C_REG <= 8'h9d;
    8'h76: C_REG <= 8'h38;
    8'h77: C_REG <= 8'hf5;
    8'h78: C_REG <= 8'hbc;
    8'h79: C_REG <= 8'hb6;
    8'h7a: C_REG <= 8'hda;
    8'h7b: C_REG <= 8'h21;
    8'h7c: C_REG <= 8'h10;
    8'h7d: C_REG <= 8'hff;
    8'h7e: C_REG <= 8'hf3;
    8'h7f: C_REG <= 8'hd2;
    8'h80: C_REG <= 8'hcd;
    8'h81: C_REG <= 8'h0c;
    8'h82: C_REG <= 8'h13;
    8'h83: C_REG <= 8'hec;
    8'h84: C_REG <= 8'h5f;
    8'h85: C_REG <= 8'h97;
    8'h86: C_REG <= 8'h44;
    8'h87: C_REG <= 8'h17;
    8'h88: C_REG <= 8'hc4;
    8'h89: C_REG <= 8'ha7;
    8'h8a: C_REG <= 8'h7e;
    8'h8b: C_REG <= 8'h3d;
    8'h8c: C_REG <= 8'h64;
    8'h8d: C_REG <= 8'h5d;
    8'h8e: C_REG <= 8'h19;
    8'h8f: C_REG <= 8'h73;
    8'h90: C_REG <= 8'h60;
    8'h91: C_REG <= 8'h81;
    8'h92: C_REG <= 8'h4f;
    8'h93: C_REG <= 8'hdc;
    8'h94: C_REG <= 8'h22;
    8'h95: C_REG <= 8'h2a;
    8'h96: C_REG <= 8'h90;
    8'h97: C_REG <= 8'h88;
    8'h98: C_REG <= 8'h46;
    8'h99: C_REG <= 8'hee;
    8'h9a: C_REG <= 8'hb8;
    8'h9b: C_REG <= 8'h14;
    8'h9c: C_REG <= 8'hde;
    8'h9d: C_REG <= 8'h5e;
    8'h9e: C_REG <= 8'h0b;
    8'h9f: C_REG <= 8'hdb;
    8'ha0: C_REG <= 8'he0;
    8'ha1: C_REG <= 8'h32;
    8'ha2: C_REG <= 8'h3a;
    8'ha3: C_REG <= 8'h0a;
    8'ha4: C_REG <= 8'h49;
    8'ha5: C_REG <= 8'h06;
    8'ha6: C_REG <= 8'h24;
    8'ha7: C_REG <= 8'h5c;
    8'ha8: C_REG <= 8'hc2;
    8'ha9: C_REG <= 8'hd3;
    8'haa: C_REG <= 8'hac;
    8'hab: C_REG <= 8'h62;
    8'hac: C_REG <= 8'h91;
    8'had: C_REG <= 8'h95;
    8'hae: C_REG <= 8'he4;
    8'haf: C_REG <= 8'h79;
    8'hb0: C_REG <= 8'he7;
    8'hb1: C_REG <= 8'hc8;
    8'hb2: C_REG <= 8'h37;
    8'hb3: C_REG <= 8'h6d;
    8'hb4: C_REG <= 8'h8d;
    8'hb5: C_REG <= 8'hd5;
    8'hb6: C_REG <= 8'h4e;
    8'hb7: C_REG <= 8'ha9;
    8'hb8: C_REG <= 8'h6c;
    8'hb9: C_REG <= 8'h56;
    8'hba: C_REG <= 8'hf4;
    8'hbb: C_REG <= 8'hea;
    8'hbc: C_REG <= 8'h65;
    8'hbd: C_REG <= 8'h7a;
    8'hbe: C_REG <= 8'hae;
    8'hbf: C_REG <= 8'h08;
    8'hc0: C_REG <= 8'hba;
    8'hc1: C_REG <= 8'h78;
    8'hc2: C_REG <= 8'h25;
    8'hc3: C_REG <= 8'h2e;
    8'hc4: C_REG <= 8'h1c;
    8'hc5: C_REG <= 8'ha6;
    8'hc6: C_REG <= 8'hb4;
    8'hc7: C_REG <= 8'hc6;
    8'hc8: C_REG <= 8'he8;
    8'hc9: C_REG <= 8'hdd;
    8'hca: C_REG <= 8'h74;
    8'hcb: C_REG <= 8'h1f;
    8'hcc: C_REG <= 8'h4b;
    8'hcd: C_REG <= 8'hbd;
    8'hce: C_REG <= 8'h8b;
    8'hcf: C_REG <= 8'h8a;
    8'hd0: C_REG <= 8'h70;
    8'hd1: C_REG <= 8'h3e;
    8'hd2: C_REG <= 8'hb5;
    8'hd3: C_REG <= 8'h66;
    8'hd4: C_REG <= 8'h48;
    8'hd5: C_REG <= 8'h03;
    8'hd6: C_REG <= 8'hf6;
    8'hd7: C_REG <= 8'h0e;
    8'hd8: C_REG <= 8'h61;
    8'hd9: C_REG <= 8'h35;
    8'hda: C_REG <= 8'h57;
    8'hdb: C_REG <= 8'hb9;
    8'hdc: C_REG <= 8'h86;
    8'hdd: C_REG <= 8'hc1;
    8'hde: C_REG <= 8'h1d;
    8'hdf: C_REG <= 8'h9e;
    8'he0: C_REG <= 8'he1;
    8'he1: C_REG <= 8'hf8;
    8'he2: C_REG <= 8'h98;
    8'he3: C_REG <= 8'h11;
    8'he4: C_REG <= 8'h69;
    8'he5: C_REG <= 8'hd9;
    8'he6: C_REG <= 8'h8e;
    8'he7: C_REG <= 8'h94;
    8'he8: C_REG <= 8'h9b;
    8'he9: C_REG <= 8'h1e;
    8'hea: C_REG <= 8'h87;
    8'heb: C_REG <= 8'he9;
    8'hec: C_REG <= 8'hce;
    8'hed: C_REG <= 8'h55;
    8'hee: C_REG <= 8'h28;
    8'hef: C_REG <= 8'hdf;
    8'hf0: C_REG <= 8'h8c;
    8'hf1: C_REG <= 8'ha1;
    8'hf2: C_REG <= 8'h89;
    8'hf3: C_REG <= 8'h0d;
    8'hf4: C_REG <= 8'hbf;
    8'hf5: C_REG <= 8'he6;
    8'hf6: C_REG <= 8'h42;
    8'hf7: C_REG <= 8'h68;
    8'hf8: C_REG <= 8'h41;
    8'hf9: C_REG <= 8'h99;
    8'hfa: C_REG <= 8'h2d;
    8'hfb: C_REG <= 8'h0f;
    8'hfc: C_REG <= 8'hb0;
    8'hfd: C_REG <= 8'h54;
    8'hfe: C_REG <= 8'hbb;
    8'hff: C_REG <= 8'h16;
    endcase
  end

  assign C = C_REG;

endmodule

