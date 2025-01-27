/*
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "xstatus.h"
#include "xtmrctr.h"
#include "xaxidma.h"

#include "ff.h"

#include "lib_xmlp_hw.h"

#define IMAGES_FILE "images"
#define LABELS_FILE "labels"

#define NIMAGES 10000	//Numero de imagenes
#define IMGPIXELES 784	// 28x28 pixeles cada imagen
#define IMG_DIM 28
#define C_OUT 10
#define NUM_TESTS 10

static FATFS fat_fs;

// TIMER Instance
XTmrCtr timer_dev;

// AXI DMA Instance
XAxiDma AxiDma;

// Images loading
const int m_imageCount = 10000;

float m_pixelsFloat[IMGPIXELES*NIMAGES];
uint8_t* m_labels;
uint8_t* m_pixels;
uint8_t* m_labelData[8+NIMAGES];
uint8_t* m_imageData[16+NIMAGES*IMGPIXELES];

// Filesystem management
u32 mount_filesystem() {
	TCHAR *Path = "0:/";
	FRESULT res;
	res = f_mount(&fat_fs, Path, 1);

	if (res != FR_OK) {
		xil_printf("mount failed %d\n\r",res);
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

u32 umount_filesystem() {
	TCHAR *Path = "0:/";
	FRESULT res;
	res = f_mount(NULL, Path, 0);

	if (res != FR_OK) {
		xil_printf("umount failed %d\n\r",res);
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

// Images loading functions
uint32_t EndianSwap (uint32_t a){
    return (a<<24) | ((a<<8) & 0x00ff0000) |
           ((a>>8) & 0x0000ff00) | (a>>24);
}

u32 Load(){
	FIL file;
	u32 bytes_read = 0;

	if (mount_filesystem() == XST_FAILURE)
			return XST_FAILURE;

	FRESULT res = f_open(&file, LABELS_FILE, FA_READ);  // Abrir el archivo

	if (res != FR_OK) {
		xil_printf("\rCould not open the labels file %d\n\r",res);
		return XST_FAILURE;
	}

    long fileSize = f_size(&file);
    //m_labelData = malloc(fileSize*sizeof(uint8_t));
    //f_lseek(&fp, 0);	//Seek to beginning
    f_read(&file, m_labelData, fileSize, &bytes_read);
    f_close(&file);

    uint32_t* data = (uint32_t*)m_labelData;
        if (data[0] == 0x01080000){
            data[0] = EndianSwap(data[0]);
            data[1] = EndianSwap(data[1]);
    }


    if (data[0] != 2049 || data[1] != NIMAGES){
        printf("\rLabel data had unexpected header values\n\r");
        return 0;
    }
    m_labels = (uint8_t*)&(data[2]);

    // Read images
    res = f_open(&file, IMAGES_FILE, FA_READ);  // Abrir el archivo

    if (res != FR_OK) {
    	xil_printf("\rCould not open the images file %d\n\r",res);
    	return XST_FAILURE;
    }

    fileSize = f_size(&file);
    //m_imageData = malloc(fileSize*sizeof(uint8_t));
    //f_lseek(&fp, 0);	//Seek to beginning
    f_read(&file, m_imageData, fileSize, &bytes_read);
    f_close(&file);

    data = (uint32_t*)m_imageData;
    if (data[0] == 0x03080000){
        data[0] = EndianSwap(data[0]);
        data[1] = EndianSwap(data[1]);
        data[2] = EndianSwap(data[2]);
        data[3] = EndianSwap(data[3]);
    }

    if (data[0] != 2051 || data[1] != NIMAGES || data[2] != 28 || data[3] != 28){
        printf("Label data had unexpected header values.n");
        return 0;
    }
    m_pixels = (uint8_t*)&(data[4]);

    for (size_t i = 0; i < IMGPIXELES * NIMAGES; ++i){
        m_pixelsFloat[i] = (float)m_pixels[i] / 255.0f;
    }

    umount_filesystem();

    return 1;
}

uint8_t GetLabel(size_t index){
    return m_labels[index];
}

float* GetImage (size_t index, uint8_t label, float dest[IMGPIXELES]){
    label = m_labels[index];
    int aux = index * IMGPIXELES;
    for(int i=0; i<IMGPIXELES; i++){
    	dest[i] = m_pixelsFloat[aux+i];
    }
    return &m_pixelsFloat[aux];
}

int GetResults(float results[10]){
	int digit = 0;
	for(int i=0; i<10; i++){
		if(results[digit]<results[i]){
			digit = i;
		}
		//printf("\r[%d]: %f", i, results[i]);
	}
	return digit;
}

int init_dma(){
	XAxiDma_Config *CfgPtr;
	int status;

	CfgPtr = XAxiDma_LookupConfig( (XPAR_AXI_DMA_0_DEVICE_ID) );
	if(!CfgPtr){
		print("Error looking for AXI DMA config\n\r");
		return XST_FAILURE;
	}
	status = XAxiDma_CfgInitialize(&AxiDma,CfgPtr);
	if(status != XST_SUCCESS){
		print("Error initializing DMA\n\r");
		return XST_FAILURE;
	}
	//check for scatter gather mode
	if(XAxiDma_HasSg(&AxiDma)){
		print("Error DMA configured in SG mode\n\r");
		return XST_FAILURE;
	}
	/* Disable interrupts, we use polling mode */
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	// Reset DMA
	XAxiDma_Reset(&AxiDma);
	while (!XAxiDma_ResetIsDone(&AxiDma)) {}

	return XST_SUCCESS;
}


