
typedef float DTYPE;
typedef double IN_TYPE; // Data type for the input signal
typedef double TEMP_TYPE; // Data type for the temporary variables
#define N 256 // DFT Size
//#define SIZE 8 		/* SIZE OF DFT */
//void dft(DTYPE XX_R[SIZE], DTYPE XX_I[SIZE]);
void dft(IN_TYPE sample_real[N], IN_TYPE sample_imag[N]);

