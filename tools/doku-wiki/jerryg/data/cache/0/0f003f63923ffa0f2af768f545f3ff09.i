a:22:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"FAQ for ubuntu";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1244:"
Q4 : 之前想到的一個問題, 因為東西都是存在Disk裡面, 作業系統起來前又沒有driver, 那怎麼去Disk讀取東西?
Ans:


Q3 : Download Linux archive
Ans :
1. https://www.kernel.org/
2. https://jerrynest.io/ubuntu-16-04-compile-linux-kernel/
[Installation]
1. apt-get install build-essential ncurses-dev libssl-dev build-essential ncurses-dev xz-utils kernel-package
2. apt install libelf-dev
3. copy config:
  3.1 cp /boot/config-4.4.0-21-generic .
  3.2 make menuconfig

4. build:
  4.1 make -j 4
  4.2 make modules -j 4
  4.3 make modules_install
  4.4 make install


Q2 : 修改grup, 改變開機的kernel版本.
Ans:
1. GRUB_DEFAULT="Advanced options for Ubuntu>Ubuntu, with Linux 4.14.24-041424-generic"
2. update-grub

[Error Message]
Q1 : SSL error?

root@jerry05-pc:/datapool/linux-4.18# make modules_install
  INSTALL arch/x86/crypto/aegis128-aesni.ko
At main.c:163:
- SSL error:0909006C:PEM routines:get_name:no start line: ../crypto/pem/pem_lib.c:745
sign-file: certs/signing_key.pem: Success
make[1]: *** [scripts/Makefile.modinst:36: arch/x86/crypto/aegis128-aesni.ko] Error 1
make: *** [Makefile:1234: _modinst_] Error 2

Ans : 
將另外一台的certs/signing_key.pem內容轉貼過來.
(為什麼呢?)

";i:1;N;i:2;N;}i:2;i:35;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1289;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"FAQ for CentOS";i:1;i:1;i:2;i:1289;}i:2;i:1289;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1289;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2642:"
Reference:
1. Command of grub shell
https://www.gnu.org/software/grub/manual/grub/html_node/Command_002dline-and-menu-entry-commands.html

2. ftrace
2.1 https://lwn.net/Articles/365835/
2.2 https://lwn.net/Articles/370423/

3. trace-cmd
https://jvns.ca/blog/2017/03/19/getting-started-with-ftrace/

Q5 : list all function we can trace
Ans:
trace-cmd list -f

Q4 : Follow Q3, how to instead of trace-cmd?
Ans:
# Installation
yum install trace-cmd

# start tracing
trace-cmd record -p function -l vfs_rename

# test
[root@localhost tracing]# touch /root/file1
[root@localhost tracing]# touch /root/file2
[root@localhost tracing]# mv /root/file1 /root/file2

# report
trace-cmd report

  systemd-logind-697   [000]  7223.051802: function:             vfs_rename
  systemd-logind-697   [000]  7223.052213: function:             vfs_rename
  systemd-logind-697   [000]  7223.053609: function:             vfs_rename
  systemd-logind-697   [000]  7223.053931: function:             vfs_rename
  systemd-logind-697   [000]  7223.054199: function:             vfs_rename
    in:imjournal-1038  [000]  7223.077906: function:             vfs_rename
    in:imjournal-1038  [000]  7223.080635: function:             vfs_rename
    in:imjournal-1038  [000]  7223.090365: function:             vfs_rename
              mv-8999  [000]  7228.777209: function:             vfs_rename



Q3 : How to trace function name in kernel?
Ans:
# enable ftrace
[root@localhost ~]# cd /sys/kernel/debug/tracing
[root@localhost tracing]# echo function > current_tracer
[root@localhost tracing]# cat current_tracer

function

[root@localhost tracing]# echo 1 > tracing_on

# set filter
[root@localhost tracing]# echo vfs_rename > set_ftrace_filter
[root@localhost tracing]# cat set_ftrace_filter

vfs_rename

# test
[root@localhost tracing]# touch /root/file1
[root@localhost tracing]# touch /root/file2
[root@localhost tracing]# mv /root/file1 /root/file2
[root@localhost tracing]# cat trace

              mv-8971  [000] ....  6834.971361: vfs_rename <-SYSC_renameat2
    in:imjournal-1038  [000] ....  6834.974515: vfs_rename <-SYSC_renameat2

Q2 : Enter emergency mode after booting from grub shell?
Ans:
1. Enter /sysroot
2. modify the grou2/grup.cfg
(The system message show read-only mount point.)
so ...
1. umount /sysroot
2. mount /dev/sda1 /sysroot
3. Enter /sysroot and modify the grup.cfg again.

Q1 : Error in grub.cfg?
Ans:
1. The OS can not boot normally if error in grub.cfg.
2. The terminal will stop in grub shell. --> grub>

We can boot from grub shell:
1. linux /boot/vmlinuz-3.13.0-29-generic 
2. initrd /boot/initrd.img-3.13.0-29-generic
3. boot



";i:1;N;i:2;N;}i:2;i:1323;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3975;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Debug by GDB";i:1;i:1;i:2;i:3975;}i:2;i:3975;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:3975;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1:"
";i:1;N;i:2;N;}i:2;i:4007;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4019;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Tools";i:1;i:1;i:2;i:4019;}i:2;i:4019;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4019;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:204:"
# Get ip address from booting.
1. /etc/sysconfig/network-scripts/ifcfg-ens192
2. ONBOOT=yes

# ssh login without password
1. ssh-keygen
2. ssh-copy-id -i ~/.ssh/id_rsa.pub remote-host
3. ssh remote-host
";i:1;N;i:2;N;}i:2;i:4044;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4258;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Kernel";i:1;i:1;i:2;i:4258;}i:2;i:4258;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4258;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1281:"
[Reference]
1. https://wiki.centos.org/zh-tw/HowTos/Custom_Kernel
2. https://wiki.centos.org/zh-tw/HowTos/I_need_the_Kernel_Source

Q2 : printk?
Ans :
1. dmesg -n 8  #print message from 1 to 8
2. cat /proc/sys/kernel/printk
3. printk() 採用的默認級別是 DEFAULT_MESSAGE_LOGLEVEL，這個在 kernel/printk.c 中被定義為整數 4
4. echo '7 7 7 7' > /proc/sys/kernel/printk
(分別表示當前控制台日誌級別、未明確指定日誌級別的默認消息日誌級別、最小（最高）允許設置的控制台日誌級別、引導時默認的日誌級別)
5.
#define KERN_EMERG    "<0>"    /* system is unusable */
#define KERN_ALERT    "<1>"    /* action must be taken immediately */
#define KERN_CRIT     "<2>"    /* critical conditions */
#define KERN_ERR      "<3>"    /* error conditions */
#define KERN_WARNING  "<4>"    /* warning conditions */
#define KERN_NOTICE   "<5>"    /* normal but significant */
#define KERN_INFO     "<6>"    /* informational */
#define KERN_DEBUG    "<7>"    /* debug-level messages */


Q1 : What is the difference between kernel-devel and kernel-source?
Ans : 
1. kernel-devle 
kernel-devel包只包含用于内核开发环境所需的内核头文件以及Makefile.

2. kernel-source
kernel-souce包含所有内核源代码。

";i:1;N;i:2;N;}i:2;i:4285;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5574;}i:21;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5574;}}