int main()
{
	int status;

	float acc_factor;
	unsigned int init_time, curr_time, calibration;
	unsigned int begin_time;
	unsigned int end_time;
	unsigned int run_time_sw = 0;
	unsigned int run_time_hw = 0;

    init_platform();
    /*
    Xil_DCacheFlushRange((unsigned int)m_pixelsFloat, (IMGPIXELES*NIMAGES)*sizeof(float));
    Xil_DCacheFlushRange((unsigned int)m_labels, sizeof(float)*(8+NIMAGES));
    Xil_DCacheFlushRange((unsigned int)m_pixels, sizeof(float)*(16+NIMAGES*IMGPIXELES));
    Xil_DCacheFlushRange((unsigned int)m_labelData, sizeof(float)*(8+NIMAGES));
    Xil_DCacheFlushRange((unsigned int)m_imageData, sizeof(float)*(16+NIMAGES*IMGPIXELES));*/

    /* ******************************************************************************* */
    // Load Images and labels
    Load();
    print("\rImages and labels loaded\n\r");

    /* ******************************************************************************* */
    // Init DMA
    status = init_dma();
    if(status != XST_SUCCESS){
      	print("\rError: DMA init failed\n");
       	return XST_FAILURE;
    }
    print("\nDMA Init done\n");

    /* ******************************************************************************* */
    // Setup HW timer
    status = XTmrCtr_Initialize(&timer_dev, XPAR_AXI_TIMER_0_DEVICE_ID);
    if(status != XST_SUCCESS)
    {
    	print("Error: timer setup failed\n");
    	//return XST_FAILURE;
    }
    XTmrCtr_SetOptions(&timer_dev, XPAR_AXI_TIMER_0_DEVICE_ID, XTC_ENABLE_ALL_OPTION);

    // Calibrate HW timer
    XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_0_DEVICE_ID);
    init_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_0_DEVICE_ID);
    curr_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_0_DEVICE_ID);
    calibration = curr_time - init_time;

    // Loop measurement
    XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_0_DEVICE_ID);
    begin_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_0_DEVICE_ID);
    for (int i = 0; i< NUM_TESTS; i++);
    end_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_0_DEVICE_ID);
    run_time_sw = end_time - begin_time - calibration;
    xil_printf("Loop time for %d iterations is %d cycles\n", NUM_TESTS, run_time_sw);

    /* ******************************************************************************* */
    // call the HW accelerator
    XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_0_DEVICE_ID);
    begin_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_0_DEVICE_ID);

    /* ******************************************************************************* */
    // Run HW_ACCEL
    int aciertos=0;

    status = Start_HW_Accelerator(); //Just once

    for(int i=0; i < NUM_TESTS; i++){
    	float image[IMGPIXELES];
    	float results[10];
    	int digit = 0;
    	//printf("\r[TEST %d]\n", (i+1));

    	// Setup the HW Accelerator
    	//printf("HW start done\n");

    	//flush the cache. You have to do this every time data is changed
    	Xil_DCacheFlushRange((unsigned int)image, IMGPIXELES*sizeof(float));
    	Xil_DCacheFlushRange((unsigned int)results, 10*sizeof(float));

    	//printf("Cache cleared\n");

    	GetImage(i,GetLabel(i), image);
    	digit = Run_HW_Accelerator(image, results);
    	//digit = GetResults(results);
    	printf("HW (%d/%d) run done -> Label: %d  -  Returned: %d\n", (i+1), NUM_TESTS, GetLabel(i), digit);

    	if(digit==GetLabel(i)){
    		aciertos++;
    	}
    }

    printf("\rAciertos: %d/%d", aciertos, NUM_TESTS);

    cleanup_platform();
    return 0;
}
