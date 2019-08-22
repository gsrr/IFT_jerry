a:19:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"hal_app";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1174:"
   12  hal_app --pd_sys_scan enc_sys_id=root
   13  hal_app --pd_sys_scan enc_sys_id=root_boot
   14  hal_app --pd_sys_scan enc_sys_id=root_usb
   15  hal_app --se_sys_scan
   16  vi /var/log/hal_lib.log
   17  udevadm info -a -n /dev/sdb | egrep 'looking|DRIVER'
   18  hal_app --se_sys_scan
   19  hal_app --se_sys_scan
   20  cat /sys/block/sdb/device/qnap_param_latency
   21  ps aux | grep udev
   22  vi /var/log/udev.log
   23  hal_app --se_scan
   24  vi /etc/enclosure_1.conf
   25  cat /sys/block/sdf/device/qnap_param_latency
   26  fdisk -l | grep Disk
   27  cat /sys/block/sdb/device/qnap_param_latency
   28  hal_app --pd_sys_scan enc_sys_id=usb_4-1
   29  cat /sys/block/sdb/device/generic/dev
   30  ls -altr /sys/class/scsi_generic/
   31  cat /sys/class/scsi_generic/sg5/device/vendor
   32  cat /sys/class/scsi_generic/sg5/device/device
   33  cat /sys/class/scsi_generic/sg5/device/model
   34  cat /sys/class/scsi_generic/sg1/device/device
   35  cat /sys/class/scsi_generic/sg1/device/vendor
   36  cat /sys/class/scsi_generic/sg1/device/model
   37  cat /sys/class/scsi_generic/sg2/device/model
   38  cat /sys/class/scsi_generic/sg2/device/vendor

";i:1;N;i:2;N;}i:2;i:28;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1212;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"patch";i:1;i:1;i:2;i:1212;}i:2;i:1212;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1212;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:100:"
# create patch file by git
git diff HEAD^ > /root/kernel.patch

# patch
patch -p1 -i kernel.patch

";i:1;N;i:2;N;}i:2;i:1237;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1347;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:39:"add a new nasutil module - ulink_iotest";i:1;i:1;i:2;i:1347;}i:2;i:1347;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1347;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:873:"
1. Add a makefile and c file

## c file
#include <stdio.h>

int main()
{
    printf("Hello World\n");
    return 0;
}
============================
# Makefile for ulink_iotest

INCLUDE = -I$(NAS_LIB_PATH)/include -I$(NAS_LIB_PATH)/uLinux

LIBS = -L${ROOT_PATH}/usr/lib -L${TARGET_PREFIX}/usr/lib -luLinux_Storage

#CROSS_COMPILE = arm-none-linux-gnueabi-
CC = ${CROSS_COMPILE}gcc
CFLAGS = -Wall -O2

all: ulink_iotest

ulink_iotest: ulink_iotest.c
    $(CC) $(CFLAGS) $(INCLUDES) ulink_iotest.c -o ulink_iotest $(LIBS)

install :
    ${CROSS_COMPILE}strip ulink_iotest
    install --mode=755 ulink_iotest ${ROOT_PATH}/sbin

clean:
    rm -f *.o ulink_iotest
    
    
 ==================================
2. Add module name(folder name) in Makefile of NasUtil

ifeq (${QNAP_HAL_SUPPORT},yes)
    ALL+= hal_util storage_util br_util ssdutil pic_tool snapshot_util ulink_util
";i:1;N;i:2;N;}i:2;i:1406;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2289;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"qtools";i:1;i:1;i:2;i:2289;}i:2;i:2289;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2289;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:141:"
# get qtools
rsync -a root@172.17.22.57:/root/qtools ./

# clone repository
git clone ssh://jerriecheng@172.17.21.62/home/git/linux.git




