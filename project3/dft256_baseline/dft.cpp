#include<math.h>
#include "dft.h"
#include"coefficients256.h"



void dft(DTYPE real_sample[SIZE], DTYPE imag_sample[SIZE])
{
	DTYPE temp_real[SIZE];
	DTYPE temp_imag[SIZE];

	for(int i = 0; i < SIZE; i++)
	{
#pragma HLS PIPELINE off
		temp_real[i] = 0;
		temp_imag[i] = 0;

		DTYPE w = (2.0*3.141592653589 / SIZE) * (DTYPE)i;

		for(int j = 0; j < SIZE; j++)
		{
#pragma HLS PIPELINE off
			DTYPE c = cos(j*w);
			DTYPE s = -sin(j*w);

			temp_real[i] += (real_sample[j]*c - imag_sample[j]*s);
			temp_imag[i] += (real_sample[j]*s + imag_sample[j]*c);
		}
	}

	for(int i = 0; i < SIZE; i++)
	{
#pragma HLS PIPELINE off
		real_sample[i] = temp_real[i];
		imag_sample[i] = temp_imag[i];
	}
}
