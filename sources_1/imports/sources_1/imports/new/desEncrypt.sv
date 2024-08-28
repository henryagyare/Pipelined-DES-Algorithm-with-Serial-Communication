`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 08:42:28 PM
// Design Name: 
// Module Name: desEncrypt
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


module desEncrypt(
    input logic [31:0] leftHalf_previous, rightHalf_previous,
    input logic [47:0] generated_key,
    output logic [31:0] roundN_leftHalf, roundN_rightHalf
    );

    logic [47:0] expansion_output;
    expand32to48 expand32to48 (
        .right_half (rightHalf_previous),
        .expantable (expansion_output)
    );
    
    logic [47:0] xor48_output;
    xor48 xor48 (
        .expanded_bits (expansion_output),
        .roundNKey (generated_key),
        .xor48Output (xor48_output)
    );

    logic [31:0] sbox_combine_output;
    S_Box_Combine S_Box_Combine (
        .sboxInput (xor48_output),
        .sboxOutput (sbox_combine_output)
    );

    logic [31:0] permutation_table_output;
    permutationTable permutationTable (
        .p_table_input (sbox_combine_output),
        .p_table_output (permutation_table_output)
    );

    logic [31:0] xor32_output;
    xor32 xor32 (
        .permutationOutput (permutation_table_output),
        .leftHalf (leftHalf_previous),
        .xor32Output (xor32_output)
    );

    assign roundN_rightHalf = xor32_output;
    assign roundN_leftHalf = rightHalf_previous;


endmodule
