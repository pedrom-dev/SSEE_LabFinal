// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XMLP_H
#define XMLP_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xmlp_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XMlp_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMlp;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMlp_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMlp_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMlp_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMlp_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XMlp_Initialize(XMlp *InstancePtr, UINTPTR BaseAddress);
XMlp_Config* XMlp_LookupConfig(UINTPTR BaseAddress);
#else
int XMlp_Initialize(XMlp *InstancePtr, u16 DeviceId);
XMlp_Config* XMlp_LookupConfig(u16 DeviceId);
#endif
int XMlp_CfgInitialize(XMlp *InstancePtr, XMlp_Config *ConfigPtr);
#else
int XMlp_Initialize(XMlp *InstancePtr, const char* InstanceName);
int XMlp_Release(XMlp *InstancePtr);
#endif

void XMlp_Start(XMlp *InstancePtr);
u32 XMlp_IsDone(XMlp *InstancePtr);
u32 XMlp_IsIdle(XMlp *InstancePtr);
u32 XMlp_IsReady(XMlp *InstancePtr);
void XMlp_EnableAutoRestart(XMlp *InstancePtr);
void XMlp_DisableAutoRestart(XMlp *InstancePtr);
u32 XMlp_Get_return(XMlp *InstancePtr);


void XMlp_InterruptGlobalEnable(XMlp *InstancePtr);
void XMlp_InterruptGlobalDisable(XMlp *InstancePtr);
void XMlp_InterruptEnable(XMlp *InstancePtr, u32 Mask);
void XMlp_InterruptDisable(XMlp *InstancePtr, u32 Mask);
void XMlp_InterruptClear(XMlp *InstancePtr, u32 Mask);
u32 XMlp_InterruptGetEnabled(XMlp *InstancePtr);
u32 XMlp_InterruptGetStatus(XMlp *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
