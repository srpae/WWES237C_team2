/*
	Filename: fir.cpp
		FIR lab wirtten for WES/CSE237C class at UCSD.
		Match filter
	INPUT:
		x: signal (chirp)

	OUTPUT:
		y: filtered output

*/
#include "ap_int.h"
#include "fir.h"

void fir (
  data_t *y,
  data_t x
  )
{

#pragma HLS PIPELINE off
#pragma hls interface s_axilite port=return
	coef_t c[N] = {10, 11, 11, 8, 3, -3, -8, -11, -11, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -11, -11, -8, -3, 3, 8, 11, 11, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 8, 3, -3, -8, -11, -11, -10, -10, -10, -10, -10, -10, -10, -10, -11, -11, -8, -3, 3, 8, 11, 11, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 8, 3, -3, -8, -11, -11, -10, -10, -10, -10, -10, -10, -10, -10, -11, -11, -8, -3, 3, 8, 11, 11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10};
	static data_t shift_reg[N];
	acc_t acc;
	int i;
	acc = 0;
#pragma HLS ARRAY_PARTITION variable=c type=complete dim=1

	Shift_Accum_Loop:
	for(i=N-1;i>=0;i--){

		if(i == 0){
			acc += x * c[0];
			shift_reg[0] = x;
		}
		else{
			shift_reg[i] = shift_reg[i-1];
			acc += shift_reg[i] * c[i];
#pragma HLS ARRAY_PARTITION variable= shift_reg type=complete dim=1
		}
	}
	*y = acc;
}


