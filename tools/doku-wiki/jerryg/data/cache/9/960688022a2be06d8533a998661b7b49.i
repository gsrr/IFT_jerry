a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1511:"
# python 
import os
os.getuid()
os.geteuid()
os.getuid()
os.seteuid()

# Difference between setuid() and seteuid()
setuid() -- 身分改變 (變不回去, root -> 1008), 此時uid and euid都是1008
seteuid() -- 職務改變, 身分不變 (root --> 1008 --> root), 此時uid是0, euid是1008

# status of process
cat /proc/16882/status
[root@CentOS7-Build Cmd]# cat /proc/16882/status
Name:   ipython
State:  T (stopped)
Tgid:   16882
Ngid:   0
Pid:    16882
PPid:   14855
TracerPid:      0
Uid:    0       1008    0       1008
Gid:    0       0       0       0
FDSize: 256
Groups: 0
VmPeak:   461836 kB
VmSize:   396568 kB
VmLck:         0 kB
VmPin:         0 kB
VmHWM:     33672 kB
VmRSS:     32296 kB
RssAnon:           27588 kB
RssFile:            4708 kB
RssShmem:              0 kB
VmData:   174116 kB
VmStk:       136 kB
VmExe:         4 kB
VmLib:     11212 kB
VmPTE:       320 kB
VmSwap:        0 kB
Threads:        1
SigQ:   1/15080
SigPnd: 0000000000000000
ShdPnd: 0000000000000000
SigBlk: 0000000000000000
SigIgn: 0000000001001000
SigCgt: 0000000188000002
CapInh: 0000000000000000
CapPrm: 0000001fffffffff
CapEff: 0000000000000000
CapBnd: 0000001fffffffff
CapAmb: 0000000000000000
Seccomp:        0
Cpus_allowed:   1
Cpus_allowed_list:      0
Mems_allowed:   00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,0000001
Mems_allowed_list:      0
voluntary_ctxt_switches:        210
nonvoluntary_ctxt_switches:     59
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}