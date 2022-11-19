// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __dft_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R_H__
#define __dft_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct dft_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 25;
  static const unsigned AddressRange = 256;
  static const unsigned AddressWidth = 8;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(dft_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R_ram) {
        ram[0] = "0b1000000111100000110011101";
        ram[1] = "0b1000000111011111100000111";
        ram[2] = "0b1000000111011101000001001";
        ram[3] = "0b1000000111011001010010101";
        ram[4] = "0b1000000111010100010000101";
        ram[5] = "0b1000000111001110000010111";
        ram[6] = "0b1000000111000110100001000";
        ram[7] = "0b1000000110111101101110010";
        ram[8] = "0b1000000110110011101111001";
        ram[9] = "0b1000000110101000011100110";
        ram[10] = "0b1000000110011011111100110";
        ram[11] = "0b1000000110001110010000101";
        ram[12] = "0b1000000101111111001111010";
        ram[13] = "0b1000000101101110111101000";
        ram[14] = "0b1000000101011101011101100";
        ram[15] = "0b1000000101001010101100000";
        ram[16] = "0b1000000100110110101110110";
        ram[17] = "0b1000000100100001011100011";
        ram[18] = "0b1000000100001010111101101";
        ram[19] = "0b1000000011110011010000011";
        ram[20] = "0b1000000011011010001111111";
        ram[21] = "0b1000000011000000000011100";
        ram[22] = "0b1000000010100100100111001";
        ram[23] = "0b1000000010000111111000100";
        ram[24] = "0b1000000001101001111101011";
        ram[25] = "0b1000000001001010110000000";
        ram[26] = "0b1000000000101010010110001";
        ram[27] = "0b1000000000001000110000101";
        ram[28] = "0b0111111111100101111000001";
        ram[29] = "0b0111111111000001101100100";
        ram[30] = "0b0111111110011100011100001";
        ram[31] = "0b0111111101110101110011101";
        ram[32] = "0b0111111101001110000010010";
        ram[33] = "0b0111111100100100111111010";
        ram[34] = "0b0111111011111010101110110";
        ram[35] = "0b0111111011001111010000110";
        ram[36] = "0b0111111010100010100110110";
        ram[37] = "0b0111111001110100100111100";
        ram[38] = "0b0111111001000101011110010";
        ram[39] = "0b0111111000010101001001110";
        ram[40] = "0b0111110111100011100011100";
        ram[41] = "0b0111110110110000110010001";
        ram[42] = "0b0111110101111100110101101";
        ram[43] = "0b0111110101000111100011100";
        ram[44] = "0b0111110100010001001011111";
        ram[45] = "0b0111110011011001100010100";
        ram[46] = "0b0111110010100000110001011";
        ram[47] = "0b0111110001100110101110000";
        ram[48] = "0b0111110000101011011111011";
        ram[49] = "0b0111101111101111000100110";
        ram[50] = "0b0111101110110001011011011";
        ram[51] = "0b0111101101110010100111110";
        ram[52] = "0b0111101100110010101001110";
        ram[53] = "0b0111101011110001011100110";
        ram[54] = "0b0111101010101111000110100";
        ram[55] = "0b0111101001101011100100011";
        ram[56] = "0b0111101000100110110110000";
        ram[57] = "0b0111100111100000111101010";
        ram[58] = "0b0111100110011001110110001";
        ram[59] = "0b0111100101010001100111010";
        ram[60] = "0b0111100100001000001000010";
        ram[61] = "0b0111100010111101100101100";
        ram[62] = "0b0111100001110001110011011";
        ram[63] = "0b0111100000100100111100100";
        ram[64] = "0b0111011111010110110101110";
        ram[65] = "0b0111011110000111100110011";
        ram[66] = "0b0111011100110111001110001";
        ram[67] = "0b0111011011100101101110101";
        ram[68] = "0b0111011010010011000010111";
        ram[69] = "0b0111011000111111001101011";
        ram[70] = "0b0111010111101010010001010";
        ram[71] = "0b0111010110010100000111100";
        ram[72] = "0b0111010100111100111110100";
        ram[73] = "0b0111010011100100100010111";
        ram[74] = "0b0111010010001011000111010";
        ram[75] = "0b0111010000110000011111111";
        ram[76] = "0b0111001111010100110000000";
        ram[77] = "0b0111001101110111111010110";
        ram[78] = "0b0111001100011001111110001";
        ram[79] = "0b0111001010111010110111101";
        ram[80] = "0b0111001001011010101111101";
        ram[81] = "0b0111000111111001011101011";
        ram[82] = "0b0111000110010111000101011";
        ram[83] = "0b0111000100110011100111000";
        ram[84] = "0b0111000011001111000100101";
        ram[85] = "0b0111000001101001011000001";
        ram[86] = "0b0111000000000010101011010";
        ram[87] = "0b0110111110011010110111000";
        ram[88] = "0b0110111100110001111110011";
        ram[89] = "0b0110111011001000000010111";
        ram[90] = "0b0110111001011101000001000";
        ram[91] = "0b0110110111110000111100011";
        ram[92] = "0b0110110110000011110000001";
        ram[93] = "0b0110110100010101100101101";
        ram[94] = "0b0110110010100110010100111";
        ram[95] = "0b0110110000110110000010110";
        ram[96] = "0b0110101111000100101101000";
        ram[97] = "0b0110101101010010010001011";
        ram[98] = "0b0110101011011110111000001";
        ram[99] = "0b0110101001101010011010100";
        ram[100] = "0b0110100111110100111110110";
        ram[101] = "0b0110100101111110011111001";
        ram[102] = "0b0110100100000110111101100";
        ram[103] = "0b0110100010001110011101011";
        ram[104] = "0b0110100000010100111001010";
        ram[105] = "0b0110011110011010010111011";
        ram[106] = "0b0110011100011110110100000";
        ram[107] = "0b0110011010100010010011101";
        ram[108] = "0b0110011000100100110101011";
        ram[109] = "0b0110010110100110010001100";
        ram[110] = "0b0110010100100110110011110";
        ram[111] = "0b0110010010100110010101001";
        ram[112] = "0b0110010000100100111110000";
        ram[113] = "0b0110001110100010100101011";
        ram[114] = "0b0110001100011111001010110";
        ram[115] = "0b0110001010011010111011100";
        ram[116] = "0b0110001000010101101000011";
        ram[117] = "0b0110000110001111011011111";
        ram[118] = "0b0110000100001000010001111";
        ram[119] = "0b0110000010000000001110011";
        ram[120] = "0b0101111111110111001100111";
        ram[121] = "0b0101111101101101010010010";
        ram[122] = "0b0101111011100010011101011";
        ram[123] = "0b0101111001010110101001101";
        ram[124] = "0b0101110111001001111111111";
        ram[125] = "0b0101110100111100011000000";
        ram[126] = "0b0101110010101101111010111";
        ram[127] = "0b0101110000011110100011001";
        ram[128] = "0b0001010001100110101101100";
        ram[129] = "0b0001010001100110100100110";
        ram[130] = "0b0001010001100110010100010";
        ram[131] = "0b0001010001100101111000000";
        ram[132] = "0b0001010001100101010011100";
        ram[133] = "0b0001010001100100100110011";
        ram[134] = "0b0001010001100011110010111";
        ram[135] = "0b0001010001100010110001110";
        ram[136] = "0b0001010001100001101100101";
        ram[137] = "0b0001010001100000011010001";
        ram[138] = "0b0001010001011111000000010";
        ram[139] = "0b0001010001011101011010111";
        ram[140] = "0b0001010001011011110010010";
        ram[141] = "0b0001010001011001111100000";
        ram[142] = "0b0001010001010111111110001";
        ram[143] = "0b0001010001010101111000101";
        ram[144] = "0b0001010001010011101001000";
        ram[145] = "0b0001010001010001010000000";
        ram[146] = "0b0001010001001110101101111";
        ram[147] = "0b0001010001001100000010011";
        ram[148] = "0b0001010001001001010000110";
        ram[149] = "0b0001010001000110010011011";
        ram[150] = "0b0001010001000011001110000";
        ram[151] = "0b0001010001000000000010111";
        ram[152] = "0b0001010000111100101000101";
        ram[153] = "0b0001010000111001001000101";
        ram[154] = "0b0001010000110101011101011";
        ram[155] = "0b0001010000110001101111110";
        ram[156] = "0b0001010000101101110100010";
        ram[157] = "0b0001010000101001101111100";
        ram[158] = "0b0001010000100101100010111";
        ram[159] = "0b0001010000100001001111001";
        ram[160] = "0b0001010000011100101110111";
        ram[161] = "0b0001010000011000001000011";
        ram[162] = "0b0001010000010011011011000";
        ram[163] = "0b0001010000001110100001101";
        ram[164] = "0b0001010000001001100000101";
        ram[165] = "0b0001010000000100010010100";
        ram[166] = "0b0001001111111110111111011";
        ram[167] = "0b0001001111111001100101000";
        ram[168] = "0b0001001111110100000000101";
        ram[169] = "0b0001001111101110010011001";
        ram[170] = "0b0001001111101000011010010";
        ram[171] = "0b0001001111100010011111000";
        ram[172] = "0b0001001111011100010101101";
        ram[173] = "0b0001001111010110000010101";
        ram[174] = "0b0001001111001111101010111";
        ram[175] = "0b0001001111001001001010101";
        ram[176] = "0b0001001111000010011101111";
        ram[177] = "0b0001001110111011101011000";
        ram[178] = "0b0001001110110100101111100";
        ram[179] = "0b0001001110101101101011100";
        ram[180] = "0b0001001110100110011110100";
        ram[181] = "0b0001001110011111000111000";
        ram[182] = "0b0001001110010111101000110";
        ram[183] = "0b0001001110010000000010010";
        ram[184] = "0b0001001110001000010011010";
        ram[185] = "0b0001001110000000011010100";
        ram[186] = "0b0001001101111000011001100";
        ram[187] = "0b0001001101110000010001100";
        ram[188] = "0b0001001101101000000001001";
        ram[189] = "0b0001001101011111100010100";
        ram[190] = "0b0001001101010111000010010";
        ram[191] = "0b0001001101001110010100011";
        ram[192] = "0b0001001101000101011111010";
        ram[193] = "0b0001001100111100100101000";
        ram[194] = "0b0001001100110011100001010";
        ram[195] = "0b0001001100101010010001101";
        ram[196] = "0b0001001100100000111110101";
        ram[197] = "0b0001001100010111011100111";
        ram[198] = "0b0001001100001101111011000";
        ram[199] = "0b0001001100000100001001011";
        ram[200] = "0b0001001011111010010110001";
        ram[201] = "0b0001001011110000010100100";
        ram[202] = "0b0001001011100110001100001";
        ram[203] = "0b0001001011011011111110010";
        ram[204] = "0b0001001011010001100101100";
        ram[205] = "0b0001001011000111000101100";
        ram[206] = "0b0001001010111100011010100";
        ram[207] = "0b0001001010110001101100000";
        ram[208] = "0b0001001010100110110100011";
        ram[209] = "0b0001001010011011110001000";
        ram[210] = "0b0001001010010000100101110";
        ram[211] = "0b0001001010000101010110100";
        ram[212] = "0b0001001001111010000000010";
        ram[213] = "0b0001001001101110011100110";
        ram[214] = "0b0001001001100010110010010";
        ram[215] = "0b0001001001010111000001010";
        ram[216] = "0b0001001001001011001001001";
        ram[217] = "0b0001001000111111000111110";
        ram[218] = "0b0001001000110010111100110";
        ram[219] = "0b0001001000100110101011110";
        ram[220] = "0b0001001000011010010010111";
        ram[221] = "0b0001001000001101110001111";
        ram[222] = "0b0001001000000001001001100";
        ram[223] = "0b0001000111110100011000011";
        ram[224] = "0b0001000111100111011111111";
        ram[225] = "0b0001000111011010011101011";
        ram[226] = "0b0001000111001101010101000";
        ram[227] = "0b0001000111000000000111011";
        ram[228] = "0b0001000110110010101111010";
        ram[229] = "0b0001000110100101001110101";
        ram[230] = "0b0001000110010111101000100";
        ram[231] = "0b0001000110001001111001111";
        ram[232] = "0b0001000101111100000011111";
        ram[233] = "0b0001000101101110000111101";
        ram[234] = "0b0001000101100000000000010";
        ram[235] = "0b0001000101010001110011101";
        ram[236] = "0b0001000101000011011110110";
        ram[237] = "0b0001000100110101000010001";
        ram[238] = "0b0001000100100110011111111";
        ram[239] = "0b0001000100010111110100100";
        ram[240] = "0b0001000100001001000000011";
        ram[241] = "0b0001000011111010000110100";
        ram[242] = "0b0001000011101011000111100";
        ram[243] = "0b0001000011011011111111001";
        ram[244] = "0b0001000011001100101111001";
        ram[245] = "0b0001000010111101011001110";
        ram[246] = "0b0001000010101101110111101";
        ram[247] = "0b0001000010011110010110010";
        ram[248] = "0b0001000010001110100110101";
        ram[249] = "0b0001000001111110110101001";
        ram[250] = "0b0001000001101110111100110";
        ram[251] = "0b0001000001011110111000111";
        ram[252] = "0b0001000001001110101111011";
        ram[253] = "0b0001000000111110011110010";
        ram[254] = "0b0001000000101110000111011";
        ram[255] = "0b0001000000011101101000001";


SC_METHOD(prc_write_0);
  sensitive<<clk.pos();
   }


void prc_write_0()
{
    if (ce0.read() == sc_dt::Log_1) 
    {
            if(address0.read().is_01() && address0.read().to_uint()<AddressRange)
              q0 = ram[address0.read().to_uint()];
            else
              q0 = sc_lv<DataWidth>();
    }
}


}; //endmodule


SC_MODULE(dft_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R) {


static const unsigned DataWidth = 25;
static const unsigned AddressRange = 256;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


dft_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R_ram* meminst;


SC_CTOR(dft_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R) {
meminst = new dft_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R_ram("dft_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~dft_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_V_ROM_1P_LUTRAM_1R() {
    delete meminst;
}


};//endmodule
#endif
