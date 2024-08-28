`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 10:26:10 PM
// Design Name: 
// Module Name: xor48
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


module xor48(
    input logic [47:0] expanded_bits, roundNKey,
    output logic [47:0] xor48Output
    );
    assign xor48Output = (~expanded_bits & roundNKey) | (expanded_bits & ~roundNKey);
    
endmodule
