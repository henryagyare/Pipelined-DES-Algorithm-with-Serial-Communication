`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 10:52:50 PM
// Design Name: 
// Module Name: permutationChoice2
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


module permutationChoice2(
    input logic [55:0] pc2Input,
    output logic [47:0] pc2Output
    );

    assign pc2Output[47] = pc2Input[42];
    assign pc2Output[46] = pc2Input[39];
    assign pc2Output[45] = pc2Input[45];
    assign pc2Output[44] = pc2Input[32];
    assign pc2Output[43] = pc2Input[55];
    assign pc2Output[42] = pc2Input[51];

    assign pc2Output[41] = pc2Input[53];
    assign pc2Output[40] = pc2Input[28];
    assign pc2Output[39] = pc2Input[41];
    assign pc2Output[38] = pc2Input[50];
    assign pc2Output[37] = pc2Input[35];
    assign pc2Output[36] = pc2Input[46];

    assign pc2Output[35] = pc2Input[33];
    assign pc2Output[34] = pc2Input[37];
    assign pc2Output[33] = pc2Input[44];
    assign pc2Output[32] = pc2Input[52];
    assign pc2Output[31] = pc2Input[30];
    assign pc2Output[30] = pc2Input[48];

    assign pc2Output[29] = pc2Input[40];
    assign pc2Output[28] = pc2Input[49];
    assign pc2Output[27] = pc2Input[29];
    assign pc2Output[26] = pc2Input[36];
    assign pc2Output[25] = pc2Input[43];
    assign pc2Output[24] = pc2Input[54];    

    assign pc2Output[23] = pc2Input[15];
    assign pc2Output[22] = pc2Input[4];
    assign pc2Output[21] = pc2Input[25];
    assign pc2Output[20] = pc2Input[19];
    assign pc2Output[19] = pc2Input[9];
    assign pc2Output[18] = pc2Input[1];

    assign pc2Output[17] = pc2Input[26];
    assign pc2Output[16] = pc2Input[16];
    assign pc2Output[15] = pc2Input[5];
    assign pc2Output[14] = pc2Input[11];
    assign pc2Output[13] = pc2Input[23];
    assign pc2Output[12] = pc2Input[8];

    assign pc2Output[11] = pc2Input[12];
    assign pc2Output[10] = pc2Input[7];
    assign pc2Output[9] =  pc2Input[17];
    assign pc2Output[8]  = pc2Input[0];
    assign pc2Output[7]  = pc2Input[22];
    assign pc2Output[6]  = pc2Input[3];

    assign pc2Output[5]  = pc2Input[10];
    assign pc2Output[4]  = pc2Input[14];
    assign pc2Output[3]  = pc2Input[6];
    assign pc2Output[2]  = pc2Input[20];
    assign pc2Output[1]  = pc2Input[27];
    assign pc2Output[0]  = pc2Input[24];

endmodule
