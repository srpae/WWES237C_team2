/*
	Filename: fir.h
		Header file
		FIR lab wirtten for WES/CSE237C class at UCSD.

*/
#ifndef FIR_H_
#define FIR_H_

const int N=128;

typedef int	coef_t;
typedef int	data_t;
typedef int	acc_t;
/*Using arbitrary precision bit widths*/
//#include "ap_int.h"
//typedef ap_int<5>		coef_t;
//typedef ap_int<17>	data_t;
//typedef ap_int<20>	acc_t;

void fir (
  data_t *y,
  data_t x
  );

#endif
