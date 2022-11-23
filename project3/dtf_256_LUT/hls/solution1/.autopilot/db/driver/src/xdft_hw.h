// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/COH)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         bit 9  - interrupt (Read)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0 - enable ap_done interrupt (Read/Write)
//         bit 1 - enable ap_ready interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/COR)
//         bit 0 - ap_done (Read/COR)
//         bit 1 - ap_ready (Read/COR)
//         others - reserved
// 0x400 ~
// 0x7ff : Memory 'real_sample' (256 * 32b)
//         Word n : bit [31:0] - real_sample[n]
// 0x800 ~
// 0xbff : Memory 'imag_sample' (256 * 32b)
//         Word n : bit [31:0] - imag_sample[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XDFT_CONTROL_ADDR_AP_CTRL          0x000
#define XDFT_CONTROL_ADDR_GIE              0x004
#define XDFT_CONTROL_ADDR_IER              0x008
#define XDFT_CONTROL_ADDR_ISR              0x00c
#define XDFT_CONTROL_ADDR_REAL_SAMPLE_BASE 0x400
#define XDFT_CONTROL_ADDR_REAL_SAMPLE_HIGH 0x7ff
#define XDFT_CONTROL_WIDTH_REAL_SAMPLE     32
#define XDFT_CONTROL_DEPTH_REAL_SAMPLE     256
#define XDFT_CONTROL_ADDR_IMAG_SAMPLE_BASE 0x800
#define XDFT_CONTROL_ADDR_IMAG_SAMPLE_HIGH 0xbff
#define XDFT_CONTROL_WIDTH_IMAG_SAMPLE     32
#define XDFT_CONTROL_DEPTH_IMAG_SAMPLE     256

