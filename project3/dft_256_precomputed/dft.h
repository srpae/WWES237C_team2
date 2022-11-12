
typedef float DTYPE;
//#define SIZE 256 		/* SIZE OF DFT */
//void dft(DTYPE XX_R[SIZE], DTYPE XX_I[SIZE]);
typedef double IN_TYPE; // Data type for the input signal
typedef double TEMP_TYPE; // Data type for the temporary variables
#define N 256 // DFT Size
void dft(IN_TYPE sample_real[N], IN_TYPE sample_imag[N]);


