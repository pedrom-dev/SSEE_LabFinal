// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xmlp.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMlp_CfgInitialize(XMlp *InstancePtr, XMlp_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMlp_Start(XMlp *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_ReadReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_AP_CTRL) & 0x80;
    XMlp_WriteReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMlp_IsDone(XMlp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_ReadReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMlp_IsIdle(XMlp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_ReadReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMlp_IsReady(XMlp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_ReadReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMlp_EnableAutoRestart(XMlp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_WriteReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XMlp_DisableAutoRestart(XMlp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_WriteReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XMlp_Get_return(XMlp *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_ReadReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_AP_RETURN);
    return Data;
}
void XMlp_InterruptGlobalEnable(XMlp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_WriteReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_GIE, 1);
}

void XMlp_InterruptGlobalDisable(XMlp *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_WriteReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_GIE, 0);
}

void XMlp_InterruptEnable(XMlp *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMlp_ReadReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_IER);
    XMlp_WriteReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_IER, Register | Mask);
}

void XMlp_InterruptDisable(XMlp *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMlp_ReadReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_IER);
    XMlp_WriteReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_IER, Register & (~Mask));
}

void XMlp_InterruptClear(XMlp *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_WriteReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_ISR, Mask);
}

u32 XMlp_InterruptGetEnabled(XMlp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMlp_ReadReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_IER);
}

u32 XMlp_InterruptGetStatus(XMlp *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMlp_ReadReg(InstancePtr->Control_BaseAddress, XMLP_CONTROL_ADDR_ISR);
}

