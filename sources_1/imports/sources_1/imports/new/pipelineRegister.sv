`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 03:15:00 PM
// Design Name: 
// Module Name: pipelineRegister
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


module pipelineRegister(
    input logic clk,
    input logic [31:0] leftIn, rightIn,
    output logic [31:0] leftOut, rightOut
    );
    
    always_ff @(posedge clk) 
    begin
        leftOut <= leftIn;
    end

    always_ff @(posedge clk)
    begin
        rightOut <= rightIn;
    end

    
endmodule
