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


module fsm_8to64 import fsm_pkgs::*;(
    input logic [7:0] byte_in,
    input logic clock, reset, rx_done,
    output logic [63:0] data_out,
    output logic data_ready
    );

    fsm_8to64_state_encoding current_state, next_state;

    logic [63:0] reg_next, reg_current;
    logic [3:0] next_byte_count, current_byte_count;

    always_ff @( posedge clock, negedge reset ) begin : Current_State_Block
        if (!reset)
            current_state <= IDLE_STATE;
        else
            current_state <= next_state;
    end

    always_ff @( posedge clock, negedge reset ) begin
        if (!reset) begin
            reg_current <= '0;
            current_byte_count <= '0;
        end
        else begin
            reg_current <= reg_next;
            current_byte_count <= next_byte_count;
        end     
    end


    // Next State Logic
    always_comb begin : Next_State_Logic
        case (current_state)
            IDLE_STATE      :   begin
                                    reg_next = 'X;
                                    next_byte_count = '0;
                                    if (rx_done) begin
                                        next_state = COLLECT_STATE; 
                                        next_byte_count = current_byte_count + 1;
                                        //reg_next = {byte_in, reg_current[63:8]};
                                        reg_next = {reg_current[55:0], byte_in};
                                    end
                                    else begin
                                        next_state = current_state;
                                    end
                                end 
            COLLECT_STATE   :   begin
                                    if (current_byte_count == 4'd7 && rx_done) begin
                                        next_state = OUTPUT_STATE;
                                        next_byte_count = '0;
                                        reg_next = {reg_current[55:0], byte_in};
                                    end                
                                    else begin
                                        next_state = current_state;
                                        if (rx_done) begin
                                            next_byte_count = current_byte_count + 1;
                                              //reg_next = {byte_in, reg_current[63:8]};
                                            reg_next = {reg_current[55:0], byte_in};
                                        end
                                        else begin
                                            next_byte_count = current_byte_count;
                                            reg_next = reg_current;
                                        end
                                    end
                                end
            OUTPUT_STATE    :   begin
                                    next_state = IDLE_STATE;
                                    reg_next = '0;
                                    next_byte_count = '0;
                                end
            default         :   begin
                                    next_state = IDLE_STATE;
                                    reg_next = '0;
                                    next_byte_count = '0;
                                end            
        endcase
    end

    always_comb begin : Done_Signal
        if (current_state == OUTPUT_STATE)
            data_ready = '1;
        else
            data_ready = '0;
    end

    // Output
    // always_ff @( posedge clock ) begin
    //     if (data_ready)
    //         data_out <= reg_current;
    // end

    assign data_out = reg_current;

endmodule
