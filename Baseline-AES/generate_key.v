module GENERATE_KEY(rc,key,keyout);
   input [3:0] rc;
   input [127:0]key;
   output [127:0] keyout;