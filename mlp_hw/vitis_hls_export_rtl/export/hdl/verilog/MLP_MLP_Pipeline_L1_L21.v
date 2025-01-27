// ==============================================================
// Generated by Vitis HLS v2024.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module MLP_MLP_Pipeline_L1_L21 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        l_hidden2_outputs_address0,
        l_hidden2_outputs_ce0,
        l_hidden2_outputs_q0,
        l_out_outputs_address0,
        l_out_outputs_ce0,
        l_out_outputs_we0,
        l_out_outputs_d0,
        grp_fu_1655_p_din0,
        grp_fu_1655_p_din1,
        grp_fu_1655_p_opcode,
        grp_fu_1655_p_dout0,
        grp_fu_1655_p_ce,
        grp_fu_1659_p_din0,
        grp_fu_1659_p_din1,
        grp_fu_1659_p_dout0,
        grp_fu_1659_p_ce,
        grp_fu_1663_p_din0,
        grp_fu_1663_p_dout0,
        grp_fu_1663_p_ce,
        grp_fu_1666_p_din0,
        grp_fu_1666_p_dout0,
        grp_fu_1666_p_ce,
        grp_fu_1669_p_din0,
        grp_fu_1669_p_din1,
        grp_fu_1669_p_dout0,
        grp_fu_1669_p_ce,
        grp_fu_1673_p_din0,
        grp_fu_1673_p_din1,
        grp_fu_1673_p_opcode,
        grp_fu_1673_p_dout0,
        grp_fu_1673_p_ce,
        grp_fu_1677_p_din0,
        grp_fu_1677_p_din1,
        grp_fu_1677_p_dout0,
        grp_fu_1677_p_ce
);

parameter    ap_ST_fsm_pp0_stage0 = 4'd1;
parameter    ap_ST_fsm_pp0_stage1 = 4'd2;
parameter    ap_ST_fsm_pp0_stage2 = 4'd4;
parameter    ap_ST_fsm_pp0_stage3 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [6:0] l_hidden2_outputs_address0;
output   l_hidden2_outputs_ce0;
input  [31:0] l_hidden2_outputs_q0;
output  [3:0] l_out_outputs_address0;
output   l_out_outputs_ce0;
output   l_out_outputs_we0;
output  [31:0] l_out_outputs_d0;
output  [31:0] grp_fu_1655_p_din0;
output  [31:0] grp_fu_1655_p_din1;
output  [1:0] grp_fu_1655_p_opcode;
input  [31:0] grp_fu_1655_p_dout0;
output   grp_fu_1655_p_ce;
output  [31:0] grp_fu_1659_p_din0;
output  [31:0] grp_fu_1659_p_din1;
input  [31:0] grp_fu_1659_p_dout0;
output   grp_fu_1659_p_ce;
output  [63:0] grp_fu_1663_p_din0;
input  [31:0] grp_fu_1663_p_dout0;
output   grp_fu_1663_p_ce;
output  [31:0] grp_fu_1666_p_din0;
input  [63:0] grp_fu_1666_p_dout0;
output   grp_fu_1666_p_ce;
output  [31:0] grp_fu_1669_p_din0;
output  [31:0] grp_fu_1669_p_din1;
input  [31:0] grp_fu_1669_p_dout0;
output   grp_fu_1669_p_ce;
output  [63:0] grp_fu_1673_p_din0;
output  [63:0] grp_fu_1673_p_din1;
output  [1:0] grp_fu_1673_p_opcode;
input  [63:0] grp_fu_1673_p_dout0;
output   grp_fu_1673_p_ce;
output  [63:0] grp_fu_1677_p_din0;
output  [63:0] grp_fu_1677_p_din1;
input  [63:0] grp_fu_1677_p_dout0;
output   grp_fu_1677_p_ce;

