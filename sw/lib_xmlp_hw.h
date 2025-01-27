
#ifndef H_LIB_EXAMPLE_HW_H
#define H_LIB_EXAMPLE_HW_H

#define IMG_DIM    28
#define IMGPIXELES  ((IMG_DIM)*(IMG_DIM))
#define XPAR_FABRIC_MLP_0_INTERRUPT_INTR 61


//int Setup_HW_Accelerator(float image[IMGPIXELES], float results[10]);

int Run_HW_Accelerator(float image[IMGPIXELES], float results[10]);

int Start_HW_Accelerator(void);

#endif
