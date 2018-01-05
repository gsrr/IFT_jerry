a:18:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"io snoop";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:4255:"
# Reference
1. http://www.brendangregg.com/DTrace/iosnoop_example.html

[root@nas_8716691_a Volume_1]# lsblk
NAME                                                                                           MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sda                                                                                              8:0    0   10G  0 disk
├─sda1                                                                                           8:1    0   64M  0 part
├─sda2                                                                                           8:2    0   64M  0 part
├─sda3                                                                                           8:3    0  372M  0 part  /boot
├─sda4                                                                                           8:4    0    1K  0 part
└─sda5                                                                                           8:5    0  9.5G  0 part
  ├─vg_eonfs-swap                                                                              253:0    0    2G  0 lvm
  ├─vg_eonfs-root                                                                              253:1    0  5.5G  0 lvm   /
  └─vg_eonfs-var_log                                                                           253:6    0    2G  0 lvm   /var/log
sdb                                                                                              8:16   0    1G  0 disk
└─md127                                                                                          9:127  0 1023M  0 raid1 /cfpool
sdc                                                                                              8:32   0    1G  0 disk
└─md127                                                                                          9:127  0 1023M  0 raid1 /cfpool
sdd                                                                                              8:48   0    5G  0 disk  /var/crash
sde                                                                                              8:64   0  5.6G  0 disk
├─sde1                                                                                           8:65   0    2G  0 part
│ └─md126                                                                                        9:126  0    2G  0 raid1 /embdEonOne
└─sde2                                                                                           8:66   0  3.6G  0 part
  ├─vg_docker_A-docker--pool_tmeta                                                             253:4    0    4M  0 lvm
  │ └─vg_docker_A-docker--pool                                                                 253:8    0    2G  0 lvm
  │   └─docker-253:1-16947798-416dbe3b1e00f7d05283342464f6f7bda5991048cbdeb5da370f7502c9878f6b 253:2    0   10G  0 dm
  └─vg_docker_A-docker--pool_tdata                                                             253:5    0    2G  0 lvm
    └─vg_docker_A-docker--pool                                                                 253:8    0    2G  0 lvm
      └─docker-253:1-16947798-416dbe3b1e00f7d05283342464f6f7bda5991048cbdeb5da370f7502c9878f6b 253:2    0   10G  0 dm
sdf                                                                                              8:80   0  5.6G  0 disk
├─sdf1                                                                                           8:81   0    2G  0 part
│ └─md126                                                                                        9:126  0    2G  0 raid1 /embdEonOne
└─sdf2                                                                                           8:82   0  3.6G  0 part
sdg                                                                                              8:96   0   10G  0 disk
sdh                                                                                              8:112  0  800G  0 disk  /Pool-1/Volume_1
sdi                                                                                              8:128  0  800G  0 disk  /Pool-1/Volume_1_759361A04A7219F2

# Monitor /Pool-1/Volume_1
[root@nas_8716691_a Volume_1]# iosnoop -d 8,112

";i:1;N;i:2;N;}i:2;i:29;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4294;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"perf";i:1;i:1;i:2;i:4294;}i:2;i:4294;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4294;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:77:"
[Reference]
1. usage-1
http://wiki.csie.ncku.edu.tw/embedded/perf-tutorial

";i:1;N;i:2;N;}i:2;i:4318;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4405;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"strace";i:1;i:1;i:2;i:4405;}i:2;i:4405;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4405;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1:"
";i:1;N;i:2;N;}i:2;i:4431;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4442;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"gprof";i:1;i:1;i:2;i:4442;}i:2;i:4442;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4442;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1300:"
[Reference]
1. [gnu Manuals]
https://ftp.gnu.org/old-gnu/Manuals/gprof-2.9.1/html_chapter/gprof_5.html
2. usage-1
http://os.51cto.com/art/200703/41426.htm

[Attention]
1. Define prefix name of gmon.out.
- export GMON_OUT_PREFIX=some_file_name
(The file will be created with the name "some_file_name.pid")


[Example-1]
1. A c program : 

#include "stdio.h"
#include "stdlib.h"

void a(){
  printf("\t\t+---call a() function\n");
}

void c(){
  printf("\t\t+---call c() function\n");
}

int b(){
printf("\t+--- call b() function\n");
a();
c();
return 0;
}
int main(){
  printf(" main() function()\n");
  b();
}

2. Compile:
gcc -pg test.c

3. Execution
./a.out  # This program will generate gmon.out

4. Show profile
gprof -b a.out gmon.out | less

Each sample counts as 0.01 seconds.
  %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name    
 33.34      0.02     0.02     7208     0.00     0.00  open
 16.67      0.03     0.01      244     0.04     0.12  offtime
 16.67      0.04     0.01        8     1.25     1.25  memccpy
 16.67      0.05     0.01        7     1.43     1.43  write

- cumulative seconds是由上到下的時間累計.
- self seconds是該function執行的花費時間.
- calls是該function被呼叫了幾次 

";i:1;N;i:2;N;}i:2;i:4467;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5776;}i:17;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5776;}}