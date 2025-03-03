// ==============================================================
// Generated by Vitis HLS v2024.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module MLP_MLP_Pipeline_VITIS_LOOP_82_1_VITIS_LOOP_83_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        INPUT_STREAM_TVALID,
        INPUT_STREAM_TDATA,
        INPUT_STREAM_TREADY,
        INPUT_STREAM_TKEEP,
        INPUT_STREAM_TSTRB,
        INPUT_STREAM_TUSER,
        INPUT_STREAM_TLAST,
        INPUT_STREAM_TID,
        INPUT_STREAM_TDEST,
        image_pixels_address0,
        image_pixels_ce0,
        image_pixels_we0,
        image_pixels_d0
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   INPUT_STREAM_TVALID;
input  [31:0] INPUT_STREAM_TDATA;
output   INPUT_STREAM_TREADY;
input  [3:0] INPUT_STREAM_TKEEP;
input  [3:0] INPUT_STREAM_TSTRB;
input  [3:0] INPUT_STREAM_TUSER;
input  [0:0] INPUT_STREAM_TLAST;
input  [4:0] INPUT_STREAM_TID;
input  [4:0] INPUT_STREAM_TDEST;
output  [9:0] image_pixels_address0;
output   image_pixels_ce0;
output   image_pixels_we0;
output  [31:0] image_pixels_d0;

reg ap_idle;
reg INPUT_STREAM_TREADY;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln82_fu_127_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    INPUT_STREAM_TDATA_blk_n;
wire   [63:0] zext_ln89_fu_218_p1;
reg   [4:0] j_fu_66;
wire   [4:0] add_ln83_fu_223_p2;
wire    ap_loop_init;
reg   [4:0] ap_sig_allocacmp_j_load;
reg   [4:0] i_fu_70;
wire   [4:0] select_ln82_1_fu_165_p3;
reg   [4:0] ap_sig_allocacmp_i_load;
reg   [9:0] indvar_flatten_fu_74;
wire   [9:0] add_ln82_1_fu_133_p2;
reg   [9:0] ap_sig_allocacmp_indvar_flatten_load;
reg    image_pixels_we0_local;
wire   [31:0] bitcast_ln89_fu_207_p1;
reg    image_pixels_ce0_local;
wire   [0:0] icmp_ln83_fu_151_p2;
wire   [4:0] add_ln82_fu_145_p2;
wire   [6:0] tmp_fu_181_p3;
wire   [9:0] p_shl_fu_173_p3;
wire   [9:0] p_shl1_fu_189_p1;
wire   [4:0] select_ln82_fu_157_p3;
wire   [9:0] zext_ln83_fu_199_p1;
wire   [9:0] empty_fu_193_p2;
wire   [9:0] add_ln89_fu_212_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 j_fu_66 = 5'd0;
#0 i_fu_70 = 5'd0;
#0 indvar_flatten_fu_74 = 10'd0;
#0 ap_done_reg = 1'b0;
end

MLP_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready_sig),
    .ap_done(ap_done_sig),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln82_fu_127_p2 == 1'd0)) begin
            i_fu_70 <= select_ln82_1_fu_165_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_70 <= 5'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln82_fu_127_p2 == 1'd0)) begin
            indvar_flatten_fu_74 <= add_ln82_1_fu_133_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_74 <= 10'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln82_fu_127_p2 == 1'd0)) begin
            j_fu_66 <= add_ln83_fu_223_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_66 <= 5'd0;
        end
    end
end

always @ (*) begin
    if (((icmp_ln82_fu_127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        INPUT_STREAM_TDATA_blk_n = INPUT_STREAM_TVALID;
    end else begin
        INPUT_STREAM_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (icmp_ln82_fu_127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        INPUT_STREAM_TREADY = 1'b1;
    end else begin
        INPUT_STREAM_TREADY = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state1_pp0_stage0_iter0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (icmp_ln82_fu_127_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_i_load = 5'd0;
    end else begin
        ap_sig_allocacmp_i_load = i_fu_70;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_indvar_flatten_load = 10'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_74;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_j_load = 5'd0;
    end else begin
        ap_sig_allocacmp_j_load = j_fu_66;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        image_pixels_ce0_local = 1'b1;
    end else begin
        image_pixels_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (icmp_ln82_fu_127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        image_pixels_we0_local = 1'b1;
    end else begin
        image_pixels_we0_local = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln82_1_fu_133_p2 = (ap_sig_allocacmp_indvar_flatten_load + 10'd1);

assign add_ln82_fu_145_p2 = (ap_sig_allocacmp_i_load + 5'd1);

assign add_ln83_fu_223_p2 = (select_ln82_fu_157_p3 + 5'd1);

assign add_ln89_fu_212_p2 = (zext_ln83_fu_199_p1 + empty_fu_193_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start_int == 1'b0) | ((1'b0 == INPUT_STREAM_TVALID) & (icmp_ln82_fu_127_p2 == 1'd0)));
end

assign ap_done = ap_done_sig;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_ready = ap_ready_sig;

assign bitcast_ln89_fu_207_p1 = INPUT_STREAM_TDATA;

assign empty_fu_193_p2 = (p_shl_fu_173_p3 - p_shl1_fu_189_p1);

assign icmp_ln82_fu_127_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 10'd784) ? 1'b1 : 1'b0);

assign icmp_ln83_fu_151_p2 = ((ap_sig_allocacmp_j_load == 5'd28) ? 1'b1 : 1'b0);

assign image_pixels_address0 = zext_ln89_fu_218_p1;

assign image_pixels_ce0 = image_pixels_ce0_local;

assign image_pixels_d0 = bitcast_ln89_fu_207_p1;

assign image_pixels_we0 = image_pixels_we0_local;

assign p_shl1_fu_189_p1 = tmp_fu_181_p3;

assign p_shl_fu_173_p3 = {{select_ln82_1_fu_165_p3}, {5'd0}};

assign select_ln82_1_fu_165_p3 = ((icmp_ln83_fu_151_p2[0:0] == 1'b1) ? add_ln82_fu_145_p2 : ap_sig_allocacmp_i_load);

assign select_ln82_fu_157_p3 = ((icmp_ln83_fu_151_p2[0:0] == 1'b1) ? 5'd0 : ap_sig_allocacmp_j_load);

assign tmp_fu_181_p3 = {{select_ln82_1_fu_165_p3}, {2'd0}};

assign zext_ln83_fu_199_p1 = select_ln82_fu_157_p3;

assign zext_ln89_fu_218_p1 = add_ln89_fu_212_p2;

endmodule //MLP_MLP_Pipeline_VITIS_LOOP_82_1_VITIS_LOOP_83_2