reg ap_idle;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_enable_reg_pp0_iter10;
reg    ap_enable_reg_pp0_iter11;
reg    ap_enable_reg_pp0_iter12;
reg    ap_enable_reg_pp0_iter13;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_pp0_stage3_subdone;
reg   [0:0] icmp_ln59_reg_368;
reg    ap_condition_exit_pp0_iter0_stage3;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [10:0] WeightOut_address0;
wire   [31:0] WeightOut_q0;
wire   [3:0] BiasesOut_address0;
wire   [31:0] BiasesOut_q0;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln59_fu_184_p2;
reg   [0:0] icmp_ln59_reg_368_pp0_iter1_reg;
reg   [0:0] icmp_ln59_reg_368_pp0_iter2_reg;
reg   [0:0] icmp_ln59_reg_368_pp0_iter3_reg;
reg   [0:0] icmp_ln59_reg_368_pp0_iter4_reg;
reg   [0:0] icmp_ln59_reg_368_pp0_iter5_reg;
reg   [0:0] icmp_ln59_reg_368_pp0_iter6_reg;
reg   [0:0] icmp_ln59_reg_368_pp0_iter7_reg;
reg   [0:0] icmp_ln59_reg_368_pp0_iter8_reg;
reg   [0:0] icmp_ln59_reg_368_pp0_iter9_reg;
reg   [0:0] icmp_ln59_reg_368_pp0_iter10_reg;
reg   [0:0] icmp_ln59_reg_368_pp0_iter11_reg;
reg   [0:0] icmp_ln59_reg_368_pp0_iter12_reg;
wire   [0:0] icmp_ln62_fu_208_p2;
reg   [0:0] icmp_ln62_reg_372;
reg   [0:0] icmp_ln62_reg_372_pp0_iter1_reg;
wire   [3:0] select_ln59_2_fu_222_p3;
reg   [3:0] select_ln59_2_reg_377;
reg   [3:0] select_ln59_2_reg_377_pp0_iter1_reg;
wire   [0:0] icmp_ln62_1_fu_264_p2;
reg   [0:0] icmp_ln62_1_reg_392;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter1_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter2_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter3_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter4_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter5_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter6_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter7_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter8_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter9_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter10_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter11_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter12_reg;
reg   [0:0] icmp_ln62_1_reg_392_pp0_iter13_reg;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1_11001;
reg   [31:0] mul_i2_reg_406;
wire   [31:0] select_ln59_1_fu_288_p3;
reg   [3:0] l_out_outputs_addr_1_reg_421;
reg   [3:0] l_out_outputs_addr_1_reg_421_pp0_iter3_reg;
reg   [3:0] l_out_outputs_addr_1_reg_421_pp0_iter4_reg;
reg   [3:0] l_out_outputs_addr_1_reg_421_pp0_iter5_reg;
reg   [3:0] l_out_outputs_addr_1_reg_421_pp0_iter6_reg;
reg   [3:0] l_out_outputs_addr_1_reg_421_pp0_iter7_reg;
reg   [3:0] l_out_outputs_addr_1_reg_421_pp0_iter8_reg;
reg   [3:0] l_out_outputs_addr_1_reg_421_pp0_iter9_reg;
reg   [3:0] l_out_outputs_addr_1_reg_421_pp0_iter10_reg;
reg   [3:0] l_out_outputs_addr_1_reg_421_pp0_iter11_reg;
reg   [3:0] l_out_outputs_addr_1_reg_421_pp0_iter12_reg;
reg   [3:0] l_out_outputs_addr_1_reg_421_pp0_iter13_reg;
reg   [31:0] aux_1_reg_426;
reg   [31:0] BiasesOut_load_reg_431;
reg   [31:0] aux_2_reg_436;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_pp0_stage2_11001;
wire   [31:0] bitcast_ln16_1_fu_335_p1;
wire    ap_block_pp0_stage3_11001;
reg   [31:0] tmp_2_reg_446;
reg   [63:0] conv_i_i2_reg_451;
reg   [63:0] add_i_i2_reg_456;
reg   [63:0] div_i_i2_reg_461;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_pp0_stage1_subdone;
wire   [63:0] zext_ln63_1_fu_253_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln62_fu_238_p1;
wire   [63:0] zext_ln59_fu_296_p1;
reg   [31:0] aux_fu_62;
reg   [31:0] ap_sig_allocacmp_aux_load;
wire    ap_block_pp0_stage1;
wire    ap_loop_init;
reg   [7:0] j_fu_66;
wire   [7:0] add_ln62_fu_258_p2;
reg   [7:0] ap_sig_allocacmp_j_load;
reg   [3:0] i_fu_70;
reg   [3:0] ap_sig_allocacmp_i_load;
reg   [10:0] indvar_flatten140_fu_74;
wire   [10:0] add_ln59_1_fu_190_p2;
reg   [10:0] ap_sig_allocacmp_indvar_flatten140_load;
reg    l_hidden2_outputs_ce0_local;
reg    WeightOut_ce0_local;
reg    BiasesOut_ce0_local;
reg    l_out_outputs_we0_local;
reg    l_out_outputs_ce0_local;
reg   [31:0] grp_fu_129_p0;
reg   [31:0] grp_fu_129_p1;
wire    ap_block_pp0_stage2;
wire    ap_block_pp0_stage3;
wire   [3:0] add_ln59_fu_202_p2;
wire   [7:0] select_ln59_fu_214_p3;
wire   [10:0] tmp_6_fu_230_p3;
wire   [10:0] zext_ln63_fu_243_p1;
wire   [10:0] add_ln63_fu_247_p2;
wire   [31:0] bitcast_ln16_fu_306_p1;
wire   [0:0] bit_sel2_fu_309_p3;
wire   [0:0] xor_ln16_fu_317_p2;
wire   [30:0] trunc_ln16_fu_323_p1;
wire   [31:0] xor_ln16_2_fu_327_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_condition_exit_pp0_iter12_stage1;
reg    ap_idle_pp0_0to11;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg    ap_loop_exit_ready_pp0_iter6_reg;
reg    ap_loop_exit_ready_pp0_iter7_reg;
reg    ap_loop_exit_ready_pp0_iter8_reg;
reg    ap_loop_exit_ready_pp0_iter9_reg;
reg    ap_loop_exit_ready_pp0_iter10_reg;
reg    ap_loop_exit_ready_pp0_iter11_reg;
reg    ap_loop_exit_ready_pp0_iter12_reg;
reg   [3:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to13;
wire    ap_block_pp0_stage2_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire    ap_block_pp0_stage1_00001;
wire    ap_block_pp0_stage2_00001;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter11 = 1'b0;
#0 ap_enable_reg_pp0_iter12 = 1'b0;
#0 ap_enable_reg_pp0_iter13 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 aux_fu_62 = 32'd0;
#0 j_fu_66 = 8'd0;
#0 i_fu_70 = 4'd0;
#0 indvar_flatten140_fu_74 = 11'd0;
#0 ap_done_reg = 1'b0;
end

MLP_MLP_Pipeline_L1_L21_WeightOut_ROM_AUTO_1R #(
    .DataWidth( 32 ),
    .AddressRange( 1280 ),
    .AddressWidth( 11 ))
