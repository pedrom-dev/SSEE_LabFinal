
#include "platform.h"
#include "xparameters.h"

#include "lib_xmlp_hw.h"
#include "xscugic.h"
#include "xaxidma.h"
#include "xmlp.h"
#include "xil_printf.h"

volatile static int ResultExample = 0;

XMlp xmlp_dev;

XMlp_Config xmlp_config = {
	0,
	XPAR_MLP_0_S_AXI_CONTROL_BASEADDR
};

//Interrupt Controller Instance
XScuGic ScuGic;

// AXI DMA Instance
extern XAxiDma AxiDma;


int XMlpSetup(){
	return XMlp_CfgInitialize(&xmlp_dev,&xmlp_config);
}

void XMlpStart(void *InstancePtr){
	XMlp *pExample = (XMlp *)InstancePtr;
	XMlp_InterruptEnable(pExample,1);
	XMlp_InterruptGlobalEnable(pExample);
	XMlp_Start(pExample);
}


void XMlpIsr(void *InstancePtr){
	XMlp *pExample = (XMlp *)InstancePtr;

	//Disable the global interrupt
	XMlp_InterruptGlobalDisable(pExample);
	//Disable the local interrupt
	XMlp_InterruptDisable(pExample,0xffffffff);

	// clear the local interrupt
	XMlp_InterruptClear(pExample,1);

	ResultExample = 1;

	XMlp_InterruptEnable(pExample,1);
	XMlp_InterruptGlobalEnable(pExample);

}

int XMlpSetupInterrupt()
{
	//This functions sets up the interrupt on the ARM
	int result;
	XScuGic_Config *pCfg = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
	if (pCfg == NULL){
		print("Interrupt Configuration Lookup Failed\n\r");
		return XST_FAILURE;
	}
	result = XScuGic_CfgInitialize(&ScuGic,pCfg,pCfg->CpuBaseAddress);
	if(result != XST_SUCCESS){
		return result;
	}
	// self test
	result = XScuGic_SelfTest(&ScuGic);
	if(result != XST_SUCCESS){
		return result;
	}
	// Initialize the exception handler
	Xil_ExceptionInit();
	// Register the exception handler
	//print("Register the exception handler\n\r");
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler,&ScuGic);
	//Enable the exception handler
	Xil_ExceptionEnable();
	// Connect the Adder ISR to the exception table
	//print("Connect the Adder ISR to the Exception handler table\n\r");
	result = XScuGic_Connect(&ScuGic,XPAR_FABRIC_MLP_0_INTERRUPT_INTR,(Xil_InterruptHandler)XMlpIsr,&xmlp_dev);
	if(result != XST_SUCCESS){
		return result;
	}
	//print("Enable the Adder ISR\n\r");
	XScuGic_Enable(&ScuGic,XPAR_FABRIC_MLP_0_INTERRUPT_INTR);
	return XST_SUCCESS;
}

int Setup_HW_Accelerator(float image[IMGPIXELES], float results[10])
//Setup the Vivado HLS Block
{
	int status = XMlpSetup();
	if(status != XST_SUCCESS){
		print("Error: example setup failed\n");
		return XST_FAILURE;
	}
	status =  XMlpSetupInterrupt();
	if(status != XST_SUCCESS){
		print("Error: interrupt setup failed\n");
		return XST_FAILURE;
	}

	XMlpStart(&xmlp_dev);


	return 0;
}





int Start_HW_Accelerator(void)
{
	int status = XMlpSetup();
	if(status != XST_SUCCESS){
		print("Error: example setup failed\n");
		return XST_FAILURE;
	}
	status =  XMlpSetupInterrupt();
	if(status != XST_SUCCESS){
		print("Error: interrupt setup failed\n");
		return XST_FAILURE;
	}

	XMlpStart(&xmlp_dev);

	return 0;
}

int Run_HW_Accelerator(float image[IMGPIXELES], float results[10])
{


	//transfer A to the Vivado HLS block
	int status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) image, sizeof(float)*IMGPIXELES, XAXIDMA_DMA_TO_DEVICE);
	if (status != XST_SUCCESS) {
		print("Error: DMA transfer (A) to Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* You don't have to wait for the confirmation of image arrival.
	 * You'll get an Interruption
	 */

	status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) results, sizeof(float)*10, XAXIDMA_DEVICE_TO_DMA);
	if (status != XST_SUCCESS) {
		print("Error: DMA transfer (C) from Vivado HLS block failed\n");
		return XST_FAILURE;
	}


	while (!ResultExample);
	ResultExample = 0;

	while ((XAxiDma_Busy(&AxiDma, XAXIDMA_DEVICE_TO_DMA)));

	XMlpStart(&xmlp_dev);

	return XMlp_Get_return(&xmlp_dev);;

}
