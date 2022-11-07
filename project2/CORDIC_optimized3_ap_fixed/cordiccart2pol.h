#ifndef CORDICCART2POL_H
#define CORDICCART2POL_H
#include <ap_fixed.h>

#define NO_ITER 16

typedef int   coef_t;
typedef float data_t;
typedef float acc_t;
typedef double COS_SIN_TYPE;
typedef ap_fixed<19,3> ap_fixed_type;//,AP_RND, AP_WRAP,1> ap_fixed_type;

void cordiccart2pol(data_t x, data_t y, data_t * r,  data_t * theta);

#endif
