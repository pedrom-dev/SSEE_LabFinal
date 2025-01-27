// ==============================================================
// Generated by Vitis HLS v2024.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module MLP_MLP_Pipeline_VITIS_LOOP_23_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        l_out_outputs_address0,
        l_out_outputs_ce0,
        l_out_outputs_q0,
        l_out_outputs_address1,
        l_out_outputs_ce1,
        l_out_outputs_q1,
        result_out,
        result_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [3:0] l_out_outputs_address0;
output   l_out_outputs_ce0;
input  [31:0] l_out_outputs_q0;
output  [3:0] l_out_outputs_address1;
output   l_out_outputs_ce1;
input  [31:0] l_out_outputs_q1;
output  [7:0] result_out;
output   result_out_ap_vld;

reg ap_idle;
reg result_out_ap_vld;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1_subdone;
wire   [0:0] icmp_ln23_fu_109_p2;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [31:0] result_3_reg_245;
wire    ap_block_pp0_stage1_11001;
reg   [3:0] i_reg_250;
reg   [0:0] icmp_ln23_reg_255;
wire   [0:0] icmp_ln24_fu_172_p2;
reg   [0:0] icmp_ln24_reg_279;
wire   [0:0] icmp_ln24_1_fu_178_p2;
reg   [0:0] icmp_ln24_1_reg_284;
wire   [0:0] icmp_ln24_2_fu_184_p2;
reg   [0:0] icmp_ln24_2_reg_289;
wire   [0:0] icmp_ln24_3_fu_190_p2;
reg   [0:0] icmp_ln24_3_reg_294;
reg    ap_enable_reg_pp0_iter0_reg;
wire   [63:0] zext_ln24_fu_126_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln23_fu_121_p1;
reg   [31:0] result_fu_42;
wire   [31:0] result_5_fu_219_p3;
reg   [31:0] ap_sig_allocacmp_result_3;
wire    ap_loop_init;
reg   [3:0] result_1_fu_46;
wire   [3:0] add_ln23_fu_115_p2;
wire    ap_block_pp0_stage1_01001;
reg    l_out_outputs_ce1_local;
reg    l_out_outputs_ce0_local;
wire    ap_block_pp0_stage0;
wire   [31:0] bitcast_ln24_fu_136_p1;
wire   [31:0] bitcast_ln24_1_fu_154_p1;
wire   [7:0] tmp_3_fu_140_p4;
wire   [22:0] trunc_ln24_fu_150_p1;
wire   [7:0] tmp_4_fu_158_p4;
wire   [22:0] trunc_ln24_1_fu_168_p1;
wire   [0:0] or_ln24_fu_196_p2;
wire   [0:0] or_ln24_1_fu_200_p2;
wire   [0:0] and_ln24_fu_204_p2;
wire   [0:0] grp_fu_82_p2;
wire   [0:0] and_ln24_1_fu_210_p2;
wire   [31:0] zext_ln24_1_fu_216_p1;
wire    ap_block_pp0_stage0_00001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to1;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 result_fu_42 = 32'd0;
#0 result_1_fu_46 = 4'd0;
#0 ap_done_reg = 1'b0;
end

MLP_fcmp_32ns_32ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 1 ))
fcmp_32ns_32ns_1_2_no_dsp_1_U368(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(l_out_outputs_q1),
    .din1(l_out_outputs_q0),
    .ce(1'b1),
    .opcode(5'd4),
    .dout(grp_fu_82_p2)
);

MLP_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready_sig),
    .ap_done(ap_done_sig),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        result_1_fu_46 <= 4'd0;
    end else if (((icmp_ln23_fu_109_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        result_1_fu_46 <= add_ln23_fu_115_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        result_fu_42 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        result_fu_42 <= result_5_fu_219_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        i_reg_250 <= result_1_fu_46;
        icmp_ln23_reg_255 <= icmp_ln23_fu_109_p2;
        result_3_reg_245 <= ap_sig_allocacmp_result_3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln24_1_reg_284 <= icmp_ln24_1_fu_178_p2;
        icmp_ln24_2_reg_289 <= icmp_ln24_2_fu_184_p2;
        icmp_ln24_3_reg_294 <= icmp_ln24_3_fu_190_p2;
        icmp_ln24_reg_279 <= icmp_ln24_fu_172_p2;
    end
end

always @ (*) begin
    if (((icmp_ln23_fu_109_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_sig_allocacmp_result_3 = result_5_fu_219_p3;
    end else begin
        ap_sig_allocacmp_result_3 = result_fu_42;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        l_out_outputs_ce0_local = 1'b1;
    end else begin
        l_out_outputs_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        l_out_outputs_ce1_local = 1'b1;
    end else begin
        l_out_outputs_ce1_local = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln23_fu_109_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        result_out_ap_vld = 1'b1;
    end else begin
        result_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln23_fu_115_p2 = (result_1_fu_46 + 4'd1);

assign and_ln24_1_fu_210_p2 = (grp_fu_82_p2 & and_ln24_fu_204_p2);

assign and_ln24_fu_204_p2 = (or_ln24_fu_196_p2 & or_ln24_1_fu_200_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign ap_ready = ap_ready_sig;

assign bitcast_ln24_1_fu_154_p1 = l_out_outputs_q0;

assign bitcast_ln24_fu_136_p1 = l_out_outputs_q1;

assign icmp_ln23_fu_109_p2 = ((result_1_fu_46 == 4'd10) ? 1'b1 : 1'b0);

assign icmp_ln24_1_fu_178_p2 = ((trunc_ln24_fu_150_p1 == 23'd0) ? 1'b1 : 1'b0);

assign icmp_ln24_2_fu_184_p2 = ((tmp_4_fu_158_p4 != 8'd255) ? 1'b1 : 1'b0);

assign icmp_ln24_3_fu_190_p2 = ((trunc_ln24_1_fu_168_p1 == 23'd0) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_172_p2 = ((tmp_3_fu_140_p4 != 8'd255) ? 1'b1 : 1'b0);

assign l_out_outputs_address0 = zext_ln23_fu_121_p1;

assign l_out_outputs_address1 = zext_ln24_fu_126_p1;

assign l_out_outputs_ce0 = l_out_outputs_ce0_local;

assign l_out_outputs_ce1 = l_out_outputs_ce1_local;

assign or_ln24_1_fu_200_p2 = (icmp_ln24_3_reg_294 | icmp_ln24_2_reg_289);

assign or_ln24_fu_196_p2 = (icmp_ln24_reg_279 | icmp_ln24_1_reg_284);

assign result_5_fu_219_p3 = ((and_ln24_1_fu_210_p2[0:0] == 1'b1) ? zext_ln24_1_fu_216_p1 : result_3_reg_245);

assign result_out = ap_sig_allocacmp_result_3[7:0];

assign tmp_3_fu_140_p4 = {{bitcast_ln24_fu_136_p1[30:23]}};

assign tmp_4_fu_158_p4 = {{bitcast_ln24_1_fu_154_p1[30:23]}};

assign trunc_ln24_1_fu_168_p1 = bitcast_ln24_1_fu_154_p1[22:0];

assign trunc_ln24_fu_150_p1 = bitcast_ln24_fu_136_p1[22:0];

assign zext_ln23_fu_121_p1 = result_1_fu_46;

assign zext_ln24_1_fu_216_p1 = i_reg_250;

assign zext_ln24_fu_126_p1 = ap_sig_allocacmp_result_3;

endmodule //MLP_MLP_Pipeline_VITIS_LOOP_23_1
