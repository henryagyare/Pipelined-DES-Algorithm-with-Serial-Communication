`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 10:26:10 PM
// Design Name: 
// Module Name: xor32
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


module xor32(
    input logic [31:0] permutationOutput, leftHalf,
    output logic [31:0] xor32Output
    );
    assign xor32Output = (~permutationOutput & leftHalf) | (permutationOutput & ~leftHalf);
endmodule
