// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x0000 : Control signals
//          bit 0  - ap_start (Read/Write/COH)
//          bit 1  - ap_done (Read/COR)
//          bit 2  - ap_idle (Read)
//          bit 3  - ap_ready (Read/COR)
//          bit 7  - auto_restart (Read/Write)
//          bit 9  - interrupt (Read)
//          others - reserved
// 0x0004 : Global Interrupt Enable Register
//          bit 0  - Global Interrupt Enable (Read/Write)
//          others - reserved
// 0x0008 : IP Interrupt Enable Register (Read/Write)
//          bit 0 - enable ap_done interrupt (Read/Write)
//          bit 1 - enable ap_ready interrupt (Read/Write)
//          others - reserved
// 0x000c : IP Interrupt Status Register (Read/COR)
//          bit 0 - ap_done (Read/COR)
//          bit 1 - ap_ready (Read/COR)
//          others - reserved
// 0x0800 ~
// 0x0fff : Memory 'sample_real' (256 * 64b)
//          Word 2n   : bit [31:0] - sample_real[n][31: 0]
//          Word 2n+1 : bit [31:0] - sample_real[n][63:32]
// 0x1000 ~
// 0x17ff : Memory 'sample_imag' (256 * 64b)
//          Word 2n   : bit [31:0] - sample_imag[n][31: 0]
//          Word 2n+1 : bit [31:0] - sample_imag[n][63:32]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XDFT_CONTROL_ADDR_AP_CTRL          0x0000
#define XDFT_CONTROL_ADDR_GIE              0x0004
#define XDFT_CONTROL_ADDR_IER              0x0008
#define XDFT_CONTROL_ADDR_ISR              0x000c
#define XDFT_CONTROL_ADDR_SAMPLE_REAL_BASE 0x0800
#define XDFT_CONTROL_ADDR_SAMPLE_REAL_HIGH 0x0fff
#define XDFT_CONTROL_WIDTH_SAMPLE_REAL     64
#define XDFT_CONTROL_DEPTH_SAMPLE_REAL     256
#define XDFT_CONTROL_ADDR_SAMPLE_IMAG_BASE 0x1000
#define XDFT_CONTROL_ADDR_SAMPLE_IMAG_HIGH 0x17ff
#define XDFT_CONTROL_WIDTH_SAMPLE_IMAG     64
#define XDFT_CONTROL_DEPTH_SAMPLE_IMAG     256

