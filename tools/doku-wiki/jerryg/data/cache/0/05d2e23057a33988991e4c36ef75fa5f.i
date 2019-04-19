a:32:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"FAQ";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1212:"
Q: How to save virtual machine in vmware station?
Ans:
1. add new disk in another virtual machine
2. mount this disk
-2.1
[root@nas_824366_a /]# lsblk
NAME                             MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
fd0                                2:0    1    4K  0 disk
sda                                8:0    0   40G  0 disk
├─sda1                             8:1    0  500M  0 part  /boot
└─sda2                             8:2    0  3.5G  0 part
  ├─centos_centos7--minimal-root 253:0    0  3.1G  0 lvm   /
  └─centos_centos7--minimal-swap 253:1    0  412M  0 lvm   [SWAP]
sdb                                8:16   0    3G  0 disk
└─md127                            9:127  0    3G  0 raid1 /cfpool
sdc                                8:32   0    3G  0 disk
sdd                                8:48   0   16G  0 disk  /Pool-1/f1
sde                                8:64   0   30G  0 disk
├─sde1                             8:65   0    1G  0 part
└─sde2                             8:66   0   29G  0 part
sr0                               11:0    1 1024M  0 rom

-2.2
[root@nas_824366_a /]# blkid /dev/sdf1
/dev/sdf1: UUID="f11f5b97-886f-4d06-94b5-ad48b78d2119" TYPE="xfs"

";i:1;N;i:2;N;}i:2;i:24;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1246;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"mount lvm volume";i:1;i:1;i:2;i:1246;}i:2;i:1246;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1246;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1246;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"lsblk (find the partition of lvm)";}i:2;i:1277;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1316;}i:10;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1084:"
NAME                             MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
fd0                                2:0    1    4K  0 disk
sda                                8:0    0   40G  0 disk
├─sda1                             8:1    0  500M  0 part  /boot
└─sda2                             8:2    0  3.5G  0 part
  ├─centos_centos7--minimal-root 253:0    0  3.1G  0 lvm   /
  └─centos_centos7--minimal-swap 253:1    0  412M  0 lvm   [SWAP]
sdb                                8:16   0    3G  0 disk
└─md127                            9:127  0    3G  0 raid1
sdc                                8:32   0    3G  0 disk
sdd                                8:48   0   16G  0 disk
sde                                8:64   0   40G  0 disk
├─sde1                             8:65   0  500M  0 part  /backup_drive
└─sde2                             8:66   0 39.5G  0 part
  ├─centos-swap                  253:2    0  3.9G  0 lvm
  └─centos-root                  253:3    0 35.6G  0 lvm   /backup_drive2
sr0                               11:0    1 1024M  0 rom

";i:1;N;i:2;N;}i:2;i:1316;}i:11;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1316;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"pvscan";}i:2;i:2409;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2421;}i:14;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:489:"
[root@nas_824366_a ~]# pvscan
  connect() failed on local socket: No such file or directory
  Internal cluster locking initialisation failed.
  WARNING: Falling back to local file-based locking.
  Volume Groups with the clustered attribute will be inaccessible.
  PV /dev/sde2   VG centos                   lvm2 [39.51 GiB / 44.00 MiB free]
  PV /dev/sda2   VG centos_centos7-minimal   lvm2 [3.51 GiB / 40.00 MiB free]
  Total: 2 [43.02 GiB] / in use: 2 [43.02 GiB] / in no VG: 0 [0   ]

";i:1;N;i:2;N;}i:2;i:2421;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2421;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"lvscan (check lvm status)";}i:2;i:2919;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2950;}i:18;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:128:"
termcb:~ # lvscan
inactive '/dev/VolGroup00/LogVol00' [26.06 GB] inherit
inactive '/dev/VolGroup00/LogVol01' [1.75 GB] inherit
";i:1;N;i:2;N;}i:2;i:2950;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2950;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"vgchange -ay (active lvm)";}i:2;i:3087;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3118;}i:22;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:124:"
termcb:~ # lvscan
ACTIVE '/dev/VolGroup00/LogVol00' [26.06 GB] inherit
ACTIVE '/dev/VolGroup00/LogVol01' [1.75 GB] inherit
";i:1;N;i:2;N;}i:2;i:3118;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3118;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"lvdisplay (get the LV Path, LV Name and VG Name)";}i:2;i:3251;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3305;}i:26;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1202:"
 --- Logical volume ---
  LV Path                /dev/centos_centos7-minimal/swap
  LV Name                swap
  VG Name                centos_centos7-minimal
  LV UUID                EeWHu7-Dmsp-fG7Q-WO8T-1jJP-sxAr-npvAt4
  LV Write Access        read/write
  LV Creation host, time localhost, 2015-08-10 03:05:45 +0000
  LV Status              available
  # open                 2
  LV Size                412.00 MiB
  Current LE             103
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:1

  --- Logical volume ---
  LV Path                /dev/centos_centos7-minimal/root
  LV Name                root
  VG Name                centos_centos7-minimal
  LV UUID                6EUXGX-Ug4s-v4PG-9HEV-LoWP-07lT-4k0fNd
  LV Write Access        read/write
  LV Creation host, time localhost, 2015-08-10 03:05:45 +0000
  LV Status              available
  # open                 1
  LV Size                3.07 GiB
  Current LE             785
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:0

";i:1;N;i:2;N;}i:2;i:3305;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3305;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"mount /dev/centos_centos7-minimal/root /mnt/data";}i:2;i:4517;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4565;}i:30;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4566;}i:31;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4566;}}