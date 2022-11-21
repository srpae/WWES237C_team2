#include<math.h>
#include "dft.h"
#include "coefficients256.h"

void dft(DTYPE real_sample[SIZE], DTYPE imag_sample[SIZE], DTYPE real_out[SIZE], DTYPE imag_out[SIZE])
{
#pragma HLS ARRAY_PARTITION dim=1 factor=8 type=cyclic variable=real_sample
#pragma HLS ARRAY_PARTITION dim=1 factor=8 type=cyclic variable=imag_sample
#pragma HLS ARRAY_PARTITION dim=1 factor=8 type=cyclic variable=imag_out
#pragma HLS ARRAY_PARTITION dim=1 factor=8 type=cyclic variable=real_out

	for(int i = 0; i < SIZE; i++)
#pragma HLS UNROLL
	{
		real_out[i] = 0;
		imag_out[i] = 0;
	}

	for(int j = 0; j < SIZE; j++)
	{
#pragma HLS UNROLL factor=2

		for(int i = 0; i < SIZE; i++)
		{
#pragma HLS UNROLL factor=8
			DTYPE c = cos_coefficients_table[(j*i)%SIZE];
			DTYPE s = sin_coefficients_table[(j*i)%SIZE];

			real_out[i] += (real_sample[j]*c - imag_sample[j]*s);
			imag_out[i] += (real_sample[j]*s + imag_sample[j]*c);
		}
	}
}
