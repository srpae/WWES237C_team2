// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Version: 2022.1.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        real_sample_address0,
        real_sample_ce0,
        real_sample_q0,
        imag_sample_address0,
        imag_sample_ce0,
        imag_sample_q0,
        temp_real_address0,
        temp_real_ce0,
        temp_real_we0,
        temp_real_d0,
        temp_imag_address0,
        temp_imag_ce0,
        temp_imag_we0,
        temp_imag_d0
);

parameter    ap_ST_fsm_pp0_stage0 = 6'd1;
parameter    ap_ST_fsm_pp0_stage1 = 6'd2;
parameter    ap_ST_fsm_pp0_stage2 = 6'd4;
parameter    ap_ST_fsm_pp0_stage3 = 6'd8;
parameter    ap_ST_fsm_pp0_stage4 = 6'd16;
parameter    ap_ST_fsm_pp0_stage5 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [7:0] real_sample_address0;
output   real_sample_ce0;
input  [31:0] real_sample_q0;
output  [7:0] imag_sample_address0;
output   imag_sample_ce0;
input  [31:0] imag_sample_q0;
output  [7:0] temp_real_address0;
output   temp_real_ce0;
output   temp_real_we0;
output  [31:0] temp_real_d0;
output  [7:0] temp_imag_address0;
output   temp_imag_ce0;
output   temp_imag_we0;
output  [31:0] temp_imag_d0;