WeightOut_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(WeightOut_address0),
    .ce0(WeightOut_ce0_local),
    .q0(WeightOut_q0)
);

MLP_MLP_Pipeline_L1_L21_BiasesOut_ROM_AUTO_1R #(
    .DataWidth( 32 ),
    .AddressRange( 10 ),
    .AddressWidth( 4 ))
BiasesOut_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(BiasesOut_address0),
    .ce0(BiasesOut_ce0_local),
    .q0(BiasesOut_q0)
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
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage3),
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
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_loop_exit_ready_pp0_iter12_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
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
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage3)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter11 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter12 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter13 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter13 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter13 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter8 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter9 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter10_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter10_reg <= ap_loop_exit_ready_pp0_iter9_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter11_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter11_reg <= ap_loop_exit_ready_pp0_iter10_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter12_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter12_reg <= ap_loop_exit_ready_pp0_iter11_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter3_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter4_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter5_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter6_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter7_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter8_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
        ap_loop_exit_ready_pp0_iter9_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        aux_fu_62 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        aux_fu_62 <= grp_fu_1655_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln59_fu_184_p2 == 1'd0))) begin
            i_fu_70 <= select_ln59_2_fu_222_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_70 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln59_fu_184_p2 == 1'd0))) begin
            indvar_flatten140_fu_74 <= add_ln59_1_fu_190_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten140_fu_74 <= 11'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln59_fu_184_p2 == 1'd0))) begin
            j_fu_66 <= add_ln62_fu_258_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_66 <= 8'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        BiasesOut_load_reg_431 <= BiasesOut_q0;
        add_i_i2_reg_456 <= grp_fu_1673_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        aux_1_reg_426 <= grp_fu_1655_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        aux_2_reg_436 <= grp_fu_1655_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        conv_i_i2_reg_451 <= grp_fu_1666_p_dout0;
        icmp_ln59_reg_368 <= icmp_ln59_fu_184_p2;
        icmp_ln59_reg_368_pp0_iter10_reg <= icmp_ln59_reg_368_pp0_iter9_reg;
        icmp_ln59_reg_368_pp0_iter11_reg <= icmp_ln59_reg_368_pp0_iter10_reg;
        icmp_ln59_reg_368_pp0_iter12_reg <= icmp_ln59_reg_368_pp0_iter11_reg;
        icmp_ln59_reg_368_pp0_iter1_reg <= icmp_ln59_reg_368;
        icmp_ln59_reg_368_pp0_iter2_reg <= icmp_ln59_reg_368_pp0_iter1_reg;
        icmp_ln59_reg_368_pp0_iter3_reg <= icmp_ln59_reg_368_pp0_iter2_reg;
        icmp_ln59_reg_368_pp0_iter4_reg <= icmp_ln59_reg_368_pp0_iter3_reg;
        icmp_ln59_reg_368_pp0_iter5_reg <= icmp_ln59_reg_368_pp0_iter4_reg;
        icmp_ln59_reg_368_pp0_iter6_reg <= icmp_ln59_reg_368_pp0_iter5_reg;
        icmp_ln59_reg_368_pp0_iter7_reg <= icmp_ln59_reg_368_pp0_iter6_reg;
        icmp_ln59_reg_368_pp0_iter8_reg <= icmp_ln59_reg_368_pp0_iter7_reg;
        icmp_ln59_reg_368_pp0_iter9_reg <= icmp_ln59_reg_368_pp0_iter8_reg;
        icmp_ln62_1_reg_392 <= icmp_ln62_1_fu_264_p2;
        icmp_ln62_1_reg_392_pp0_iter10_reg <= icmp_ln62_1_reg_392_pp0_iter9_reg;
        icmp_ln62_1_reg_392_pp0_iter11_reg <= icmp_ln62_1_reg_392_pp0_iter10_reg;
        icmp_ln62_1_reg_392_pp0_iter12_reg <= icmp_ln62_1_reg_392_pp0_iter11_reg;
        icmp_ln62_1_reg_392_pp0_iter13_reg <= icmp_ln62_1_reg_392_pp0_iter12_reg;
        icmp_ln62_1_reg_392_pp0_iter1_reg <= icmp_ln62_1_reg_392;
        icmp_ln62_1_reg_392_pp0_iter2_reg <= icmp_ln62_1_reg_392_pp0_iter1_reg;
        icmp_ln62_1_reg_392_pp0_iter3_reg <= icmp_ln62_1_reg_392_pp0_iter2_reg;
        icmp_ln62_1_reg_392_pp0_iter4_reg <= icmp_ln62_1_reg_392_pp0_iter3_reg;
        icmp_ln62_1_reg_392_pp0_iter5_reg <= icmp_ln62_1_reg_392_pp0_iter4_reg;
        icmp_ln62_1_reg_392_pp0_iter6_reg <= icmp_ln62_1_reg_392_pp0_iter5_reg;
        icmp_ln62_1_reg_392_pp0_iter7_reg <= icmp_ln62_1_reg_392_pp0_iter6_reg;
        icmp_ln62_1_reg_392_pp0_iter8_reg <= icmp_ln62_1_reg_392_pp0_iter7_reg;
        icmp_ln62_1_reg_392_pp0_iter9_reg <= icmp_ln62_1_reg_392_pp0_iter8_reg;
        icmp_ln62_reg_372 <= icmp_ln62_fu_208_p2;
        icmp_ln62_reg_372_pp0_iter1_reg <= icmp_ln62_reg_372;
        l_out_outputs_addr_1_reg_421 <= zext_ln59_fu_296_p1;
        l_out_outputs_addr_1_reg_421_pp0_iter10_reg <= l_out_outputs_addr_1_reg_421_pp0_iter9_reg;
        l_out_outputs_addr_1_reg_421_pp0_iter11_reg <= l_out_outputs_addr_1_reg_421_pp0_iter10_reg;
        l_out_outputs_addr_1_reg_421_pp0_iter12_reg <= l_out_outputs_addr_1_reg_421_pp0_iter11_reg;
        l_out_outputs_addr_1_reg_421_pp0_iter13_reg <= l_out_outputs_addr_1_reg_421_pp0_iter12_reg;
        l_out_outputs_addr_1_reg_421_pp0_iter3_reg <= l_out_outputs_addr_1_reg_421;
        l_out_outputs_addr_1_reg_421_pp0_iter4_reg <= l_out_outputs_addr_1_reg_421_pp0_iter3_reg;
        l_out_outputs_addr_1_reg_421_pp0_iter5_reg <= l_out_outputs_addr_1_reg_421_pp0_iter4_reg;
        l_out_outputs_addr_1_reg_421_pp0_iter6_reg <= l_out_outputs_addr_1_reg_421_pp0_iter5_reg;
        l_out_outputs_addr_1_reg_421_pp0_iter7_reg <= l_out_outputs_addr_1_reg_421_pp0_iter6_reg;
        l_out_outputs_addr_1_reg_421_pp0_iter8_reg <= l_out_outputs_addr_1_reg_421_pp0_iter7_reg;
        l_out_outputs_addr_1_reg_421_pp0_iter9_reg <= l_out_outputs_addr_1_reg_421_pp0_iter8_reg;
        mul_i2_reg_406 <= grp_fu_1659_p_dout0;
        select_ln59_2_reg_377 <= select_ln59_2_fu_222_p3;
        select_ln59_2_reg_377_pp0_iter1_reg <= select_ln59_2_reg_377;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        div_i_i2_reg_461 <= grp_fu_1677_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        tmp_2_reg_446 <= grp_fu_1669_p_dout0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        BiasesOut_ce0_local = 1'b1;
    end else begin
        BiasesOut_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        WeightOut_ce0_local = 1'b1;
    end else begin
        WeightOut_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln59_reg_368 == 1'd1) & (1'b0 == ap_block_pp0_stage3_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_condition_exit_pp0_iter0_stage3 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter12 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln59_reg_368_pp0_iter12_reg == 1'd1))) begin
        ap_condition_exit_pp0_iter12_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter12_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_loop_exit_ready_pp0_iter12_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
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
    if (((ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to11 = 1'b1;
    end else begin
        ap_idle_pp0_0to11 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0_1to13 = 1'b1;
    end else begin
        ap_idle_pp0_1to13 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage3_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_sig_allocacmp_aux_load = grp_fu_1655_p_dout0;
    end else begin
        ap_sig_allocacmp_aux_load = aux_fu_62;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_load = 4'd0;
    end else begin
        ap_sig_allocacmp_i_load = i_fu_70;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten140_load = 11'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten140_load = indvar_flatten140_fu_74;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_j_load = 8'd0;
    end else begin
        ap_sig_allocacmp_j_load = j_fu_66;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        grp_fu_129_p0 = aux_1_reg_426;
    end else if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        grp_fu_129_p0 = select_ln59_1_fu_288_p3;
    end else begin
        grp_fu_129_p0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        grp_fu_129_p1 = BiasesOut_load_reg_431;
    end else if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        grp_fu_129_p1 = mul_i2_reg_406;
    end else begin
        grp_fu_129_p1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        l_hidden2_outputs_ce0_local = 1'b1;
    end else begin
        l_hidden2_outputs_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter13 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        l_out_outputs_ce0_local = 1'b1;
    end else begin
        l_out_outputs_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter13 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln62_1_reg_392_pp0_iter13_reg == 1'd1))) begin
        l_out_outputs_we0_local = 1'b1;
    end else begin
        l_out_outputs_we0_local = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to13 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if (((ap_idle_pp0_0to11 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter12_stage1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign BiasesOut_address0 = zext_ln59_fu_296_p1;

assign WeightOut_address0 = zext_ln63_1_fu_253_p1;

assign add_ln59_1_fu_190_p2 = (ap_sig_allocacmp_indvar_flatten140_load + 11'd1);

assign add_ln59_fu_202_p2 = (ap_sig_allocacmp_i_load + 4'd1);

assign add_ln62_fu_258_p2 = (select_ln59_fu_214_p3 + 8'd1);

assign add_ln63_fu_247_p2 = (tmp_6_fu_230_p3 + zext_ln63_fu_243_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_subdone = ~(1'b1 == 1'b1);

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage3;

assign ap_ready = ap_ready_sig;

assign bit_sel2_fu_309_p3 = bitcast_ln16_fu_306_p1[32'd31];

assign bitcast_ln16_1_fu_335_p1 = xor_ln16_2_fu_327_p3;

assign bitcast_ln16_fu_306_p1 = aux_2_reg_436;

assign grp_fu_1655_p_ce = 1'b1;

assign grp_fu_1655_p_din0 = grp_fu_129_p0;

assign grp_fu_1655_p_din1 = grp_fu_129_p1;

assign grp_fu_1655_p_opcode = 2'd0;

assign grp_fu_1659_p_ce = 1'b1;

assign grp_fu_1659_p_din0 = l_hidden2_outputs_q0;

assign grp_fu_1659_p_din1 = WeightOut_q0;

assign grp_fu_1663_p_ce = 1'b1;

assign grp_fu_1663_p_din0 = div_i_i2_reg_461;

assign grp_fu_1666_p_ce = 1'b1;

assign grp_fu_1666_p_din0 = tmp_2_reg_446;

assign grp_fu_1669_p_ce = 1'b1;

assign grp_fu_1669_p_din0 = 32'd0;

assign grp_fu_1669_p_din1 = bitcast_ln16_1_fu_335_p1;

assign grp_fu_1673_p_ce = 1'b1;

assign grp_fu_1673_p_din0 = conv_i_i2_reg_451;

assign grp_fu_1673_p_din1 = 64'd4607182418800017408;

assign grp_fu_1673_p_opcode = 2'd0;

assign grp_fu_1677_p_ce = 1'b1;

assign grp_fu_1677_p_din0 = 64'd4607182418800017408;

assign grp_fu_1677_p_din1 = add_i_i2_reg_456;

assign icmp_ln59_fu_184_p2 = ((ap_sig_allocacmp_indvar_flatten140_load == 11'd1280) ? 1'b1 : 1'b0);

assign icmp_ln62_1_fu_264_p2 = ((add_ln62_fu_258_p2 == 8'd128) ? 1'b1 : 1'b0);

assign icmp_ln62_fu_208_p2 = ((ap_sig_allocacmp_j_load == 8'd128) ? 1'b1 : 1'b0);

assign l_hidden2_outputs_address0 = zext_ln62_fu_238_p1;

assign l_hidden2_outputs_ce0 = l_hidden2_outputs_ce0_local;

assign l_out_outputs_address0 = l_out_outputs_addr_1_reg_421_pp0_iter13_reg;

assign l_out_outputs_ce0 = l_out_outputs_ce0_local;

assign l_out_outputs_d0 = grp_fu_1663_p_dout0;

assign l_out_outputs_we0 = l_out_outputs_we0_local;

assign select_ln59_1_fu_288_p3 = ((icmp_ln62_reg_372_pp0_iter1_reg[0:0] == 1'b1) ? 32'd0 : ap_sig_allocacmp_aux_load);

assign select_ln59_2_fu_222_p3 = ((icmp_ln62_fu_208_p2[0:0] == 1'b1) ? add_ln59_fu_202_p2 : ap_sig_allocacmp_i_load);

assign select_ln59_fu_214_p3 = ((icmp_ln62_fu_208_p2[0:0] == 1'b1) ? 8'd0 : ap_sig_allocacmp_j_load);

assign tmp_6_fu_230_p3 = {{select_ln59_2_fu_222_p3}, {7'd0}};

assign trunc_ln16_fu_323_p1 = bitcast_ln16_fu_306_p1[30:0];

assign xor_ln16_2_fu_327_p3 = {{xor_ln16_fu_317_p2}, {trunc_ln16_fu_323_p1}};

assign xor_ln16_fu_317_p2 = (bit_sel2_fu_309_p3 ^ 1'd1);

assign zext_ln59_fu_296_p1 = select_ln59_2_reg_377_pp0_iter1_reg;

assign zext_ln62_fu_238_p1 = select_ln59_fu_214_p3;

assign zext_ln63_1_fu_253_p1 = add_ln63_fu_247_p2;

assign zext_ln63_fu_243_p1 = select_ln59_fu_214_p3;

endmodule //MLP_MLP_Pipeline_L1_L21
