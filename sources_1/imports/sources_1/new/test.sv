`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2024 03:09:57 PM
// Design Name: 
// Module Name: test
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


module test;

    logic [7:0] plaintext [7:0] = '{
        8'h11,
        8'h22,
        8'h33,
        8'h44,
        8'h55,
        8'h66,
        8'h77,
        8'h88
    }; 
    logic [9:0] dataPacket;
    int i;

    logic serial_plaintext2, clock, reset2; 
    logic serial_ciphertext, done;

    ovr_top DUT(
            .serial_plaintext2, 
            .clock, 
            .reset2,   
            .serial_ciphertext, 
            .done
    );

    initial begin 
        // plaintext   = new[72];
        
        // for(int l=0; l<72; l++) begin 
        //     i = randomize(plaintext[l]);
        // end 

        reset2      = 1'b0;
        #22 reset2  = 1'b1;
        if(done)
            $finish;
    end 

    initial begin 
        clock = 1'b0;
        forever begin
            #10 clock = ~clock;
        end
    end     
    initial begin
        for (int u =0; u<8; u++) begin 
            for (int j=0; j<8; j++) begin 
                dataPacket = {1'b1, plaintext[j], 1'b0};
                for(int k=0; k<10; k++) begin 
                    serial_plaintext2 = dataPacket[k];
                    repeat(868) @(posedge clock);
                end 
            end
        end
       serial_plaintext2 = 'X;  
    end  

endmodule