reg ap_idle;
reg real_sample_ce0;
reg imag_sample_ce0;
reg temp_real_ce0;
reg temp_real_we0;
reg temp_imag_ce0;
reg temp_imag_we0;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage5;
wire    ap_block_state6_pp0_stage5_iter0;
wire    ap_block_state12_pp0_stage5_iter1;
wire    ap_block_state18_pp0_stage5_iter2;
wire    ap_block_pp0_stage5_subdone;
reg   [0:0] icmp_ln12_reg_382;
reg    ap_condition_exit_pp0_iter0_stage5;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [7:0] cos_coefficients_table_address0;
reg    cos_coefficients_table_ce0;
wire   [31:0] cos_coefficients_table_q0;
wire   [7:0] sin_coefficients_table_address0;
reg    sin_coefficients_table_ce0;
wire   [31:0] sin_coefficients_table_q0;
wire   [31:0] grp_fu_160_p2;
reg   [31:0] reg_168;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_state8_pp0_stage1_iter1;
wire    ap_block_state14_pp0_stage1_iter2;
wire    ap_block_state20_pp0_stage1_iter3;
wire    ap_block_pp0_stage1_11001;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state7_pp0_stage0_iter1;
wire    ap_block_state13_pp0_stage0_iter2;
wire    ap_block_state19_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_11001;
reg   [31:0] reg_174;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_state4_pp0_stage3_iter0;
wire    ap_block_state10_pp0_stage3_iter1;
wire    ap_block_state16_pp0_stage3_iter2;
wire    ap_block_state22_pp0_stage3_iter3;
wire    ap_block_pp0_stage3_11001;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_state9_pp0_stage2_iter1;
wire    ap_block_state15_pp0_stage2_iter2;
wire    ap_block_state21_pp0_stage2_iter3;
wire    ap_block_pp0_stage2_11001;
wire   [0:0] icmp_ln12_fu_208_p2;
reg   [0:0] icmp_ln12_reg_382_pp0_iter1_reg;
reg   [0:0] icmp_ln12_reg_382_pp0_iter2_reg;
wire   [0:0] icmp_ln18_fu_226_p2;
reg   [0:0] icmp_ln18_reg_386;
reg   [0:0] icmp_ln18_reg_386_pp0_iter1_reg;
reg   [0:0] icmp_ln18_reg_386_pp0_iter2_reg;
wire   [8:0] select_ln12_fu_232_p3;
reg   [8:0] select_ln12_reg_392;
wire   [8:0] select_ln12_3_fu_246_p3;
reg   [8:0] select_ln12_3_reg_397;
reg   [8:0] select_ln12_3_reg_397_pp0_iter1_reg;
reg   [8:0] select_ln12_3_reg_397_pp0_iter2_reg;
wire   [7:0] mul_ln22_fu_268_p2;
reg   [7:0] mul_ln22_reg_402;
reg   [31:0] real_sample_load_reg_427;
reg   [31:0] imag_sample_load_reg_432;
reg   [31:0] c_reg_437;
reg   [31:0] s_reg_442;
wire   [31:0] bitcast_ln25_fu_289_p1;
reg   [31:0] bitcast_ln25_reg_447;
wire    ap_CS_fsm_pp0_stage4;
wire    ap_block_state5_pp0_stage4_iter0;
wire    ap_block_state11_pp0_stage4_iter1;
wire    ap_block_state17_pp0_stage4_iter2;
wire    ap_block_pp0_stage4_11001;
wire   [31:0] bitcast_ln25_1_fu_293_p1;
reg   [31:0] bitcast_ln25_1_reg_452;
wire    ap_block_pp0_stage5_11001;
wire   [0:0] ifzero_fu_302_p2;
reg   [0:0] ifzero_reg_457;
reg   [0:0] ifzero_reg_457_pp0_iter2_reg;
reg   [0:0] ifzero_reg_457_pp0_iter3_reg;
wire   [31:0] grp_fu_164_p2;
reg   [31:0] mul_reg_461;
reg   [31:0] mul1_reg_466;
reg   [31:0] mul2_reg_471;
reg   [31:0] mul3_reg_476;
wire   [31:0] select_ln12_1_fu_316_p3;
reg   [31:0] select_ln12_1_reg_481;
wire   [31:0] select_ln12_2_fu_326_p3;
reg   [31:0] select_ln12_2_reg_486;
wire   [63:0] zext_ln12_fu_333_p1;
reg   [63:0] zext_ln12_reg_491;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_pp0_stage3_subdone;
wire   [63:0] j_cast2_fu_258_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln22_fu_284_p1;
wire    ap_block_pp0_stage2;
wire    ap_block_pp0_stage3;
reg   [31:0] add3324_fu_62;
reg   [31:0] ap_sig_allocacmp_add3324_load;
wire    ap_loop_init;
reg   [31:0] add15_fu_66;
reg   [31:0] ap_sig_allocacmp_add15_load;
reg   [8:0] j_fu_70;
wire   [8:0] add_ln18_fu_297_p2;
reg   [8:0] i_fu_74;
reg   [16:0] indvar_flatten_fu_78;
wire   [16:0] add_ln12_fu_214_p2;
wire    ap_block_pp0_stage0;
reg   [31:0] grp_fu_160_p0;
reg   [31:0] grp_fu_160_p1;
wire    ap_block_pp0_stage5;
wire    ap_block_pp0_stage4;
reg   [31:0] grp_fu_164_p0;
reg   [31:0] grp_fu_164_p1;
wire   [8:0] add_ln12_1_fu_240_p2;
wire  signed [7:0] mul_ln22_fu_268_p0;
wire  signed [7:0] mul_ln22_fu_268_p1;
reg   [1:0] grp_fu_160_opcode;
wire    ap_block_pp0_stage5_00001;
wire    ap_block_pp0_stage2_00001;
wire    ap_block_pp0_stage4_00001;
wire    ap_block_pp0_stage3_00001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_condition_exit_pp0_iter2_stage3;
reg    ap_idle_pp0_0to1;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [5:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to3;
wire    ap_block_pp0_stage1_subdone;
wire    ap_block_pp0_stage2_subdone;
wire    ap_block_pp0_stage4_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_cos_coefficients_table_ROM_AUTO_1R #(
    .DataWidth( 32 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
cos_coefficients_table_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(cos_coefficients_table_address0),
    .ce0(cos_coefficients_table_ce0),
    .q0(cos_coefficients_table_q0)
);

dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_sin_coefficients_table_ROM_AUTO_1R #(
    .DataWidth( 32 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
sin_coefficients_table_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(sin_coefficients_table_address0),
    .ce0(sin_coefficients_table_ce0),
    .q0(sin_coefficients_table_q0)
);

dft_faddfsub_32ns_32ns_32_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
faddfsub_32ns_32ns_32_5_full_dsp_1_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_160_p0),
    .din1(grp_fu_160_p1),
    .opcode(grp_fu_160_opcode),
    .ce(1'b1),
    .dout(grp_fu_160_p2)
);

dft_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U2(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_164_p0),
    .din1(grp_fu_164_p1),
    .ce(1'b1),
    .dout(grp_fu_164_p2)
);

dft_mul_8s_8s_8_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 8 ))
mul_8s_8s_8_1_1_U3(
    .din0(mul_ln22_fu_268_p0),
    .din1(mul_ln22_fu_268_p1),
    .dout(mul_ln22_fu_268_p2)
);

