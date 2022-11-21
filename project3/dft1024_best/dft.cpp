#include<math.h>
#include "dft.h"
#include"coefficients1024.h"

void dft(DTYPE real_sample[SIZE], DTYPE imag_sample[SIZE],DTYPE real_op[SIZE],DTYPE imag_op[SIZE])	//Use pointers while doing the demo for streaming//
{
#pragma HLS ARRAY_PARTITION dim=1 factor=8 type=cyclic variable=imag_op
#pragma HLS ARRAY_PARTITION dim=1 factor=8 type=cyclic variable=real_op
#pragma HLS ARRAY_PARTITION dim=1 factor=8 type=cyclic variable=imag_sample
#pragma HLS ARRAY_PARTITION dim=1 factor=8 type=cyclic variable=real_sample

	for(int i = 0; i < SIZE; i++)
#pragma HLS UNROLL
	{
		real_op[i] = 0;
		imag_op[i] = 0;
	}

	for(int j = 0; j < SIZE; j++)
	{
#pragma HLS UNROLL factor=2

		for(int i = 0; i < SIZE; i++)
		{
#pragma HLS UNROLL factor=8
			DTYPE c = cos_coefficients_table[(j*i)%SIZE];
			DTYPE s = sin_coefficients_table[(j*i)%SIZE];

			real_op[i] += (real_sample[j]*c - imag_sample[j]*s);
			imag_op[i] += (real_sample[j]*s + imag_sample[j]*c);
		}
	}
}
