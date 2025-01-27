#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>

#include "mlp.h"

extern const float BiasesHidden1[64];
extern const float WeightHidden1[64][784];
extern const float BiasesHidden2 [128];
extern const float WeightHidden2 [128][64];
extern const float BiasesOut[10];
extern const float WeightOut[10][128];

float sigmoid_function(float value) {
	return 1.0 / (1.0 + exp(-value)); // Sigmoid function
}

// Get the most probable digit
int get_most_probable(float outputs[C_OUT]){
	int result = 0;

	for(int i = 0; i < C_OUT; i++){
		if(outputs[result] < outputs[i]){
			result = i;
		}
	}

	return result;
}

void layer_hidden1(float intro[C_INTRO], float outputs[C_HIDD]){
	L1:for(int i = 0; i < C_HIDD ; i++) { // Each neuron in the hidden layer
		float aux = 0;

		L2:for(int j = 0; j<C_INTRO ; j++) {	// Each input neuron in the input layer
			aux += intro[j]*WeightHidden1[i][j];
		}

		aux += BiasesHidden1[i];	// Add the bias
		outputs[i] = sigmoid_function(aux);	// Apply the activation function
	}
}

void layer_hidden2(float intro[C_HIDD],float outputs[C_HIDD2]){
	L1:for(int i = 0; i < C_HIDD2 ; i++){
		float aux = 0;

		L2:for(int j = 0; j<C_HIDD ; j++){
			aux += intro[j]*WeightHidden2[i][j];
		}

		aux += BiasesHidden2[i];
		outputs[i] = sigmoid_function(aux);
	}
}

void layer_output(float intro[C_HIDD2],float outputs[C_OUT]){
	L1:for(int i = 0; i < C_OUT ; i++){
		float aux = 0;

		L2:for(int j = 0; j<C_HIDD2 ; j++){
			aux += intro[j]*WeightOut[i][j];
		}

		aux += BiasesOut[i];
		outputs[i] = sigmoid_function(aux);
	}
}

uint8_t MLP (hls::stream<AXI_VAL> &INPUT_STREAM, hls::stream<AXI_VAL> &OUTPUT_STREAM){
	#pragma HLS INTERFACE mode=s_axilite bundle=control port=return
	#pragma HLS INTERFACE mode=axis      port=INPUT_STREAM
	#pragma HLS INTERFACE mode=axis      port=OUTPUT_STREAM

	// outputs/inputs arrays for the layers
	float image_pixels[C_INTRO];
	float l_hidden1_outputs[C_HIDD];
	float l_hidden2_outputs[C_HIDD2];
	float l_out_outputs[C_OUT];

	for(int i=0; i<IMG_DIM; i++)
		for(int j=0; j<IMG_DIM; j+= NUM_ELEMS_WORD){
			#pragma HLS PIPELINE II=1
			WORD_MEM w = INPUT_STREAM.read().data;
			conv_t c;
			for (int k=0; k<NUM_ELEMS_WORD;k++) {
				c.in = w((k+1)*32-1,k*32);
				image_pixels[(i*IMG_DIM) + (j+k)] = c.out;
			}
		}

	layer_hidden1(image_pixels, l_hidden1_outputs);
	layer_hidden2(l_hidden1_outputs, l_hidden2_outputs);
	layer_output(l_hidden2_outputs, l_out_outputs);

	// Write results in the output stream
	for(int j=0; j<C_OUT; j+= NUM_ELEMS_WORD) {
		AXI_VAL e;
		conv_t c;
		WORD_MEM w;

		for (int k=0; k<NUM_ELEMS_WORD;k++) {

			c.out = l_out_outputs[j+k];
			w((k+1)*32-1,k*32)= c.in;
		}
		e.data = w;
		e.strb = -1;
		e.keep = 15; //e.strb;
		e.user = U;
		e.last = (j == (C_OUT-NUM_ELEMS_WORD));
		e.id = TI;
		e.dest = TD;
		OUTPUT_STREAM.write(e);
	}

	int digit = get_most_probable(l_out_outputs);

	return digit;
}