dft_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage5),
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
        end else if (((1'b0 == ap_block_pp0_stage3_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
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
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage5)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage5_subdone) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage5_subdone) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage5_subdone) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add15_fu_66 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        add15_fu_66 <= reg_168;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add3324_fu_62 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        add3324_fu_62 <= reg_174;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to1 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter2_stage3))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage5_11001) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to1 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter2_stage3))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage5_11001) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_fu_74 <= 9'd0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln12_fu_208_p2 == 1'd0))) begin
        i_fu_74 <= select_ln12_3_fu_246_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_fu_78 <= 17'd0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln12_fu_208_p2 == 1'd0))) begin
        indvar_flatten_fu_78 <= add_ln12_fu_214_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            j_fu_70 <= 9'd0;
        end else if (((icmp_ln12_reg_382 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            j_fu_70 <= add_ln18_fu_297_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_382 == 1'd0) & (1'b0 == ap_block_pp0_stage5_11001) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
        bitcast_ln25_1_reg_452 <= bitcast_ln25_1_fu_293_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_382 == 1'd0) & (1'b0 == ap_block_pp0_stage4_11001) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        bitcast_ln25_reg_447 <= bitcast_ln25_fu_289_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_382 == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        c_reg_437 <= cos_coefficients_table_q0;
        s_reg_442 <= sin_coefficients_table_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        icmp_ln12_reg_382 <= icmp_ln12_fu_208_p2;
        icmp_ln12_reg_382_pp0_iter1_reg <= icmp_ln12_reg_382;
        icmp_ln12_reg_382_pp0_iter2_reg <= icmp_ln12_reg_382_pp0_iter1_reg;
        icmp_ln18_reg_386_pp0_iter1_reg <= icmp_ln18_reg_386;
        icmp_ln18_reg_386_pp0_iter2_reg <= icmp_ln18_reg_386_pp0_iter1_reg;
        select_ln12_1_reg_481 <= select_ln12_1_fu_316_p3;
        select_ln12_3_reg_397_pp0_iter1_reg <= select_ln12_3_reg_397;
        select_ln12_3_reg_397_pp0_iter2_reg <= select_ln12_3_reg_397_pp0_iter1_reg;
        zext_ln12_reg_491[8 : 0] <= zext_ln12_fu_333_p1[8 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln12_fu_208_p2 == 1'd0))) begin
        icmp_ln18_reg_386 <= icmp_ln18_fu_226_p2;
        mul_ln22_reg_402 <= mul_ln22_fu_268_p2;
        select_ln12_3_reg_397 <= select_ln12_3_fu_246_p3;
        select_ln12_reg_392 <= select_ln12_fu_232_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_382 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ifzero_reg_457 <= ifzero_fu_302_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ifzero_reg_457_pp0_iter2_reg <= ifzero_reg_457;
        ifzero_reg_457_pp0_iter3_reg <= ifzero_reg_457_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln12_reg_382 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        imag_sample_load_reg_432 <= imag_sample_q0;
        real_sample_load_reg_427 <= real_sample_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        mul1_reg_466 <= grp_fu_164_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        mul2_reg_471 <= grp_fu_164_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage4_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        mul3_reg_476 <= grp_fu_164_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        mul_reg_461 <= grp_fu_164_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        reg_168 <= grp_fu_160_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)))) begin
        reg_174 <= grp_fu_160_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        select_ln12_2_reg_486 <= select_ln12_2_fu_326_p3;
    end
end

