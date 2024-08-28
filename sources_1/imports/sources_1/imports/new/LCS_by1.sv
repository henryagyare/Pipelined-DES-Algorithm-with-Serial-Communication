`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 11:01:49 PM
// Design Name: 
// Module Name: left_circular_shift
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


module LCS_by1(
    input logic [27:0] LCS_input,
    output logic [27:0] LCS_output
    );

    // Perform left circular shift by 1
    always_comb 
    begin
        LCS_output = {LCS_input[26:0], LCS_input[27]};
    end

endmodule

