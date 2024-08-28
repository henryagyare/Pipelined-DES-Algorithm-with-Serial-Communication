`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 06:59:11 AM
// Design Name: 
// Module Name: top
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


module DES_Algo 
    #(
    // parameter plaintext = 'h732061726520736D ,
    // parameter keyInput = 'h0E329232EA6D0D73
    )
    (
    input logic pktWen, 
    input logic [63:0] plaintext, keyInput, 
    // input logic [63:0] plaintext,
    input  logic clk,
    output logic [63:0] ciphertext,
    output logic enBuffWrite 
    );

    genvar i;

    logic [47:0] generated_roundKeys [15:0];      // a vector for all the round keys
    logic [31:0] round_leftHalf [15:0], round_rightHalf [15:0];     // a vector for halves of the outputs for each round
    logic [27:0] keyround_leftLCS_output [15:0], keyround_rightLCS_output [15:0];   //left and right outputs from left circular shift for each key generation round.

    // vectors for DES and key pipeline registers outputs
    logic [31:0] left_DES_pipeReg_output [14:0], right_DES_pipeReg_output [14:0];
    logic [27:0] left_key_pipeReg_output [14:0], right_key_pipeReg_output [14:0];
    logic [15:0] pktWenPipe;
 
    //--------- Initial Permutation -------------------//
    logic [63:0] initialPerm_output;
    initialPermutation initialPermutation (
        .plaintext (plaintext),
        .initialPerm (initialPerm_output)
    );

    //-------- Permutation Choice 1 ----------------//
    logic [55:0] permutationChoice1_output;
        permutationChoice1 permutationChoice1(
        .pc1Input(keyInput),
        .pc1Output(permutationChoice1_output)
    );

    //----------- First Stage Key Generation -----------------//
    keyAlgorithm1 keyAlgorithm1(
        .left_LCS_input(permutationChoice1_output[55:28]),
        .right_LCS_input(permutationChoice1_output[27:0]),

        .left_LCS_output(keyround_leftLCS_output[0]), 
        .right_LCS_output(keyround_rightLCS_output[0]),
        
        .roundKey_output(generated_roundKeys[0])
    );

    //----------- FIRST STAGE KEY PIPELINE REGISTER --------------//
    keyPipe_reg stage1_keyReg(
        .clk(clk), 

        .key_leftIn(keyround_leftLCS_output[0][27:0]),
        .key_rightIn(keyround_rightLCS_output[0][27:0]),

        .key_leftOut(left_key_pipeReg_output[0][27:0]),
        .key_rightOut(right_key_pipeReg_output[0][27:0])
    );

    //---------- DES FIRST STAGE --------------------//
    desEncrypt singleRoundDES(
        .leftHalf_previous(initialPerm_output[63:32]),
        .rightHalf_previous(initialPerm_output[31:0]),

        .generated_key(generated_roundKeys[0]),

        .roundN_leftHalf(round_leftHalf[0]),
        .roundN_rightHalf(round_rightHalf[0])
    );

    //----------- STAGE 1 PIPELINE REGISTER -----------//
    pipelineRegister stage1_PipeReg(
        .clk(clk), 

        .leftIn(round_leftHalf[0]), 
        .rightIn(round_rightHalf[0]),
        
        .leftOut(left_DES_pipeReg_output[0]), 
        .rightOut(right_DES_pipeReg_output[0])
    );

    //------------- Stage 2 Key Algorithm -----------//
    keyAlgorithm1 stage2_keyAlgorithm1(
        .left_LCS_input(left_key_pipeReg_output[0]),
        .right_LCS_input(right_key_pipeReg_output[0]),

        .left_LCS_output(keyround_leftLCS_output[1]), 
        .right_LCS_output(keyround_rightLCS_output[1]),

        .roundKey_output(generated_roundKeys[1])
    );

    //-------Stage1 PktEn -----------------//
    always_ff @(posedge clk) begin 
        pktWenPipe[0] <= pktWen;
    end 


    //-------15 PktEn -----------------//
    generate
        for (i=1; i<16; i++) begin 
            always_ff @(posedge clk) begin
                pktWenPipe[i] <= pktWenPipe[i-1];
            end 
        end 
    endgenerate


    //---assign pktWenPipe[15] to output Wen 
        assign enBuffWrite = pktWenPipe[15];
    
    // ---------------- Generating Single Round DES Block for 15 Stages/Rounds -----------------//
    generate
        for (i = 1; i<16; i++) 
        begin
            desEncrypt singleRoundDES(
                .leftHalf_previous(left_DES_pipeReg_output[i-1]),
                .rightHalf_previous(right_DES_pipeReg_output[i-1]),

                .generated_key(generated_roundKeys[i]),

                .roundN_leftHalf(round_leftHalf[i]),
                .roundN_rightHalf(round_rightHalf[i])
            );            
        end
    endgenerate

    //-------------- Generating 14 DES Stage Pipeline Registers------------//
    generate
        for (i = 1; i<15; i++) 
        begin
            pipelineRegister PipeReg(
                .clk(clk), 

                .leftIn(round_leftHalf[i]), 
                .rightIn(round_rightHalf[i]),
                
                .leftOut(left_DES_pipeReg_output[i]), 
                .rightOut(right_DES_pipeReg_output[i])
            );            
        end
    endgenerate

    //------------- Generating Round(3 to 8) Key Algorithm for 2 shift LCS -----------//
    generate
        for (i = 2; i<8; i++) 
        begin
            keyAlgorithm2 keyAlgorithm2(
                .left_LCS_input(left_key_pipeReg_output[i-1]),
                .right_LCS_input(right_key_pipeReg_output[i-1]),

                .left_LCS_output(keyround_leftLCS_output[i]), 
                .right_LCS_output(keyround_rightLCS_output[i]),

                .roundKey_output(generated_roundKeys[i])
        );
        end        
    endgenerate

    // --------------- Re-Generating 14 Key Pipeline Register ----------------//
    generate
        for (i = 1; i<15 ; i++) 
        begin
            keyPipe_reg keyReg(
                .clk(clk), 

                .key_leftIn(keyround_leftLCS_output[i]),
                .key_rightIn(keyround_rightLCS_output[i]),

                .key_leftOut(left_key_pipeReg_output[i]),
                .key_rightOut(right_key_pipeReg_output[i])
            );            
        end
    endgenerate

    //------------- Stage 9 Key Algorithm -----------//
    keyAlgorithm1 stage9_keyAlgorithm1(
        .left_LCS_input(left_key_pipeReg_output[7]),
        .right_LCS_input(right_key_pipeReg_output[7]),

        .left_LCS_output(keyround_leftLCS_output[8]), 
        .right_LCS_output(keyround_rightLCS_output[8]),

        .roundKey_output(generated_roundKeys[8])
    );

    //------------- Generating Round(10 to 15) Key Algorithm for 2 shift LCS -----------//
    generate
        for (i = 9; i<15 ; i++) 
        begin
            keyAlgorithm2 stages9to15_keyAlgorithm2(
                .left_LCS_input(left_key_pipeReg_output[i-1]),
                .right_LCS_input(right_key_pipeReg_output[i-1]),

                .left_LCS_output(keyround_leftLCS_output[i]), 
                .right_LCS_output(keyround_rightLCS_output[i]),

                .roundKey_output(generated_roundKeys[i])
        );
        end        
    endgenerate

    //------------- Stage 16 Key Algorithm -----------//
    keyAlgorithm1 stage16_keyAlgorithm1(
        .left_LCS_input(left_key_pipeReg_output[14]),
        .right_LCS_input(right_key_pipeReg_output[14]),

        .left_LCS_output(keyround_leftLCS_output[15]), 
        .right_LCS_output(keyround_rightLCS_output[15]),

        .roundKey_output(generated_roundKeys[15])
    );

    // ------- 32-BIT SWAP ---------------//
    logic [31:0] final_left, final_right;
    assign final_left = round_rightHalf[15];  
    assign final_right = round_leftHalf[15];

    // -------- Inverse Permutation ----------------//
    inversePermutation inversePermutation(
        .inversePerm_leftInput(final_left), 
        .inversePerm_rightInput(final_right),
        .inversePerm_output(ciphertext)
    );

endmodule
