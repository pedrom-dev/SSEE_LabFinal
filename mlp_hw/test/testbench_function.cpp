#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

#include "mlp.h"


#define N_PRUEBAS 1
#define NIMAGES 10000
#define IMGPIXELES 784
#define C_OUT 10

const int m_imageCount = 10000;

float m_pixelsFloat[IMGPIXELES*NIMAGES];
uint8_t* m_labels;
uint8_t* m_pixels;
uint8_t* m_labelData[8+NIMAGES];
uint8_t* m_imageData[16+NIMAGES*IMGPIXELES];

void load_matrix_image(T image[IMG_DIM][IMG_DIM], float* pixels);
void convert2array(WORD_MEM a, T out[NUM_ELEMS_WORD]);
void convert2word(WORD_MEM &a, T out[NUM_ELEMS_WORD]);

///////////////////////////////////////7
//Estas funciones leen la base de datos de las imagenes de caracteres de los archivo ubyte,
//que tienen un formato concreto

uint32_t EndianSwap (uint32_t a){
    return (a<<24) | ((a<<8) & 0x00ff0000) |
           ((a>>8) & 0x0000ff00) | (a>>24);
}


bool Load(){
    FILE* file = fopen("t10k-labels-idx1-ubyte","rb");
    if (!file){
        printf("could not open the archive for reading.\n");
        return false;
    }
    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    //m_labelData = malloc(fileSize*sizeof(uint8_t));
    fseek(file, 0, SEEK_SET);
    fread(m_labelData, fileSize, 1, file);
    fclose(file);
    uint32_t* data = (uint32_t*)m_labelData;
        if (data[0] == 0x01080000){
            data[0] = EndianSwap(data[0]);
            data[1] = EndianSwap(data[1]);
    }


    if (data[0] != 2049 || data[1] != NIMAGES){
        printf("Label data had unexpected header values.n");
        return false;
    }
    m_labels = (uint8_t*)&(data[2]);

    file = fopen("t10k-images-idx3-ubyte","rb");
    if (!file){
        printf("could not open the archive for reading.\n");
        return false;
    }

    fseek(file, 0, SEEK_END);
    fileSize = ftell(file);
    //m_imageData = malloc(fileSize*sizeof(uint8_t));
    fseek(file, 0, SEEK_SET);
    fread(m_imageData, fileSize, 1, file);
    fclose(file);

    data = (uint32_t*)m_imageData;
    if (data[0] == 0x03080000){
        data[0] = EndianSwap(data[0]);
        data[1] = EndianSwap(data[1]);
        data[2] = EndianSwap(data[2]);
        data[3] = EndianSwap(data[3]);
    }

    if (data[0] != 2051 || data[1] != NIMAGES || data[2] != 28 || data[3] != 28){
        printf("Label data had unexpected header values.n");
        return false;
    }
    m_pixels = (uint8_t*)&(data[4]);

    for (size_t i = 0; i < IMGPIXELES * NIMAGES; ++i){
        m_pixelsFloat[i] = (float)m_pixels[i] / 255.0f;
    }
    
    return 1;
}

uint8_t GetLabel(size_t index){
    return m_labels[index];
}

float* GetImage (size_t index, uint8_t label){
    label = m_labels[index];
    return &m_pixelsFloat[index * 28 * 28];
}


int main(){
	int aciertos=0;
	int digito = 0;

    Load();

    hls::stream<AXI_VAL> inp_stream("INSW");
    hls::stream<AXI_VAL> out_stream("OUTSW");
    AXI_VAL e;

    for(int ntest=0; ntest<N_PRUEBAS;ntest++){	
    	T image[IMG_DIM][IMG_DIM];
    	float* pixels = GetImage(ntest,GetLabel(ntest));

    	load_matrix_image(image, pixels);

    	for(int i=0; i<IMG_DIM; i++){
    		for(int j=0; j<IMG_DIM; j+=NUM_ELEMS_WORD){
    			convert2word(e.data,&image[i][j]);

    			e.strb = -1;
    			e.keep = 15; //e.strb;
    			e.user = 0;
    			e.last = 0;
    			e.id = 1;
    			e.dest = 2;

    			inp_stream.write(e);
    		}
    	}
    	digito = MLP(inp_stream, out_stream);

		if(digito==GetLabel(ntest)){
			aciertos++;
		}

		T probabilities[C_OUT];
		for(int j=0; j<C_OUT; j+=NUM_ELEMS_WORD) {
            e = out_stream.read();
			convert2array(e.data,&probabilities[j]);

		}
		printf("[Test %d]: Label: %d - Returned: %d\n", ntest, GetLabel(ntest), digito);

	}
	printf("\nACIERTOS: %i/%d \n\n", aciertos, N_PRUEBAS);

    return 0;
}

void load_matrix_image(T image[IMG_DIM][IMG_DIM], float* pixels){
	for(int i=0; i<IMG_DIM; i++){
		for(int j=0; j<IMG_DIM; j++){
			image[i][j] = (float) pixels[i*IMG_DIM + j];
		}
	}
}

void convert2array(WORD_MEM w, T out[NUM_ELEMS_WORD]) {
	conv_t c;

	convert2array_label1:for (int k=0; k<NUM_ELEMS_WORD;k++) {

		c.in = w((k+1)*32-1,k*32);
		out[k] = c.out;
	}

}

void convert2word(WORD_MEM &w, T in[NUM_ELEMS_WORD]) {
	conv_t c;
	WORD_MEM _w;

	convert2word_label0:for (int k=0; k<NUM_ELEMS_WORD;k++) {
		c.out = in[k];
		_w((k+1)*32-1,k*32)= c.in;
	}
	w = _w;
}
