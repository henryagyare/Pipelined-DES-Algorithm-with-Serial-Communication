`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
    // Company: 
    // Engineer: 
    // 
    // Create Date: 07/30/2024 05:00:27 PM
    // Design Name: 
    // Module Name: uart2_top
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


module uart2_top(
    input logic clock, reset, fsm_start,
    input logic [63:0] data_in,
    // input logic tx_start,
    // input logic [7:0] tx_in, 
    output logic data_ready, 
    output logic [63:0] data_out
    );


    logic [7:0] fsm_out_tx_in;
    logic tx_out;
    logic tx_done;
    logic uart_tx_start_sig;
    uart2_tx uart2_tx (
        .clock(clock), 
        .reset(reset),
        .tx_in(fsm_out_tx_in),
        .tx_start(uart_tx_start_sig),
        .tx_out(tx_out), 
        .tx_done(tx_done)
        );

    logic [7:0] uart_rx_out;
    logic uart_rx_done;
    uart2_rx uart2_rx (
        .rx_in(tx_out), 
        .clock(clock), 
        .reset(reset),
        .rx_out(uart_rx_out),
        .rx_done(uart_rx_done)
    );

    fsm_64to8 fsm_64to8(
        .clock(clock), 
        .reset(reset), 
        .start(fsm_start), 
        .tx_done(tx_done),
        .data_in(data_in),
        .data_out(fsm_out_tx_in),
        .uart_tx_start(uart_tx_start_sig)
    );

    fsm_8to64 fsm_8to64(
        .byte_in(uart_rx_out),
        .clock(clock), 
        .reset(reset), 
        .rx_done(uart_rx_done),
        .data_out(data_out),
        .data_ready(data_ready)
    );



endmodule