";i:1;N;i:2;N;}i:2;i:2315;}i:16;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2652:"
# 更換ko file
root@VM-73:~/initrd# cp ~/upgimg/update_img/initrd.boot .
root@VM-73:~/initrd# xz -dc initrd.boot | cpio -id
root@VM-73:~/initrd# rm -rf initrd.boot
root@VM-73:~/initrd# cp ~/thunderbolt/initrd/patch_for_tbt_virtual_nic.tgz .
root@VM-73:~/initrd# tar zxvf patch_for_tbt_virtual_nic.tgz -C .
root@VM-73:~/initrd# find . | sudo cpio -H newc -o  | lzma -9 > ../initrd.boot; cd ..; cksum initrd.boot > initrd.boot.cksum
------------------------------
主要就是更換initrd.boot這個檔案, 因為ko file在裡面的lib/modules/misc裡面, 所以需要幾個步驟:
1. 解開initrd.boot
--> xz -dc initrd.boot | cpio -id

2. 將ko file更換進去
--> cp /root/Jerry_linux_4.14/NasX86/Driver-linux-4.14/drivers/sas/mv-6.0.0.1009N/mv14xx.ko lib/modules/misc/mv14xx.ko
3. 重新壓縮initrd.boot與checksum file.
--> find . | sudo cpio -H newc -o  | lzma -9 > ../initrd.boot; cd ..; cksum initrd.boot > initrd.boot.cksum

4. 將DOM裡面的file更換.
5. 重開機

# Build da_util
gcc -Wall -O2 -I/root/Jerry_qts_4.5.0/NasX86/NasLib/include -I/root/Jerry_qts_4.5.0/NasX86/NasLib/uLinux -I/root/Jerry_qts_4.5.0/NasX86/NasLib/hal da_util.c -o da_util -L/root/Jerry_qts_4.5.0/NasX86/Model/TS-X71/build/RootFS/usr/lib -L/root/Jerry_qts_4.5.0/NasX86/Model/TS-X71/build/RootFS/usr/lib -L/root/Jerry_qts_4.5.0/NasX86/Model/TS-X71/build/RootFS/lib -luLinux_Storage -luLinux_hal
--> 不能單build, 會有reference的問題.

gcc -c -I//root/jerry_alpha/NasX86/NasLib/storage_man_v2 -I/root/Jerry_qts_4.5.0/NasX86/NasLib/include -I/root/jerry_alpha/NasX86/NasLib/uLinux -I/root/jerry_alpha/NasX86/NasLib/hal da_sas.c da_iotest.c da_util.c da_func.c da_system.c -L/root/jerry_alpha/NasX86/Model/TS-X71/build/RootFS/usr/lib -L/root/jerry_alpha/NasX86/Model/TS-X71/build/RootFS/usr/lib -L/root/jerry_alpha/NasX86/Model/TS-X71/build/RootFS/lib -luLinux_Storage -luLinux_hal -luLinux_ini


# Build full image
time make CPU_N=-j8 BUILD_OPT=pure 2>&1 | tee log 

# Build Kernel
time make CPU_N=-j4 BUILD_OPT=pure BASE KERNEL 2>&1 | tee log

# Build NasUtil
time make CPU_N=-j4 BUILD_OPT=pure NAS_UTILITY 2>&1 | tee log

# Build NasLib
time make CPU_N=-j4 BUILD_OPT=pure NAS_LIBRARY 2>&1 | tee log

# Build Marvell controller
(under /root/Jerry_linux_4.14/NasX86/Driver-linux-4.14/drivers/sas/mv-6.0.0.1009N in this example)
make ARCH=x86_64 CC=/root/CT/x86_64-QNAP-linux-gnu/cross-tools/bin/x86_64-QNAP-linux-gnu-gcc LD=/root/CT/x86_64-QNAP-linux-gnu/cross-tools/bin/x86_64-QNAP-linux-gnu-ld CROSS_COMPILE=/root/CT/x86_64-QNAP-linux-gnu/cross-tools/bin/x86_64-QNAP-linux-gnu- V= -C /root/Jerry_linux_4.14/NasX86/Kernel/linux-4.14 SUBDIRS=`pwd` modules

";i:1;N;i:2;N;}i:2;i:2471;}i:17;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5131;}i:18;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5131;}}