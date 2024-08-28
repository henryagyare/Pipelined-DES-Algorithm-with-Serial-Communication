`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 02:28:31 PM
// Design Name: 
// Module Name: keyAlgorithm
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


module keyAlgorithm1(
    input logic [27:0] left_LCS_input,right_LCS_input,
    output logic [27:0] left_LCS_output, right_LCS_output,
    output logic [47:0] roundKey_output
    );

    LCS_by1 leftHalf_LCS (
        .LCS_input (left_LCS_input),
        .LCS_output (left_LCS_output)
    );

    LCS_by1 rightHalf_LCS (
        .LCS_input (right_LCS_input),
        .LCS_output (right_LCS_output)
    );

    logic [47:0] PC2_output;
    permutationChoice2 PC2 (
        .pc2Input ({left_LCS_output, right_LCS_output}),     // this has to be the concatenation of the left and right bit half after left circular shift
        .pc2Output (roundKey_output)
    );

endmodule

