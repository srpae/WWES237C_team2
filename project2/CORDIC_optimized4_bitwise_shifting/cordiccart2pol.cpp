#include "cordiccart2pol.h"
#include <ap_fixed.h>

data_t Kvalues[NO_ITER] = {1,	0.500000000000000,	0.250000000000000,	0.125000000000000,	0.0625000000000000,	0.0312500000000000,	0.0156250000000000,	0.00781250000000000,	0.00390625000000000,	0.00195312500000000,	0.000976562500000000,	0.000488281250000000,	0.000244140625000000,	0.000122070312500000,	6.10351562500000e-05,	3.05175781250000e-05};

data_t angles[NO_ITER] = {0.785398163397448,	0.463647609000806,	0.244978663126864,	0.124354994546761,	0.0624188099959574,	0.0312398334302683,	0.0156237286204768,	0.00781234106010111,	0.00390623013196697,	0.00195312251647882,	0.000976562189559320,	0.000488281211194898,	0.000244140620149362,	0.000122070311893670,	6.10351561742088e-05,	3.05175781155261e-05};


void cordiccart2pol(data_t x, data_t y, data_t * r,  data_t * theta)
{

#pragma HLS PIPELINE off
#pragma hls interface s_axilite port=return
	// Write your code hereb
	ap_fixed_type	x0 = x;
	ap_fixed_type  y0 = y;
	ap_fixed_type theta_accum = 0;


	ap_fixed_type x1 = 0;
	ap_fixed_type y1 = 0;
	ap_fixed_type PI = 3.141592;
	//ap_fixed_type PI = 3+(1>>4)+(1>>6)+(1>>10)-(1>>17);
	int y_s = 0;
	int x_s = 0;

	if (x < 0)
	{
		x0 = -x;
		x_s = 1;

	}
	if (y < 0)
	{
		y0 = -y;
		y_s = 1;
	}

	ap_fixed_type factor = 1.0;
	int NUM_INTEGRATIONS = 16;
	for (int j = 0; j < NUM_INTEGRATIONS; j++)
	{

		if (y1 < 0)
		{
			ap_fixed_type x_shift = x0 * factor;
			ap_fixed_type y_shift = y0 * factor;

			x1 = x0 - y_shift;
			y1 = y0 + x_shift;

			theta_accum -= (ap_fixed_type)angles[j];//(COS_SIN_TYPE)angles[j];
		}
		else
		{
			ap_fixed_type x_shift = -x0 * factor;
			ap_fixed_type y_shift = -y0 * factor;

			x1 = x0 - y_shift;
			y1 = y0 + x_shift;

			theta_accum +=  (ap_fixed_type)angles[j]; //(COS_SIN_TYPE)angles[j];
		}
		factor = (factor >> 1);

		x0 = x1;
		y0 = y1;

	}
	ap_fixed_type a = 1 ; ap_fixed_type b = 1; ap_fixed_type c = 0.01774665;
	*r =(x1 >> 1) + ((a >> 3 ) - c) + (b >>6) ; //* 0.60725335;
	if (x_s == 1 && y_s == 1)
	{
		if (theta_accum > 0) {
			*theta = -PI + theta_accum;
		}
		else {
			*theta = -PI - theta_accum;
		}
	}
	else if (x_s == 0 && y_s == 1)
	{
		if (theta_accum > 0){
			*theta = -theta_accum;
		}
		else {
			*theta = theta_accum;
		}
	}
	else if (x_s == 1 && y_s == 0)
	{
		if (theta_accum > 0) {
			*theta = PI - theta_accum;
		}
		else {
			*theta = PI + theta_accum;
		}
	}
	else
	{
		if (theta_accum > 0) {
			*theta = theta_accum;
		}
		else {
			*theta = -theta_accum;
		}

	}



}
