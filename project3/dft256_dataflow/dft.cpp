#include<math.h>
#include "dft.h"
#include "coefficients256.h"

void init_output(DTYPE real_out[SIZE], DTYPE imag_out[SIZE])
{
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=imag_out
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=real_out
	for(int i = 0; i < SIZE; i++)
#pragma HLS UNROLL
	{
		real_out[i] = 0;
		imag_out[i] = 0;
	}
}

void write_output(DTYPE real_temp[SIZE], DTYPE imag_temp[SIZE], DTYPE real_out[SIZE], DTYPE imag_out[SIZE])
{
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=imag_out
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=real_out
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=imag_temp
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=real_temp
	for(int i = 0; i < SIZE; i++)
#pragma HLS UNROLL
	{
		real_out[i] = real_temp[i];
		imag_out[i] = imag_temp[i];
	}
}

void do_dft(DTYPE real_sample[SIZE], DTYPE imag_sample[SIZE], DTYPE real_out[SIZE], DTYPE imag_out[SIZE])
{
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=real_sample
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=imag_sample
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=imag_out
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=real_out
	for(int j = 0; j < SIZE; j++)
	{
#pragma HLS UNROLL factor=8

		DTYPE w = (2.0*3.141592653589 / SIZE) * (DTYPE)j;
		for(int i = 0; i < SIZE; i++)
		{
#pragma HLS UNROLL factor=32
			DTYPE c = cos(i*w);
			DTYPE s = -sin(i*w);

			real_out[i] += (real_sample[j]*c - imag_sample[j]*s);
			imag_out[i] += (real_sample[j]*s + imag_sample[j]*c);
		}
	}
}

void dft(DTYPE real_sample[SIZE], DTYPE imag_sample[SIZE], DTYPE real_out[SIZE], DTYPE imag_out[SIZE])
{
#pragma HLS DATAFLOW
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=real_sample
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=imag_sample
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=imag_out
#pragma HLS ARRAY_PARTITION dim=1 factor=256 type=cyclic variable=real_out


	DTYPE real_temp[SIZE];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=real_temp
	DTYPE imag_temp[SIZE];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=imag_temp

	init_output(real_temp, imag_temp);

	do_dft(real_sample, imag_sample, real_temp, imag_temp);

	write_output(real_temp, imag_temp, real_out, imag_out);
}
