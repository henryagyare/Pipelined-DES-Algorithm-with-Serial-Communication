`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
    // Company: 
    // Engineer: 
    // 
    // Create Date: 08/03/2024 12:45:54 PM
    // Design Name: 
    // Module Name: ovr_top
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


module ovr_top(
        input logic serial_plaintext2, clock, reset2,   //clockForDESPipeline
    //input logic [63:0] keyValue,
        output logic serial_ciphertext,
       output logic done
    );
    
   logic reset1, reset;
   logic serial_plaintext1, serial_plaintext; 

    logic [63:0] keyValue;
    logic uart_rx_done;
    logic [7:0] uart_rx_out;
    
    assign keyValue = '0;

    //sync_falling_edge 
    always_ff@ (posedge clock) begin 
        reset1 <= reset2;
        reset  <= reset1;
    end 

    //sync_falling_edge
    always_ff@ (posedge clock) begin 
        serial_plaintext1  <= serial_plaintext2;
        serial_plaintext  <= serial_plaintext1;
    end 



    uart2_rx uart2_rx(
        .rx_in(serial_plaintext), 
        .clock(clock), 
        .reset(reset),
        .rx_out(uart_rx_out),
        .rx_done(uart_rx_done)
    );

    logic [63:0] fsm_8to64_output;
    logic fsm_8to64_data_ready;
    fsm_8to64 fsm_8to64(
        .clock(clock), 
        .reset(reset), 
        .rx_done(uart_rx_done),
        .byte_in(uart_rx_out),
        .data_out(fsm_8to64_output),
        .data_ready(fsm_8to64_data_ready)
    );

    // Rx Fifo Buffer
    logic rx_fifo_read_eable, rx_fifo_empty, rx_fifo_full, pktWenNext, pktWenCurr, pktWenCurr2, txWen, txWenCurr;
    logic [63:0] rx_fifo_output, rx_fifo_output_Curr;
    assign rx_fifo_read_eable = ~rx_fifo_empty;

    fifo_implementation Rx_fifo(
        .write_clock(clock), 
        .read_clock(clock),
        .reset(reset), 
        .write_enable(fsm_8to64_data_ready), 
        .read_enable(rx_fifo_read_eable), 
        .empty(rx_fifo_empty), 
        .full(rx_fifo_full),
        .write_data(fsm_8to64_output),
        .read_data(rx_fifo_output)
    );

    always_comb begin 
        if(rx_fifo_read_eable)
            pktWenNext = '1;
        else 
            pktWenNext  = '0;
    end 


    always_ff @( posedge clock ) begin : FF_BN_fifo_DESFIRST
        rx_fifo_output_Curr <= rx_fifo_output;
        pktWenCurr         <= pktWenNext;
       // pktWenCurr           <= pktWenCurr2;
    end

    // DES
    logic [63:0] block_ciphertext;
    DES_Algo DES_Algo(
        .pktWen(pktWenCurr), 
        .plaintext(rx_fifo_output_Curr),
        .keyInput(keyValue),
        .clk(clock),
        .ciphertext(block_ciphertext), 
        .enBuffWrite(txWen)
    );

    // Tx Fifo Buffer
    logic tx_fifo_empty, tx_fifo_full, readTxFifo, idleOut, f64Start, f64StartCurr;
    logic [63:0] tx_fifo_output, encryptOutput;

    always_ff @( posedge clock ) begin : FF_BN_DESLAST_FIFO
       encryptOutput <= block_ciphertext;
       txWenCurr     <= txWen;
    end

    always_comb begin : readEnableLogicFIFOOutput
        if(!tx_fifo_empty && idleOut) begin 
            readTxFifo = '1;    
            f64Start   = '1;
        end 
        else    begin 
            readTxFifo  = '0;
            f64Start    = '0;
        end 
    end
    always_ff @(posedge clock) begin
        f64StartCurr <= f64Start;
    end 
    fifo_implementation Tx_fifo(
        .write_clock(clock), 
        .read_clock(clock),
        .reset(reset), 
        .write_enable(txWenCurr),    // A signal from pipeline to say encrypt complete 
        .read_enable(readTxFifo),     // Implement a logic to control read_enable
        .empty(tx_fifo_empty), 
        .full(tx_fifo_full),
        .write_data(encryptOutput),
        .read_data(tx_fifo_output)
    );

    logic tx_done_signal;
    logic uart_tx_start_signal;
    logic [7:0] fsm_64to8_output;
    fsm_64to8 fsm_64to8(
        .idleOut(idleOut),
        .clock(clock), 
        .reset(reset), 
        .start(f64StartCurr),   // Implement logic for start signl of this FSM 
        .tx_done(tx_done_signal),
        .data_in(tx_fifo_output),
        .data_out(fsm_64to8_output),
        .uart_tx_start(uart_tx_start_signal)
    );

    uart2_tx uart2_tx(
        .tx_in(fsm_64to8_output),
        .tx_start(uart_tx_start_signal), 
        .clock(clock), 
        .reset(reset),
        .tx_out(serial_ciphertext), 
        .tx_done(tx_done_signal)
    );


    assign done = tx_done_signal;


endmodule
