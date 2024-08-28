`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 10:52:50 PM
// Design Name: 
// Module Name: permutationChoice1
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


module permutationChoice1(
    input logic [63:0] pc1Input,
    output logic [55:0] pc1Output
    );

assign pc1Output[55] = pc1Input[64 - 57];
assign pc1Output[54] = pc1Input[64 - 49];
assign pc1Output[53] = pc1Input[64 - 41];
assign pc1Output[52] = pc1Input[64 - 33];
assign pc1Output[51] = pc1Input[64 - 25];
assign pc1Output[50] = pc1Input[64 - 17];
assign pc1Output[49] = pc1Input[64 - 9];

assign pc1Output[48] = pc1Input[64 - 1];
assign pc1Output[47] = pc1Input[64 - 58];
assign pc1Output[46] = pc1Input[64 - 50];
assign pc1Output[45] = pc1Input[64 - 42];
assign pc1Output[44] = pc1Input[64 - 34];
assign pc1Output[43] = pc1Input[64 - 26];
assign pc1Output[42] = pc1Input[64 - 18];

assign pc1Output[41] = pc1Input[64 - 10];
assign pc1Output[40] = pc1Input[64 - 2];
assign pc1Output[39] = pc1Input[64 - 59];
assign pc1Output[38] = pc1Input[64 - 51];
assign pc1Output[37] = pc1Input[64 - 43];
assign pc1Output[36] = pc1Input[64 - 35];
assign pc1Output[35] = pc1Input[64 - 27];

assign pc1Output[34] = pc1Input[64 - 19];
assign pc1Output[33] = pc1Input[64 - 11];
assign pc1Output[32] = pc1Input[64 - 3];
assign pc1Output[31] = pc1Input[64 - 60];
assign pc1Output[30] = pc1Input[64 - 52];
assign pc1Output[29] = pc1Input[64 - 44];
assign pc1Output[28] = pc1Input[64 - 36];

assign pc1Output[27] = pc1Input[64 - 63];
assign pc1Output[26] = pc1Input[64 - 55];
assign pc1Output[25] = pc1Input[64 - 47];
assign pc1Output[24] = pc1Input[64 - 39];
assign pc1Output[23] = pc1Input[64 - 31];
assign pc1Output[22] = pc1Input[64 - 23];
assign pc1Output[21] = pc1Input[64 - 15];
 
assign pc1Output[20] = pc1Input[64 - 7];
assign pc1Output[19] = pc1Input[64 - 62];
assign pc1Output[18] = pc1Input[64 - 54];
assign pc1Output[17] = pc1Input[64 - 46];
assign pc1Output[16] = pc1Input[64 - 38];
assign pc1Output[15] = pc1Input[64 - 30];
assign pc1Output[14] = pc1Input[64 - 22];

assign pc1Output[13] = pc1Input[64 - 14];
assign pc1Output[12] = pc1Input[64 - 6];
assign pc1Output[11] = pc1Input[64 - 61];
assign pc1Output[10] = pc1Input[64 - 53];
assign pc1Output[9] = pc1Input[64 - 45];
assign pc1Output[8] = pc1Input[64 - 37];
assign pc1Output[7]  = pc1Input[64 - 29];

assign pc1Output[6] = pc1Input[64 - 21];
assign pc1Output[5] = pc1Input[64 - 13];
assign pc1Output[4] = pc1Input[64 - 5];
assign pc1Output[3] = pc1Input[64 - 28];
assign pc1Output[2] = pc1Input[64 - 20];
assign pc1Output[1] = pc1Input[64 - 12];
assign pc1Output[0] = pc1Input[64 - 4];

endmodule
