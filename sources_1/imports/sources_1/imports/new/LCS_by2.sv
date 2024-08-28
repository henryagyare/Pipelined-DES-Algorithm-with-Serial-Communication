`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 07:12:38 AM
// Design Name: 
// Module Name: LCS_by2
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


module LCS_by2(
    input logic [27:0] LCS_input,
    output logic [27:0] LCS_output
    );

    // Perform left circular shift by 2
    always_comb begin
        LCS_output = {LCS_input[25:0], LCS_input[27:26]};
    end

endmodule
