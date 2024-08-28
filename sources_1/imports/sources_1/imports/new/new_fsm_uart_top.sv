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


module new_fsm_uart_top(
    input logic clock, reset, fsm_start,
    input logic [63:0] data_in,
    output logic [7:0] uart_rx_out,
    output logic uart_rx_done
    );

    logic fsm_uart_tx_start;
    logic [7:0] fsm_uart_tx_in;
    logic uart_tx_out, uart_tx_done;
    uart2_tx uart2_tx (
        .clock(clock), 
        .reset(reset),
        .tx_in(fsm_uart_tx_in),
        .tx_start(fsm_uart_tx_start),
        .tx_out(uart_tx_out), 
        .tx_done(uart_tx_done)
        );

    fsm_64to8 fsm_64to8(
        .clock(clock), 
        .reset(reset), 
        .start(fsm_start), 
        .tx_done(uart_tx_done),
        .data_in(data_in),
        .data_out(fsm_uart_tx_in),
        .uart_tx_start(fsm_uart_tx_start)
    );

    uart2_rx uart2_rx (
        .rx_in(uart_tx_out), 
        .clock(clock), 
        .reset(reset),
        .rx_out(uart_rx_out),
        .rx_done(uart_rx_done)
    );



endmodule
