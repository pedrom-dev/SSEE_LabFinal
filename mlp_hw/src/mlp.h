#ifndef __MLP_H__
#define __MLP_H__

#include <assert.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>

// by default
#define C_TOTAL 10000
#define C_INTRO 784
#define C_HIDD 64
#define C_HIDD2 128
#define C_OUT 10

#define IMG_DIM 28

typedef unsigned char uint8_t;
typedef unsigned int uint32_t;

// convert2word
typedef float T;
#define U 4
#define TI 5
#define TD 5

#define WORD_SIZE 32

typedef ap_axiu<WORD_SIZE,U,TI,TD> AXI_VAL;
#define NUM_ELEMS_WORD ((WORD_SIZE/8)/sizeof(T))


typedef ap_uint<WORD_SIZE> WORD_MEM;

typedef union {
	int in;
	T out;
} conv_t;
// convert2word

//uint8_t MLP (const float pixels[C_INTRO]);
uint8_t MLP (hls::stream<AXI_VAL> &INPUT_STREAM, hls::stream<AXI_VAL> &OUTPUT_STREAM);


#endif
