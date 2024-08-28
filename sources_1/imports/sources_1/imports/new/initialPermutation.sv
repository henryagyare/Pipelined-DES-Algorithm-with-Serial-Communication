`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2024 10:58:26 AM
// Design Name: 
// Module Name: initialPermutation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module initialPermutation(
input logic [63:0] plaintext,
output logic [63:0] initialPerm
   );

assign initialPerm[63] = plaintext[64 - 58];
assign initialPerm[62] = plaintext[64 - 50];
assign initialPerm[61] = plaintext[64 - 42];
assign initialPerm[60] = plaintext[64 - 34];
assign initialPerm[59] = plaintext[64 - 26];
assign initialPerm[58] = plaintext[64 - 18];
assign initialPerm[57] = plaintext[64 - 10];
assign initialPerm[56] = plaintext[64 - 2] ;

assign initialPerm[55] = plaintext[64 - 60];
assign initialPerm[54] = plaintext[64 - 52];
assign initialPerm[53] = plaintext[64 - 44];
assign initialPerm[52] = plaintext[64 - 36];
assign initialPerm[51] = plaintext[64 - 28];
assign initialPerm[50] = plaintext[64 - 20];
assign initialPerm[49] = plaintext[64 - 12];
assign initialPerm[48] = plaintext[64 - 4] ;

assign initialPerm[47] = plaintext[64 - 62];
assign initialPerm[46] = plaintext[64 - 54];
assign initialPerm[45] = plaintext[64 - 46];
assign initialPerm[44] = plaintext[64 - 38];
assign initialPerm[43] = plaintext[64 - 30];
assign initialPerm[42] = plaintext[64 - 22];
assign initialPerm[41] = plaintext[64 - 14];
assign initialPerm[40] = plaintext[64 - 6] ;

assign initialPerm[39] = plaintext[64 - 64];
assign initialPerm[38] = plaintext[64 - 56];
assign initialPerm[37] = plaintext[64 - 48];
assign initialPerm[36] = plaintext[64 - 40];
assign initialPerm[35] = plaintext[64 - 32];
assign initialPerm[34] = plaintext[64 - 24];
assign initialPerm[33] = plaintext[64 - 16];
assign initialPerm[32] = plaintext[64 - 8] ;

assign initialPerm[31] = plaintext[64 - 57];
assign initialPerm[30] = plaintext[64 - 49];
assign initialPerm[29] = plaintext[64 - 41];
assign initialPerm[28] = plaintext[64 - 33];
assign initialPerm[27] = plaintext[64 - 25];
assign initialPerm[26] = plaintext[64 - 17];
assign initialPerm[25] = plaintext[64 - 9] ;
assign initialPerm[24] = plaintext[64 - 1] ;

assign initialPerm[23] = plaintext[64 - 59];
assign initialPerm[22] = plaintext[64 - 51];
assign initialPerm[21] = plaintext[64 - 43];
assign initialPerm[20] = plaintext[64 - 35];
assign initialPerm[19] = plaintext[64 - 27];
assign initialPerm[18] = plaintext[64 - 19];
assign initialPerm[17] = plaintext[64 - 11];
assign initialPerm[16] = plaintext[64 - 3];

assign initialPerm[15] = plaintext[64 - 61];
assign initialPerm[14] = plaintext[64 - 53];
assign initialPerm[13] = plaintext[64 - 45];
assign initialPerm[12] = plaintext[64 - 37];
assign initialPerm[11] = plaintext[64 - 29];
assign initialPerm[10] = plaintext[64 - 21];
assign initialPerm[9] = plaintext[64 - 13];
assign initialPerm[8] = plaintext[64 - 5];

assign initialPerm[7] = plaintext[64 - 63];
assign initialPerm[6] = plaintext[64 - 55];
assign initialPerm[5] = plaintext[64 - 47];
assign initialPerm[4] = plaintext[64 - 39];
assign initialPerm[3] = plaintext[64 - 31];
assign initialPerm[2] = plaintext[64 - 23];
assign initialPerm[1] = plaintext[64 - 15];
assign initialPerm[0] = plaintext[64 - 7];


endmodule