always @ (*) begin
    if (((icmp_ln12_reg_382 == 1'd1) & (1'b0 == ap_block_pp0_stage5_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
        ap_condition_exit_pp0_iter0_stage5 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage5 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage3_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3) & (icmp_ln12_reg_382_pp0_iter2_reg == 1'd1))) begin
        ap_condition_exit_pp0_iter2_stage3 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter2_stage3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage3_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
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
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to1 = 1'b1;
    end else begin
        ap_idle_pp0_0to1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0_1to3 = 1'b1;
    end else begin
        ap_idle_pp0_1to3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage5_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_sig_allocacmp_add15_load = reg_168;
    end else begin
        ap_sig_allocacmp_add15_load = add15_fu_66;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage3) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        ap_sig_allocacmp_add3324_load = reg_174;
    end else begin
        ap_sig_allocacmp_add3324_load = add3324_fu_62;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        cos_coefficients_table_ce0 = 1'b1;
    end else begin
        cos_coefficients_table_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage3_00001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        grp_fu_160_opcode = 2'd1;
    end else if ((((1'b0 == ap_block_pp0_stage4_00001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4)) | ((1'b0 == ap_block_pp0_stage2_00001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage5_00001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5)))) begin
        grp_fu_160_opcode = 2'd0;
    end else begin
        grp_fu_160_opcode = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage4) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        grp_fu_160_p0 = select_ln12_2_reg_486;
    end else if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        grp_fu_160_p0 = select_ln12_1_reg_481;
    end else if (((1'b0 == ap_block_pp0_stage5) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
        grp_fu_160_p0 = mul2_reg_471;
    end else if (((1'b0 == ap_block_pp0_stage3) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        grp_fu_160_p0 = mul_reg_461;
    end else begin
        grp_fu_160_p0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage4) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        grp_fu_160_p1 = reg_174;
    end else if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        grp_fu_160_p1 = reg_168;
    end else if (((1'b0 == ap_block_pp0_stage5) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
        grp_fu_160_p1 = mul3_reg_476;
    end else if (((1'b0 == ap_block_pp0_stage3) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        grp_fu_160_p1 = mul1_reg_466;
    end else begin
        grp_fu_160_p1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        grp_fu_164_p0 = bitcast_ln25_1_reg_452;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_164_p0 = bitcast_ln25_reg_447;
    end else if (((1'b0 == ap_block_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
        grp_fu_164_p0 = bitcast_ln25_1_fu_293_p1;
    end else if (((1'b0 == ap_block_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        grp_fu_164_p0 = bitcast_ln25_fu_289_p1;
    end else begin
        grp_fu_164_p0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5)) | ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        grp_fu_164_p1 = s_reg_442;
    end else if ((((1'b0 == ap_block_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4)) | ((1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        grp_fu_164_p1 = c_reg_437;
    end else begin
        grp_fu_164_p1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        imag_sample_ce0 = 1'b1;
    end else begin
        imag_sample_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        real_sample_ce0 = 1'b1;
    end else begin
        real_sample_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        sin_coefficients_table_ce0 = 1'b1;
    end else begin
        sin_coefficients_table_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        temp_imag_ce0 = 1'b1;
    end else begin
        temp_imag_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (ifzero_reg_457_pp0_iter3_reg == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        temp_imag_we0 = 1'b1;
    end else begin
        temp_imag_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        temp_real_ce0 = 1'b1;
    end else begin
        temp_real_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (ifzero_reg_457_pp0_iter3_reg == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        temp_real_we0 = 1'b1;
    end else begin
        temp_real_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to3 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
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
            if (((ap_idle_pp0_0to1 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter2_stage3))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_pp0_stage4 : begin
            if ((1'b0 == ap_block_pp0_stage4_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end
        end
        ap_ST_fsm_pp0_stage5 : begin
            if ((1'b0 == ap_block_pp0_stage5_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln12_1_fu_240_p2 = (i_fu_74 + 9'd1);

assign add_ln12_fu_214_p2 = (indvar_flatten_fu_78 + 17'd1);

assign add_ln18_fu_297_p2 = (select_ln12_reg_392 + 9'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage4 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_pp0_stage5 = ap_CS_fsm[32'd5];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage3_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage4_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage5_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage2_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage3_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage4_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage5_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state20_pp0_stage1_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state21_pp0_stage2_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state22_pp0_stage3_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage5_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage5;

assign bitcast_ln25_1_fu_293_p1 = imag_sample_load_reg_432;

assign bitcast_ln25_fu_289_p1 = real_sample_load_reg_427;

assign cos_coefficients_table_address0 = zext_ln22_fu_284_p1;

assign icmp_ln12_fu_208_p2 = ((indvar_flatten_fu_78 == 17'd65536) ? 1'b1 : 1'b0);

assign icmp_ln18_fu_226_p2 = ((j_fu_70 == 9'd256) ? 1'b1 : 1'b0);

assign ifzero_fu_302_p2 = ((add_ln18_fu_297_p2 == 9'd256) ? 1'b1 : 1'b0);

assign imag_sample_address0 = j_cast2_fu_258_p1;

assign j_cast2_fu_258_p1 = select_ln12_fu_232_p3;

assign mul_ln22_fu_268_p0 = select_ln12_fu_232_p3[7:0];

assign mul_ln22_fu_268_p1 = select_ln12_3_fu_246_p3[7:0];

assign real_sample_address0 = j_cast2_fu_258_p1;

assign select_ln12_1_fu_316_p3 = ((icmp_ln18_reg_386_pp0_iter1_reg[0:0] == 1'b1) ? 32'd0 : ap_sig_allocacmp_add15_load);

assign select_ln12_2_fu_326_p3 = ((icmp_ln18_reg_386_pp0_iter2_reg[0:0] == 1'b1) ? 32'd0 : ap_sig_allocacmp_add3324_load);

assign select_ln12_3_fu_246_p3 = ((icmp_ln18_fu_226_p2[0:0] == 1'b1) ? add_ln12_1_fu_240_p2 : i_fu_74);

assign select_ln12_fu_232_p3 = ((icmp_ln18_fu_226_p2[0:0] == 1'b1) ? 9'd0 : j_fu_70);

assign sin_coefficients_table_address0 = zext_ln22_fu_284_p1;

assign temp_imag_address0 = zext_ln12_reg_491;

assign temp_imag_d0 = reg_174;

assign temp_real_address0 = zext_ln12_fu_333_p1;

assign temp_real_d0 = reg_168;

assign zext_ln12_fu_333_p1 = select_ln12_3_reg_397_pp0_iter2_reg;

assign zext_ln22_fu_284_p1 = mul_ln22_reg_402;

always @ (posedge ap_clk) begin
    zext_ln12_reg_491[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;
end

endmodule //dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2
