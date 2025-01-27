// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xmlp.h"

extern XMlp_Config XMlp_ConfigTable[];

#ifdef SDT
XMlp_Config *XMlp_LookupConfig(UINTPTR BaseAddress) {
	XMlp_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XMlp_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XMlp_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XMlp_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMlp_Initialize(XMlp *InstancePtr, UINTPTR BaseAddress) {
	XMlp_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMlp_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMlp_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XMlp_Config *XMlp_LookupConfig(u16 DeviceId) {
	XMlp_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMLP_NUM_INSTANCES; Index++) {
		if (XMlp_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMlp_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMlp_Initialize(XMlp *InstancePtr, u16 DeviceId) {
	XMlp_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMlp_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMlp_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

