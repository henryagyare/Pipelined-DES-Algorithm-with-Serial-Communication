`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2024 07:05:55 PM
// Design Name: 
// Module Name: fifo_implementation
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


module fifo_implementation #(
    parameter fifo_depth = 64,
    parameter fifo_width = 64)
    (
    input logic write_clock, write_enable, read_enable, reset, read_clock,
    output logic empty, full,

    input logic [fifo_width - 1:0] write_data,
    output logic [fifo_width - 1:0] read_data
    );

    // logic [fifo_width - 1 : 0] fifo_queue [fifo_depth - 1 : 0] = '{
    //     0:       'h68616E2076617365,
    //     1:       'h6C696E650D0A0000,
    //     2:       'h6F6F746865722074,
    //     3:       'h596F7572206C6970,
    //     default: 'h732061726520736D
    // };

    logic [fifo_width - 1 : 0] fifo_queue [fifo_depth - 1 : 0];
    logic [($clog2(fifo_depth) -1 ):0] head, tail;
    logic check;
    //  Full and Empty Flags
    always_comb 
        begin
            if ((head ^ tail) === 'x)
               begin: Empty_Status1
                    empty = 1'b1;
                    full = 1'b0;
               end
            else if ((head == tail))
               begin: Empty_Status
                    empty = 1'b1;
                    full = 1'b0;
               end
            
            else 
                if (((tail == 0) && (head == fifo_depth - 1)) || (tail == (head + 1)))
                   begin: full_status
                        full = 1'b1;
                        empty = 1'b0;
                   end
                else
                    begin
                        empty = 1'b0;
                        full = 1'b0;
                    end
        end

    always_ff @(posedge write_clock ) 
        begin : head_assignments
            if (!reset)
                begin
                    head <= 0;
                end
            else 
                begin
                    if (write_enable == 1 && full == 0)
                        begin
                            head <= head + 1;                
                        end
                end
        end        

    always_ff @(posedge read_clock) 
        begin : tail_assignments
            if (!reset)
                begin
                    tail <= 0;
                end            
            else
                begin
                    if (read_enable == 1 && empty == 0)
                        begin
                            tail <= tail + 1;
                        end
                end
        end

    always_ff @( posedge write_clock ) 
        begin : writing_data
            if (write_enable == 1 && full == 0)
                begin
                    fifo_queue[head] <= write_data;
                end
        end

    always_ff @( posedge read_clock ) 
        begin : reading_data
            if (read_enable == 1 && empty == 0)
                begin
                    read_data <= fifo_queue[tail];            
                end
        end


endmodule




