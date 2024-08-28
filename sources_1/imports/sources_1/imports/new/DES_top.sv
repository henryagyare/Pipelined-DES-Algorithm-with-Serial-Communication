`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2024 07:03:54 PM
// Design Name: 
// Module Name: DES_top
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


module DES_top #(
    parameter fifo_depth = 4,
    parameter fifo_width = 64)
    (
    input logic write_clock, write_enable, read_enable, reset, read_clock, des_clock,
    input logic [fifo_width - 1:0] write_data,
    input logic [63:0] keyValue,
    output logic [63:0] ciphertext,
    output logic buffer_full, buffer_empty
    );

    logic [63:0] read_data_value;
    fifo_implementation fifo_implementation(
        .write_clock(write_clock), 
        .read_clock(read_clock),
        .write_enable(write_enable), 
        .read_enable(read_enable), 
        .reset(reset), 
        .write_data(write_data),
        .empty(buffer_empty), 
        .full(buffer_full),
        .read_data(read_data_value)
        );

    DES_Algo DES_Algo(
        .plaintext(read_data_value),
        .keyInput(keyValue),
        .clk(des_clock),
        .ciphertext(ciphertext)
    );


endmodule
