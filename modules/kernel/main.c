/*
  VitaShell
  Copyright (C) 2015-2018, TheFloW

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <psp2kern/kernel/cpu.h>
#include <psp2kern/kernel/modulemgr.h>
#include <psp2kern/kernel/sysmem.h>
#include <psp2kern/kernel/threadmgr.h>
#include <psp2kern/io/fcntl.h>

#include <stdio.h>
#include <string.h>

#include <taihen.h>

#include "vitashell_kernel.h"

#define MOUNT_POINT_ID 0x800

int module_get_export_func(SceUID pid, const char *modname, uint32_t libnid, uint32_t funcnid, uintptr_t *func);
int module_get_offset(SceUID pid, SceUID modid, int segidx, size_t offset, uintptr_t *addr);

typedef struct {
  const char *dev;
  const char *dev2;
  const char *blkdev;
  const char *blkdev2;
  int id;
} SceIoDevice;

typedef struct {
  int id;
  const char *dev_unix;
  int unk;
  int dev_major;
  int dev_minor;
  const char *dev_filesystem;
  int unk2;
  SceIoDevice *dev;
  int unk3;
  SceIoDevice *dev2;
  int unk4;
  int unk5;
  int unk6;
  int unk7;
} SceIoMountPoint;

static SceIoDevice uma_ux0_dev = { "ux0:", "exfatux0", "sdstor0:uma-pp-act-a", "sdstor0:uma-lp-act-entire", MOUNT_POINT_ID };

static SceIoMountPoint *(* sceIoFindMountPoint)(int id) = NULL;

static SceIoDevice *ori_dev = NULL, *ori_dev2 = NULL;

static SceUID hookid = -1;

static tai_hook_ref_t ksceSysrootIsSafeModeRef;

static tai_hook_ref_t ksceSblAimgrIsDolceRef;

static int ksceSysrootIsSafeModePatched() {
  return 1;
}

static int ksceSblAimgrIsDolcePatched() {
  return 1;
}

int shellKernelIsUx0Redirected() {
  uint32_t state;
  ENTER_SYSCALL(state);

  SceIoMountPoint *mount = sceIoFindMountPoint(MOUNT_POINT_ID);
  if (!mount) {
    EXIT_SYSCALL(state);
    return -1;
  }

  if (mount->dev == &uma_ux0_dev && mount->dev2 == &uma_ux0_dev) {
    EXIT_SYSCALL(state);
    return 1;
  }

  EXIT_SYSCALL(state);
  return 0;
}

int shellKernelRedirectUx0() {
  uint32_t state;
  ENTER_SYSCALL(state);

  SceIoMountPoint *mount = sceIoFindMountPoint(MOUNT_POINT_ID);
  if (!mount) {
    EXIT_SYSCALL(state);
    return -1;
  }

  if (mount->dev != &uma_ux0_dev && mount->dev2 != &uma_ux0_dev) {
    ori_dev = mount->dev;
    ori_dev2 = mount->dev2;
  }

  mount->dev = &uma_ux0_dev;
  mount->dev2 = &uma_ux0_dev;

  EXIT_SYSCALL(state);
  return 0;
}

int shellKernelUnredirectUx0() {
  uint32_t state;
  ENTER_SYSCALL(state);

  SceIoMountPoint *mount = sceIoFindMountPoint(MOUNT_POINT_ID);
  if (!mount) {
    EXIT_SYSCALL(state);
    return -1;
  }

  if (ori_dev && ori_dev2) {
    mount->dev = ori_dev;
    mount->dev2 = ori_dev2;

    ori_dev = NULL;
    ori_dev2 = NULL;
  }

  EXIT_SYSCALL(state);
  return 0;
}

int _shellKernelMountById(ShellMountIdArgs *args) {
  int res;

  void *(* sceAppMgrFindProcessInfoByPid)(void *data, SceUID pid);
  int (* sceAppMgrMountById)(SceUID pid, void *info, int id, const char *titleid, const char *path, const char *desired_mount_point, const void *klicensee, char *mount_point);
  int (* _ksceKernelGetModuleInfo)(SceUID pid, SceUID modid, SceKernelModuleInfo *info);

  // Get tai module info
  tai_module_info_t tai_info;
  tai_info.size = sizeof(tai_module_info_t);
  if (taiGetModuleInfoForKernel(KERNEL_PID, "SceAppMgr", &tai_info) < 0)
    return SCE_KERNEL_START_SUCCESS;

  switch (tai_info.module_nid) {
    case 0xDBB29DB7: // 3.60 retail
      module_get_offset(KERNEL_PID, tai_info.modid, 0, 0x2DE1, (uintptr_t *)&sceAppMgrFindProcessInfoByPid);
      module_get_offset(KERNEL_PID, tai_info.modid, 0, 0x19B51, (uintptr_t *)&sceAppMgrMountById);
      break;
      
    case 0x1C9879D6: // 3.65 retail
      module_get_offset(KERNEL_PID, tai_info.modid, 0, 0x2DE1, (uintptr_t *)&sceAppMgrFindProcessInfoByPid);
      module_get_offset(KERNEL_PID, tai_info.modid, 0, 0x19E61, (uintptr_t *)&sceAppMgrMountById);
      break;
      
    case 0x54E2E984: // 3.67 retail
      module_get_offset(KERNEL_PID, tai_info.modid, 0, 0x2DE1, (uintptr_t *)&sceAppMgrFindProcessInfoByPid);
      module_get_offset(KERNEL_PID, tai_info.modid, 0, 0x19E6D, (uintptr_t *)&sceAppMgrMountById);
      break;
  }

  res = module_get_export_func(KERNEL_PID, "SceKernelModulemgr", 0xC445FA63, 0xD269F915, (uintptr_t *)&_ksceKernelGetModuleInfo);
  if (res < 0)
    res = module_get_export_func(KERNEL_PID, "SceKernelModulemgr", 0x92C9FFC2, 0xDAA90093, (uintptr_t *)&_ksceKernelGetModuleInfo);
  if (res < 0)
    return res;

  // Module info
  SceKernelModuleInfo mod_info;
  mod_info.size = sizeof(SceKernelModuleInfo);
  res = _ksceKernelGetModuleInfo(KERNEL_PID, tai_info.modid, &mod_info);
  if (res < 0)
    return res;

  uint32_t appmgr_data_addr = (uint32_t)mod_info.segments[1].vaddr;
  
  SceUID process_id = ksceKernelGetProcessId();

  void *info = sceAppMgrFindProcessInfoByPid((void *)(appmgr_data_addr + 0x500), process_id);
  if (!info)
    return -1;

  char process_titleid[12];
  char path[256];
  char desired_mount_point[16];
  char mount_point[16];
  char klicensee[16];

  memset(mount_point, 0, sizeof(mount_point));

  if (args->process_titleid)
    ksceKernelStrncpyUserToKernel(process_titleid, (uintptr_t)args->process_titleid, 11);
  if (args->path)
    ksceKernelStrncpyUserToKernel(path, (uintptr_t)args->path, 255);
  if (args->desired_mount_point)
    ksceKernelStrncpyUserToKernel(desired_mount_point, (uintptr_t)args->desired_mount_point, 15);
  if (args->klicensee)
    ksceKernelMemcpyUserToKernel(klicensee, (uintptr_t)args->klicensee, 0x10);
  
  res = sceAppMgrMountById(process_id, info + 0x580, args->id, args->process_titleid ? process_titleid : NULL, args->path ? path : NULL,
                           args->desired_mount_point ? desired_mount_point : NULL, args->klicensee ? klicensee : NULL, mount_point);

  if (args->mount_point)
    ksceKernelStrncpyKernelToUser((uintptr_t)args->mount_point, mount_point, 15);

  return res;
}

int shellKernelMountById(ShellMountIdArgs *args) {
  uint32_t state;
  ENTER_SYSCALL(state);

  ShellMountIdArgs k_args;
  ksceKernelMemcpyUserToKernel(&k_args, (uintptr_t)args, sizeof(ShellMountIdArgs));

  int res = ksceKernelRunWithStack(0x2000, (void *)_shellKernelMountById, &k_args);

  EXIT_SYSCALL(state);
  return res;
}

int shellKernelGetRifVitaKey(const void *license_buf, void *klicensee) {
  char k_license_buf[0x200];
  char k_klicensee[0x10];
  
  memset(k_klicensee, 0, sizeof(k_klicensee));

  if (license_buf)
    ksceKernelMemcpyUserToKernel(k_license_buf, license_buf, sizeof(k_license_buf));
  
  int res = ksceNpDrmGetRifVitaKey(k_license_buf, k_klicensee, NULL, NULL, NULL, NULL); 

  if (klicensee)
    ksceKernelMemcpyKernelToUser(klicensee, k_klicensee, sizeof(k_klicensee));

  return res;
}

void _start() __attribute__ ((weak, alias("module_start")));
int module_start(SceSize args, void *argp) {
  SceUID tmp1, tmp2;
  // Get tai module info
  tai_module_info_t info;
  info.size = sizeof(tai_module_info_t);
  if (taiGetModuleInfoForKernel(KERNEL_PID, "SceIofilemgr", &info) < 0)
    return SCE_KERNEL_START_SUCCESS;

  // Get important function
  switch (info.module_nid) {
    case 0x9642948C: // 3.60 retail
      module_get_offset(KERNEL_PID, info.modid, 0, 0x138C1, (uintptr_t *)&sceIoFindMountPoint);
      break;
      
    case 0xA96ACE9D: // 3.65 retail
    case 0x3347A95F: // 3.67 retail
      module_get_offset(KERNEL_PID, info.modid, 0, 0x182F5, (uintptr_t *)&sceIoFindMountPoint);
      break;
      
    default:
      return SCE_KERNEL_START_SUCCESS;
  }

  // Fake safe mode so that SceUsbMass can be loaded
  tmp1 = taiHookFunctionExportForKernel(KERNEL_PID, &ksceSysrootIsSafeModeRef, "SceSysmem", 0x2ED7F97A, 0x834439A7, ksceSysrootIsSafeModePatched);
  if (tmp1 < 0)
    return SCE_KERNEL_START_SUCCESS;
  // this patch is only needed on handheld units
  tmp2 = taiHookFunctionExportForKernel(KERNEL_PID, &ksceSblAimgrIsDolceRef, "SceSysmem", 0xFD00C69A, 0x71608CA3, ksceSblAimgrIsDolcePatched);
  if (tmp2 < 0)
    return SCE_KERNEL_START_SUCCESS;

  // Load SceUsbMass
  SceUID modid = ksceKernelLoadStartModule("ux0:VitaShell_JP/module/umass.skprx", 0, NULL, 0, NULL, NULL);

  // Release patch
  taiHookReleaseForKernel(tmp1, ksceSysrootIsSafeModeRef);
  taiHookReleaseForKernel(tmp2, ksceSblAimgrIsDolceRef);

  // Check result
  if (modid < 0)
    return SCE_KERNEL_START_SUCCESS;

  // Fake safe mode in SceUsbServ
  hookid = taiHookFunctionImportForKernel(KERNEL_PID, &ksceSysrootIsSafeModeRef, "SceUsbServ", 0x2ED7F97A, 0x834439A7, ksceSysrootIsSafeModePatched);

  return SCE_KERNEL_START_SUCCESS;
}

int module_stop(SceSize args, void *argp) {
  if (hookid >= 0)
    taiHookReleaseForKernel(hookid, ksceSysrootIsSafeModeRef);

  return SCE_KERNEL_STOP_SUCCESS;
}