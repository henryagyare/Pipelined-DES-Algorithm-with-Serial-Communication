`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 10:26:10 PM
// Design Name: 
// Module Name: inversePermutation
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


module inversePermutation(
    input logic [31:0] inversePerm_leftInput, inversePerm_rightInput,
    output logic [63:0] inversePerm_output
    );
    
    logic [63:0] combinedInput;
    assign combinedInput = {inversePerm_leftInput, inversePerm_rightInput};

    assign inversePerm_output[63] =
    combinedInput[64-40];
    assign inversePerm_output[62] =
    combinedInput[64-8];
    assign inversePerm_output[61] =
    combinedInput[64-48];
    assign inversePerm_output[60] =
    combinedInput[64-16];
    assign inversePerm_output[59] =
    combinedInput[64-56];
    assign inversePerm_output[58] =
    combinedInput[64-24];
    assign inversePerm_output[57] =
    combinedInput[64-64];
    assign inversePerm_output[56] =
    combinedInput[64-32];
    assign inversePerm_output[55] =
    combinedInput[64-39];
    assign inversePerm_output[54] =
    combinedInput[64-7];
    assign inversePerm_output[53] =
    combinedInput[64-47];
    assign inversePerm_output[52] =
    combinedInput[64-15];
    assign inversePerm_output[51] =
    combinedInput[64-55];
    assign inversePerm_output[50] =
    combinedInput[64-23];
    assign inversePerm_output[49] =
    combinedInput[64-63];
    assign inversePerm_output[48] =
    combinedInput[64-31];
    assign inversePerm_output[47] =
    combinedInput[64-38];
    assign inversePerm_output[46] =
    combinedInput[64-6];
    assign inversePerm_output[45] =
    combinedInput[64-46];
    assign inversePerm_output[44] =
    combinedInput[64-14];
    assign inversePerm_output[43] =
    combinedInput[64-54];
    assign inversePerm_output[42] =
    combinedInput[64-22];
    assign inversePerm_output[41] =
    combinedInput[64-62];
    assign inversePerm_output[40] =
    combinedInput[64-30];
    assign inversePerm_output[39] =
    combinedInput[64-37];
    assign inversePerm_output[38] =
    combinedInput[64-5];
    assign inversePerm_output[37] =
    combinedInput[64-45];
    assign inversePerm_output[36] =
    combinedInput[64-13];
    assign inversePerm_output[35] =
    combinedInput[64-53];
    assign inversePerm_output[34] =
    combinedInput[64-21];
    assign inversePerm_output[33] =
    combinedInput[64-61];
    assign inversePerm_output[32] =
    combinedInput[64-29];
    assign inversePerm_output[31] =
    combinedInput[64-36];
    assign inversePerm_output[30] =
    combinedInput[64-4];
    assign inversePerm_output[29] =
    combinedInput[64-44];
    assign inversePerm_output[28] =
    combinedInput[64-12];
    assign inversePerm_output[27] =
    combinedInput[64-52];
    assign inversePerm_output[26] =
    combinedInput[64-20];
    assign inversePerm_output[25] =
    combinedInput[64-60];
    assign inversePerm_output[24] =
    combinedInput[64-28];
    assign inversePerm_output[23] =
    combinedInput[64-35];
    assign inversePerm_output[22] =
    combinedInput[64-3];
    assign inversePerm_output[21] =
    combinedInput[64-43];
    assign inversePerm_output[20] =
    combinedInput[64-11];
    assign inversePerm_output[19] =
    combinedInput[64-51];
    assign inversePerm_output[18] =
    combinedInput[64-19];
    assign inversePerm_output[17] =
    combinedInput[64-59];
    assign inversePerm_output[16] =
    combinedInput[64-27];
    assign inversePerm_output[15] =
    combinedInput[64-34];
    assign inversePerm_output[14] =
    combinedInput[64-2];
    assign inversePerm_output[13] =
    combinedInput[64-42];
    assign inversePerm_output[12] =
    combinedInput[64-10];
    assign inversePerm_output[11] =
    combinedInput[64-50];
    assign inversePerm_output[10] =
    combinedInput[64-18];
    assign inversePerm_output[9] =
    combinedInput[64-58];
    assign inversePerm_output[8] =
    combinedInput[64-26];
    assign inversePerm_output[7] =
    combinedInput[64-33];
    assign inversePerm_output[6] =
    combinedInput[64-1];
    assign inversePerm_output[5] =
    combinedInput[64-41];
    assign inversePerm_output[4] =
    combinedInput[64-9];
    assign inversePerm_output[3] =
    combinedInput[64-49];
    assign inversePerm_output[2] =
    combinedInput[64-17];
    assign inversePerm_output[1] =
    combinedInput[64-57];
    assign inversePerm_output[0] =
    combinedInput[64-25];



endmodule
