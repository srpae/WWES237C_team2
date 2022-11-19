-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
-- Version: 2022.1.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dft is
generic (
    C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER := 13;
    C_S_AXI_CONTROL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    interrupt : OUT STD_LOGIC );
end;


architecture behav of dft is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "dft_dft,hls_ip_2022_1_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.958120,HLS_SYN_LAT=524625,HLS_SYN_TPT=none,HLS_SYN_MEM=20,HLS_SYN_DSP=0,HLS_SYN_FF=10246,HLS_SYN_LUT=9821,HLS_VERSION=2022_1_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_ready : STD_LOGIC;
    signal sample_real_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sample_real_ce0 : STD_LOGIC;
    signal sample_real_we0 : STD_LOGIC;
    signal sample_real_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal sample_imag_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sample_imag_ce0 : STD_LOGIC;
    signal sample_imag_we0 : STD_LOGIC;
    signal sample_imag_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal temp_real_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal temp_real_ce0 : STD_LOGIC;
    signal temp_real_we0 : STD_LOGIC;
    signal temp_real_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal temp_imag_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal temp_imag_ce0 : STD_LOGIC;
    signal temp_imag_we0 : STD_LOGIC;
    signal temp_imag_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_start : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_done : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_idle : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_ready : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_real_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_real_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_imag_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_imag_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_we0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_d0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_we0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_d0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_start : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_done : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_idle : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_ready : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_real_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_real_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_we0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_d0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_imag_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_imag_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_ce0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_we0 : STD_LOGIC;
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_d0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component dft_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        sample_real_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        sample_real_ce0 : OUT STD_LOGIC;
        sample_real_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
        sample_imag_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        sample_imag_ce0 : OUT STD_LOGIC;
        sample_imag_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
        temp_real_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        temp_real_ce0 : OUT STD_LOGIC;
        temp_real_we0 : OUT STD_LOGIC;
        temp_real_d0 : OUT STD_LOGIC_VECTOR (63 downto 0);
        temp_imag_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        temp_imag_ce0 : OUT STD_LOGIC;
        temp_imag_we0 : OUT STD_LOGIC;
        temp_imag_d0 : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component dft_dft_Pipeline_VITIS_LOOP_39_3 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        temp_real_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        temp_real_ce0 : OUT STD_LOGIC;
        temp_real_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
        sample_real_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        sample_real_ce0 : OUT STD_LOGIC;
        sample_real_we0 : OUT STD_LOGIC;
        sample_real_d0 : OUT STD_LOGIC_VECTOR (63 downto 0);
        temp_imag_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        temp_imag_ce0 : OUT STD_LOGIC;
        temp_imag_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
        sample_imag_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        sample_imag_ce0 : OUT STD_LOGIC;
        sample_imag_we0 : OUT STD_LOGIC;
        sample_imag_d0 : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component dft_temp_real_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (7 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (63 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component dft_control_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        sample_real_address0 : IN STD_LOGIC_VECTOR (7 downto 0);
        sample_real_ce0 : IN STD_LOGIC;
        sample_real_we0 : IN STD_LOGIC;
        sample_real_d0 : IN STD_LOGIC_VECTOR (63 downto 0);
        sample_real_q0 : OUT STD_LOGIC_VECTOR (63 downto 0);
        sample_imag_address0 : IN STD_LOGIC_VECTOR (7 downto 0);
        sample_imag_ce0 : IN STD_LOGIC;
        sample_imag_we0 : IN STD_LOGIC;
        sample_imag_d0 : IN STD_LOGIC_VECTOR (63 downto 0);
        sample_imag_q0 : OUT STD_LOGIC_VECTOR (63 downto 0);
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC );
    end component;



begin
    temp_real_U : component dft_temp_real_RAM_AUTO_1R1W
    generic map (
        DataWidth => 64,
        AddressRange => 256,
        AddressWidth => 8)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => temp_real_address0,
        ce0 => temp_real_ce0,
        we0 => temp_real_we0,
        d0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_d0,
        q0 => temp_real_q0);

    temp_imag_U : component dft_temp_real_RAM_AUTO_1R1W
    generic map (
        DataWidth => 64,
        AddressRange => 256,
        AddressWidth => 8)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => temp_imag_address0,
        ce0 => temp_imag_ce0,
        we0 => temp_imag_we0,
        d0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_d0,
        q0 => temp_imag_q0);

    grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62 : component dft_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_start,
        ap_done => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_done,
        ap_idle => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_idle,
        ap_ready => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_ready,
        sample_real_address0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_real_address0,
        sample_real_ce0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_real_ce0,
        sample_real_q0 => sample_real_q0,
        sample_imag_address0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_imag_address0,
        sample_imag_ce0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_imag_ce0,
        sample_imag_q0 => sample_imag_q0,
        temp_real_address0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_address0,
        temp_real_ce0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_ce0,
        temp_real_we0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_we0,
        temp_real_d0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_d0,
        temp_imag_address0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_address0,
        temp_imag_ce0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_ce0,
        temp_imag_we0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_we0,
        temp_imag_d0 => grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_d0);

    grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86 : component dft_dft_Pipeline_VITIS_LOOP_39_3
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_start,
        ap_done => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_done,
        ap_idle => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_idle,
        ap_ready => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_ready,
        temp_real_address0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_real_address0,
        temp_real_ce0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_real_ce0,
        temp_real_q0 => temp_real_q0,
        sample_real_address0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_address0,
        sample_real_ce0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_ce0,
        sample_real_we0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_we0,
        sample_real_d0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_d0,
        temp_imag_address0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_imag_address0,
        temp_imag_ce0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_imag_ce0,
        temp_imag_q0 => temp_imag_q0,
        sample_imag_address0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_address0,
        sample_imag_ce0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_ce0,
        sample_imag_we0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_we0,
        sample_imag_d0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_d0);

    control_s_axi_U : component dft_control_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CONTROL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CONTROL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_control_AWVALID,
        AWREADY => s_axi_control_AWREADY,
        AWADDR => s_axi_control_AWADDR,
        WVALID => s_axi_control_WVALID,
        WREADY => s_axi_control_WREADY,
        WDATA => s_axi_control_WDATA,
        WSTRB => s_axi_control_WSTRB,
        ARVALID => s_axi_control_ARVALID,
        ARREADY => s_axi_control_ARREADY,
        ARADDR => s_axi_control_ARADDR,
        RVALID => s_axi_control_RVALID,
        RREADY => s_axi_control_RREADY,
        RDATA => s_axi_control_RDATA,
        RRESP => s_axi_control_RRESP,
        BVALID => s_axi_control_BVALID,
        BREADY => s_axi_control_BREADY,
        BRESP => s_axi_control_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        sample_real_address0 => sample_real_address0,
        sample_real_ce0 => sample_real_ce0,
        sample_real_we0 => sample_real_we0,
        sample_real_d0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_d0,
        sample_real_q0 => sample_real_q0,
        sample_imag_address0 => sample_imag_address0,
        sample_imag_ce0 => sample_imag_ce0,
        sample_imag_we0 => sample_imag_we0,
        sample_imag_d0 => grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_d0,
        sample_imag_q0 => sample_imag_q0,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_ready = ap_const_logic_1)) then 
                    grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_ready = ap_const_logic_1)) then 
                    grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_done, grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_done, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_done)
    begin
        if ((grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_done)
    begin
        if ((grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_done, ap_CS_fsm_state4)
    begin
        if (((grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_done, ap_CS_fsm_state4)
    begin
        if (((grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_start <= grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_ap_start_reg;
    grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_start <= grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_ap_start_reg;

    sample_imag_address0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_imag_address0, grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_address0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            sample_imag_address0 <= grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            sample_imag_address0 <= grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_imag_address0;
        else 
            sample_imag_address0 <= "XXXXXXXX";
        end if; 
    end process;


    sample_imag_ce0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_imag_ce0, grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_ce0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            sample_imag_ce0 <= grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            sample_imag_ce0 <= grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_imag_ce0;
        else 
            sample_imag_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    sample_imag_we0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_we0, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            sample_imag_we0 <= grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_imag_we0;
        else 
            sample_imag_we0 <= ap_const_logic_0;
        end if; 
    end process;


    sample_real_address0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_real_address0, grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_address0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            sample_real_address0 <= grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            sample_real_address0 <= grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_real_address0;
        else 
            sample_real_address0 <= "XXXXXXXX";
        end if; 
    end process;


    sample_real_ce0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_real_ce0, grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_ce0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            sample_real_ce0 <= grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            sample_real_ce0 <= grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_sample_real_ce0;
        else 
            sample_real_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    sample_real_we0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_we0, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            sample_real_we0 <= grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_sample_real_we0;
        else 
            sample_real_we0 <= ap_const_logic_0;
        end if; 
    end process;


    temp_imag_address0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_address0, grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_imag_address0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            temp_imag_address0 <= grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_imag_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            temp_imag_address0 <= grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_address0;
        else 
            temp_imag_address0 <= "XXXXXXXX";
        end if; 
    end process;


    temp_imag_ce0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_ce0, grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_imag_ce0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            temp_imag_ce0 <= grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_imag_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            temp_imag_ce0 <= grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_ce0;
        else 
            temp_imag_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    temp_imag_we0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_we0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            temp_imag_we0 <= grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_imag_we0;
        else 
            temp_imag_we0 <= ap_const_logic_0;
        end if; 
    end process;


    temp_real_address0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_address0, grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_real_address0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            temp_real_address0 <= grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_real_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            temp_real_address0 <= grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_address0;
        else 
            temp_real_address0 <= "XXXXXXXX";
        end if; 
    end process;


    temp_real_ce0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_ce0, grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_real_ce0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            temp_real_ce0 <= grp_dft_Pipeline_VITIS_LOOP_39_3_fu_86_temp_real_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            temp_real_ce0 <= grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_ce0;
        else 
            temp_real_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    temp_real_we0_assign_proc : process(grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_we0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            temp_real_we0 <= grp_dft_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_27_2_fu_62_temp_real_we0;
        else 
            temp_real_we0 <= ap_const_logic_0;
        end if; 
    end process;

end behav;
