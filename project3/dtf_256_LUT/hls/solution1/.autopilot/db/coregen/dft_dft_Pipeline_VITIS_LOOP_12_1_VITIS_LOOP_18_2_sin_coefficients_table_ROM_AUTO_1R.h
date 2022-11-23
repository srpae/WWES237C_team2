// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_sin_coefficients_table_ROM_AUTO_1R_H__
#define __dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_sin_coefficients_table_ROM_AUTO_1R_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_sin_coefficients_table_ROM_AUTO_1R_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 32;
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


   SC_CTOR(dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_sin_coefficients_table_ROM_AUTO_1R_ram) {
        ram[0] = "0b00000000000000000000000000000000";
        ram[1] = "0b10111100110010010000101000110101";
        ram[2] = "0b10111101010010001111101110000111";
        ram[3] = "0b10111101100101101010100100111111";
        ram[4] = "0b10111101110010001011110100100011";
        ram[5] = "0b10111101111110101011001010011110";
        ram[6] = "0b10111110000101100100000001100100";
        ram[7] = "0b10111110001011110001000010101010";
        ram[8] = "0b10111110010001111100010110101100";
        ram[9] = "0b10111110011000000101110000000011";
        ram[10] = "0b10111110011110001100111111000000";
        ram[11] = "0b10111110100010001000111010011011";
        ram[12] = "0b10111110100101001010000000111100";
        ram[13] = "0b10111110101000001001101011101101";
        ram[14] = "0b10111110101011000111110011011001";
        ram[15] = "0b10111110101110000100010000101000";
        ram[16] = "0b10111110110000111110111100000111";
        ram[17] = "0b10111110110011110111101111000000";
        ram[18] = "0b10111110110110101110100001111101";
        ram[19] = "0b10111110111001100011001101101010";
        ram[20] = "0b10111110111100010101101011110011";
        ram[21] = "0b10111110111111000101110100100000";
        ram[22] = "0b10111111000000111001110001000001";
        ram[23] = "0b10111111000010001111010110100001";
        ram[24] = "0b10111111000011100011100111010110";
        ram[25] = "0b10111111000100110110100000100111";
        ram[26] = "0b10111111000110000111111110111011";
        ram[27] = "0b10111111000111010111111111011000";
        ram[28] = "0b10111111001000100110011110010100";
        ram[29] = "0b10111111001001110011011001011001";
        ram[30] = "0b10111111001010111110101101001010";
        ram[31] = "0b10111111001100001000010111000010";
        ram[32] = "0b10111111001101010000010011110111";
        ram[33] = "0b10111111001110010110100001000000";
        ram[34] = "0b10111111001111011010111011110111";
        ram[35] = "0b10111111010000011101100001110011";
        ram[36] = "0b10111111010001011110001111111100";
        ram[37] = "0b10111111010010011101000100001011";
        ram[38] = "0b10111111010011011001111100001010";
        ram[39] = "0b10111111010100010100110101000000";
        ram[40] = "0b10111111010101001101101100111000";
        ram[41] = "0b10111111010110000100100001011010";
        ram[42] = "0b10111111010110111001010000100001";
        ram[43] = "0b10111111010111101011111000000110";
        ram[44] = "0b10111111011000011100010110010011";
        ram[45] = "0b10111111011001001010101001010100";
        ram[46] = "0b10111111011001110110101111010011";
        ram[47] = "0b10111111011010100000100110101011";
        ram[48] = "0b10111111011011001000001101100110";
        ram[49] = "0b10111111011011101101100010100001";
        ram[50] = "0b10111111011100010000100100000111";
        ram[51] = "0b10111111011100110001010001000100";
        ram[52] = "0b10111111011101001111101000000101";
        ram[53] = "0b10111111011101101011101000000110";
        ram[54] = "0b10111111011110000101001111110100";
        ram[55] = "0b10111111011110011100011110011011";
        ram[56] = "0b10111111011110110001010010111010";
        ram[57] = "0b10111111011111000011101100101110";
        ram[58] = "0b10111111011111010011101010110100";
        ram[59] = "0b10111111011111100001001100101011";
        ram[60] = "0b10111111011111101100010001110010";
        ram[61] = "0b10111111011111110100111001100110";
        ram[62] = "0b10111111011111111011000100000111";
        ram[63] = "0b10111111011111111110110001000110";
        ram[64] = "0b10111111100000000000000000000000";
        ram[65] = "0b10111111011111111110110001000110";
        ram[66] = "0b10111111011111111011000100000111";
        ram[67] = "0b10111111011111110100111001100110";
        ram[68] = "0b10111111011111101100010001110010";
        ram[69] = "0b10111111011111100001001100101011";
        ram[70] = "0b10111111011111010011101010110100";
        ram[71] = "0b10111111011111000011101100101110";
        ram[72] = "0b10111111011110110001010010111010";
        ram[73] = "0b10111111011110011100011110011011";
        ram[74] = "0b10111111011110000101001111110100";
        ram[75] = "0b10111111011101101011101000000110";
        ram[76] = "0b10111111011101001111101000000101";
        ram[77] = "0b10111111011100110001010001000100";
        ram[78] = "0b10111111011100010000100100000111";
        ram[79] = "0b10111111011011101101100010100001";
        ram[80] = "0b10111111011011001000001101100110";
        ram[81] = "0b10111111011010100000100110101011";
        ram[82] = "0b10111111011001110110101111010011";
        ram[83] = "0b10111111011001001010101001010100";
        ram[84] = "0b10111111011000011100010110010011";
        ram[85] = "0b10111111010111101011111000000110";
        ram[86] = "0b10111111010110111001010000100001";
        ram[87] = "0b10111111010110000100100001011010";
        ram[88] = "0b10111111010101001101101100111000";
        ram[89] = "0b10111111010100010100110101000000";
        ram[90] = "0b10111111010011011001111100001010";
        ram[91] = "0b10111111010010011101000100001011";
        ram[92] = "0b10111111010001011110001111111100";
        ram[93] = "0b10111111010000011101100001110011";
        ram[94] = "0b10111111001111011010111011110111";
        ram[95] = "0b10111111001110010110100001000000";
        ram[96] = "0b10111111001101010000010011110111";
        ram[97] = "0b10111111001100001000010111000010";
        ram[98] = "0b10111111001010111110101101001010";
        ram[99] = "0b10111111001001110011011001011001";
        ram[100] = "0b10111111001000100110011110010100";
        ram[101] = "0b10111111000111010111111111011000";
        ram[102] = "0b10111111000110000111111110111011";
        ram[103] = "0b10111111000100110110100000100111";
        ram[104] = "0b10111111000011100011100111010110";
        ram[105] = "0b10111111000010001111010110100001";
        ram[106] = "0b10111111000000111001110001000001";
        ram[107] = "0b10111110111111000101110100100000";
        ram[108] = "0b10111110111100010101101011110011";
        ram[109] = "0b10111110111001100011001101101010";
        ram[110] = "0b10111110110110101110100001111101";
        ram[111] = "0b10111110110011110111101111000000";
        ram[112] = "0b10111110110000111110111100000111";
        ram[113] = "0b10111110101110000100010000101000";
        ram[114] = "0b10111110101011000111110011011001";
        ram[115] = "0b10111110101000001001101011101101";
        ram[116] = "0b10111110100101001010000000111100";
        ram[117] = "0b10111110100010001000111010011011";
        ram[118] = "0b10111110011110001100111111000000";
        ram[119] = "0b10111110011000000101110000000011";
        ram[120] = "0b10111110010001111100010110101100";
        ram[121] = "0b10111110001011110001000010101010";
        ram[122] = "0b10111110000101100100000001100100";
        ram[123] = "0b10111101111110101011001010011110";
        ram[124] = "0b10111101110010001011110100100011";
        ram[125] = "0b10111101100101101010100100111111";
        ram[126] = "0b10111101010010001111101110000111";
        ram[127] = "0b10111100110010010000101000110101";
        ram[128] = "0b10000000000000000000000000000000";
        ram[129] = "0b00111100110010010000101000110101";
        ram[130] = "0b00111101010010001111101110000111";
        ram[131] = "0b00111101100101101010100100111111";
        ram[132] = "0b00111101110010001011110100100011";
        ram[133] = "0b00111101111110101011001010011110";
        ram[134] = "0b00111110000101100100000001100100";
        ram[135] = "0b00111110001011110001000010101010";
        ram[136] = "0b00111110010001111100010110101100";
        ram[137] = "0b00111110011000000101110000000011";
        ram[138] = "0b00111110011110001100111111000000";
        ram[139] = "0b00111110100010001000111010011011";
        ram[140] = "0b00111110100101001010000000111100";
        ram[141] = "0b00111110101000001001101011101101";
        ram[142] = "0b00111110101011000111110011011001";
        ram[143] = "0b00111110101110000100010000101000";
        ram[144] = "0b00111110110000111110111100000111";
        ram[145] = "0b00111110110011110111101111000000";
        ram[146] = "0b00111110110110101110100001111101";
        ram[147] = "0b00111110111001100011001101101010";
        ram[148] = "0b00111110111100010101101011110011";
        ram[149] = "0b00111110111111000101110100100000";
        ram[150] = "0b00111111000000111001110001000001";
        ram[151] = "0b00111111000010001111010110100001";
        ram[152] = "0b00111111000011100011100111010110";
        ram[153] = "0b00111111000100110110100000100111";
        ram[154] = "0b00111111000110000111111110111011";
        ram[155] = "0b00111111000111010111111111011000";
        ram[156] = "0b00111111001000100110011110010100";
        ram[157] = "0b00111111001001110011011001011001";
        ram[158] = "0b00111111001010111110101101001010";
        ram[159] = "0b00111111001100001000010111000010";
        ram[160] = "0b00111111001101010000010011110111";
        ram[161] = "0b00111111001110010110100001000000";
        ram[162] = "0b00111111001111011010111011110111";
        ram[163] = "0b00111111010000011101100001110011";
        ram[164] = "0b00111111010001011110001111111100";
        ram[165] = "0b00111111010010011101000100001011";
        ram[166] = "0b00111111010011011001111100001010";
        ram[167] = "0b00111111010100010100110101000000";
        ram[168] = "0b00111111010101001101101100111000";
        ram[169] = "0b00111111010110000100100001011010";
        ram[170] = "0b00111111010110111001010000100001";
        ram[171] = "0b00111111010111101011111000000110";
        ram[172] = "0b00111111011000011100010110010011";
        ram[173] = "0b00111111011001001010101001010100";
        ram[174] = "0b00111111011001110110101111010011";
        ram[175] = "0b00111111011010100000100110101011";
        ram[176] = "0b00111111011011001000001101100110";
        ram[177] = "0b00111111011011101101100010100001";
        ram[178] = "0b00111111011100010000100100000111";
        ram[179] = "0b00111111011100110001010001000100";
        ram[180] = "0b00111111011101001111101000000101";
        ram[181] = "0b00111111011101101011101000000110";
        ram[182] = "0b00111111011110000101001111110100";
        ram[183] = "0b00111111011110011100011110011011";
        ram[184] = "0b00111111011110110001010010111010";
        ram[185] = "0b00111111011111000011101100101110";
        ram[186] = "0b00111111011111010011101010110100";
        ram[187] = "0b00111111011111100001001100101011";
        ram[188] = "0b00111111011111101100010001110010";
        ram[189] = "0b00111111011111110100111001100110";
        ram[190] = "0b00111111011111111011000100000111";
        ram[191] = "0b00111111011111111110110001000110";
        ram[192] = "0b00111111100000000000000000000000";
        ram[193] = "0b00111111011111111110110001000110";
        ram[194] = "0b00111111011111111011000100000111";
        ram[195] = "0b00111111011111110100111001100110";
        ram[196] = "0b00111111011111101100010001110010";
        ram[197] = "0b00111111011111100001001100101011";
        ram[198] = "0b00111111011111010011101010110100";
        ram[199] = "0b00111111011111000011101100101110";
        ram[200] = "0b00111111011110110001010010111010";
        ram[201] = "0b00111111011110011100011110011011";
        ram[202] = "0b00111111011110000101001111110100";
        ram[203] = "0b00111111011101101011101000000110";
        ram[204] = "0b00111111011101001111101000000101";
        ram[205] = "0b00111111011100110001010001000100";
        ram[206] = "0b00111111011100010000100100000111";
        ram[207] = "0b00111111011011101101100010100001";
        ram[208] = "0b00111111011011001000001101100110";
        ram[209] = "0b00111111011010100000100110101011";
        ram[210] = "0b00111111011001110110101111010011";
        ram[211] = "0b00111111011001001010101001010100";
        ram[212] = "0b00111111011000011100010110010011";
        ram[213] = "0b00111111010111101011111000000110";
        ram[214] = "0b00111111010110111001010000100001";
        ram[215] = "0b00111111010110000100100001011010";
        ram[216] = "0b00111111010101001101101100111000";
        ram[217] = "0b00111111010100010100110101000000";
        ram[218] = "0b00111111010011011001111100001010";
        ram[219] = "0b00111111010010011101000100001011";
        ram[220] = "0b00111111010001011110001111111100";
        ram[221] = "0b00111111010000011101100001110011";
        ram[222] = "0b00111111001111011010111011110111";
        ram[223] = "0b00111111001110010110100001000000";
        ram[224] = "0b00111111001101010000010011110111";
        ram[225] = "0b00111111001100001000010111000010";
        ram[226] = "0b00111111001010111110101101001010";
        ram[227] = "0b00111111001001110011011001011001";
        ram[228] = "0b00111111001000100110011110010100";
        ram[229] = "0b00111111000111010111111111011000";
        ram[230] = "0b00111111000110000111111110111011";
        ram[231] = "0b00111111000100110110100000100111";
        ram[232] = "0b00111111000011100011100111010110";
        ram[233] = "0b00111111000010001111010110100001";
        ram[234] = "0b00111111000000111001110001000001";
        ram[235] = "0b00111110111111000101110100100000";
        ram[236] = "0b00111110111100010101101011110011";
        ram[237] = "0b00111110111001100011001101101010";
        ram[238] = "0b00111110110110101110100001111101";
        ram[239] = "0b00111110110011110111101111000000";
        ram[240] = "0b00111110110000111110111100000111";
        ram[241] = "0b00111110101110000100010000101000";
        ram[242] = "0b00111110101011000111110011011001";
        ram[243] = "0b00111110101000001001101011101101";
        ram[244] = "0b00111110100101001010000000111100";
        ram[245] = "0b00111110100010001000111010011011";
        ram[246] = "0b00111110011110001100111111000000";
        ram[247] = "0b00111110011000000101110000000011";
        ram[248] = "0b00111110010001111100010110101100";
        ram[249] = "0b00111110001011110001000010101010";
        ram[250] = "0b00111110000101100100000001100100";
        ram[251] = "0b00111101111110101011001010011110";
        ram[252] = "0b00111101110010001011110100100011";
        ram[253] = "0b00111101100101101010100100111111";
        ram[254] = "0b00111101010010001111101110000111";
        ram[255] = "0b00111100110010010000101000110101";


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


SC_MODULE(dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_sin_coefficients_table_ROM_AUTO_1R) {


static const unsigned DataWidth = 32;
static const unsigned AddressRange = 256;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_sin_coefficients_table_ROM_AUTO_1R_ram* meminst;


SC_CTOR(dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_sin_coefficients_table_ROM_AUTO_1R) {
meminst = new dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_sin_coefficients_table_ROM_AUTO_1R_ram("dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_sin_coefficients_table_ROM_AUTO_1R_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~dft_dft_Pipeline_VITIS_LOOP_12_1_VITIS_LOOP_18_2_sin_coefficients_table_ROM_AUTO_1R() {
    delete meminst;
}


};//endmodule
#endif
