#include<math.h>
#include "dft.h"
#include "coefficients256.h"



void dft(DTYPE real_sample[SIZE], DTYPE imag_sample[SIZE], DTYPE real_out[SIZE], DTYPE imag_out[SIZE])
{
	for(int i = 0; i < SIZE; i++)
	{
#pragma HLS PIPELINE off
		real_out[i] = 0;
		imag_out[i] = 0;

		DTYPE w = (2.0*3.141592653589 / SIZE) * (DTYPE)i;

		for(int j = 0; j < SIZE; j++)
		{
#pragma HLS PIPELINE off
			DTYPE c = cos(j*w);
			DTYPE s = -sin(j*w);

			real_out[i] += (real_sample[j]*c - imag_sample[j]*s);
			imag_out[i] += (real_sample[j]*s + imag_sample[j]*c);
		}
	}
}
