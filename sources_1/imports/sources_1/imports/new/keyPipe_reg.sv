`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 09:14:05 AM
// Design Name: 
// Module Name: keyPipe_reg
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


module keyPipe_reg(
    input logic clk, 
    input logic [27:0] key_leftIn, key_rightIn,
    output logic [27:0] key_leftOut, key_rightOut
    );

    always_ff @( posedge clk ) 
    begin
        key_leftOut <= key_leftIn;    
    end

    always_ff @( posedge clk )
    begin
        key_rightOut <= key_rightIn;
    end

endmodule
