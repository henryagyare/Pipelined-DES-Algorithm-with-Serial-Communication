`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 10:27:48 PM
// Design Name: 
// Module Name: expand32to48
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

 module expand32to48(
      input logic [31:0] right_half,
      output logic [47:0] expantable

    );
    assign expantable[47] =
    right_half[32-32];
    assign expantable[46] =
    right_half[32-1];
    assign expantable[45] =
    right_half[32-2];
    assign expantable[44] =
    right_half[32-3];
    assign expantable[43] =
    right_half[32-4];
    assign expantable[42] =
    right_half[32-5];
    assign expantable[41] =
    right_half[32-4];
    assign expantable[40] =
    right_half[32-5];
    assign expantable[39] =
    right_half[32-6];
    assign expantable[38] =
    right_half[32-7];
    assign expantable[37] =
    right_half[32-8];
    assign expantable[36] =
    right_half[32-9];
    assign expantable[35] =
    right_half[32-8];
    assign expantable[34] =
    right_half[32-9];
    assign expantable[33] =
    right_half[32-10];
    assign expantable[32] =
    right_half[32-11];
    assign expantable[31] =
    right_half[32-12];
    assign expantable[30] =
    right_half[32-13];
    assign expantable[29] =
    right_half[32-12];
    assign expantable[28] =
    right_half[32-13];
    assign expantable[27] =
    right_half[32-14];
    assign expantable[26] =
    right_half[32-15];
    assign expantable[25] =
    right_half[32-16];
    assign expantable[24] =
    right_half[32-17];
    assign expantable[23] =
    right_half[32-16];
    assign expantable[22] =
    right_half[32-17];
    assign expantable[21] =
    right_half[32-18];
    assign expantable[20] =
    right_half[32-19];
    assign expantable[19] =
    right_half[32-20];
    assign expantable[18] =
    right_half[32-21];
    assign expantable[17] =
    right_half[32-20];
    assign expantable[16] =
    right_half[32-21];
    assign expantable[15] =
    right_half[32-22];
    assign expantable[14] =
    right_half[32-23];
    assign expantable[13] =
    right_half[32-24];
    assign expantable[12] =
    right_half[32-25];
    assign expantable[11] =
    right_half[32-24];
    assign expantable[10] =
    right_half[32-25];
    assign expantable[9] =
    right_half[32-26];
    assign expantable[8] =
    right_half[32-27];
    assign expantable[7] =
    right_half[32-28];
    assign expantable[6] =
    right_half[32-29];
    assign expantable[5] =
    right_half[32-28];
    assign expantable[4] =
    right_half[32-29];
    assign expantable[3] =
    right_half[32-30];
    assign expantable[2] =
    right_half[32-31];
    assign expantable[1] =
    right_half[32-32];
    assign expantable[0] =
    right_half[32-1];
    
endmodule



