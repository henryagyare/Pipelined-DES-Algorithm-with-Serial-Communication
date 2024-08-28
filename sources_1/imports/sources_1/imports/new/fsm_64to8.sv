`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
    // Company: 
    // Engineer: 
    // 
    // Create Date: 08/01/2024 10:07:07 AM
    // Design Name: 
    // Module Name: fsm_8to64
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


module fsm_64to8 import fsm_pkgs::*;(
    input   logic clock, reset, start, tx_done,
    input   logic [63:0] data_in,
    output  logic [7:0] data_out,
    output logic uart_tx_start, idleOut
    );

    fsm_64to8_state_encoding current_state, next_state;

    logic [3:0] current_byte_count, next_byte_count;
    logic [63:0] next_shiftReg, current_shiftReg;
    logic [7:0] current_data_out, next_data_out;
    logic next_uart_tx_start, current_uart_tx_start;

    always_ff @( posedge clock, negedge reset ) begin : Current_State_Block
        if (!reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end


    always_ff @( posedge clock, negedge reset ) begin
        if (!reset)begin
            current_byte_count <= '0;
            current_shiftReg <= '0;
            current_data_out <= '0;
            current_uart_tx_start <= '0;
        end
        else begin
            current_byte_count <= next_byte_count;        
            current_shiftReg <= next_shiftReg;
            current_data_out <= next_data_out;
            current_uart_tx_start <= next_uart_tx_start;
        end
    end

    // Next State Logic
    always_comb begin : Next_State_Logic
        case (current_state)
            IDLE    :   begin
                            next_shiftReg = 'X;
                            next_byte_count = '0;
                            next_data_out = '0;
                            next_uart_tx_start = '0;
                            if (start) begin
                                next_state = MOVE;
                                next_shiftReg = data_in;
                                next_uart_tx_start = '1;
                                next_data_out = data_in[63:56];
                            end
                            else begin
                                next_state = current_state;
                            end
                        end
            MOVE    :   begin
                            if (current_byte_count == 3'd7 && tx_done) begin
                                next_state = DONE;
                                next_byte_count = '0;
                                next_data_out = current_data_out;
                                next_shiftReg = '0;
                                next_uart_tx_start = '0;
                            end
                            else begin
                                next_state = current_state;
                                if (tx_done) begin
                                    next_byte_count = current_byte_count + 1;
                                    //next_shiftReg = {8'h00, current_shiftReg[63:8]};
                                    next_shiftReg = {current_shiftReg[55:0], 8'h00};
                                    next_data_out = current_shiftReg[55:48];
                                    //next_data_out = current_shiftReg[15:8];
                                    next_uart_tx_start = '1;
                                end
                                else begin
                                    next_byte_count = current_byte_count;
                                    next_shiftReg   = current_shiftReg;
                                    next_data_out = current_data_out;
                                    next_uart_tx_start = '0;
                                end
                            end
                        end
            DONE  :   begin
                            next_state = IDLE;
                            next_byte_count = '0;
                            next_shiftReg = '0;
                            next_data_out = '0;
                            next_uart_tx_start = '0;
                        end

            default :   begin
                            next_state = IDLE;
                            next_byte_count = '0;
                            next_shiftReg = '0;
                            next_data_out = '0;
                            next_uart_tx_start = '0;
                        end
        endcase        
    end


    // always_ff @( posedge clock ) begin
    //     data_out <= current_data_out;        
    // end

    assign   uart_tx_start = current_uart_tx_start;
    assign   data_out = current_data_out;

    // always_ff @( posedge clock ) begin
    //     uart_tx_start <= current_uart_tx_start;
    // end

    // always_ff @( posedge clock ) begin
    //     data_out <= current_data_out;
    // end

    always_comb begin 
        case(current_state)
            IDLE        : idleOut = '1;
            default     : idleOut = '0;
        endcase
    end 


endmodule