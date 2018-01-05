a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"strace";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"python - debug with gdb";i:1;i:1;i:2;i:24;}i:2;i:24;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:24;}i:6;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2577:"
[FAQ]
[MAX_OUTPUT_LEN]
1. in python-pdb.py
2. 增加output 的長度

Q4 : 可以用gdb改變程式的fd路徑嗎?
Ans :

Q3 : 如何設定break point?
Ans : 
1. break PyEval_EvalFrameEx if (strcmp((((PyStringObject *)(f->f_code->co_name))->ob_sval), "foo") == 0)
2. (參考 my-gdb.py)
(gdb) py-bk Hello
Breakpoint 1 at 0x7fd390fefb00: file Python/ceval.c, line 759.
(gdb) c
Continuing.
stop

Breakpoint 1, PyEval_EvalFrameEx (
    f=f@entry=Frame 0x7fd3913c33e0, for file test.py, line 3, in Hello (name='Jerry', dic={'test': 2, 'key': 1}),
    throwflag=throwflag@entry=0) at Python/ceval.c:759
759     Python/ceval.c: No such file or directory.
(gdb)

Q2 : 如何印出python的變數內容?
Ans :

Q1 : py-bt print出來的訊息會被truncated, 要如何印出完整的訊息?
for example:
#9 Frame 0x7f759788e578, for file /usr/local/NAS/misc/HAAgent/HAServer.py, line 2913, in main (sys=<module at remote 0x7f75ab374bb0>, server=<HAServer(setInfoLock={'NFSInfo': <thread.lock at remote 0x7f75970f5710>, 'WEBDAVInfo': <thread.lock at remote 0x7f75970f57d0>, 'FTPInfo': <thread.lock at remote 0x7f75970f5750>, 'ServiceInfo': <thread.lock at remote 0x7f75970f5870>, 'MonitorInfo': <thread.lock at remote 0x7f75970f58d0>, 'DiskInfo': <thread.lock at remote 0x7f75970f5bf0>, 'ShareInfo': <thread.lock at remote 0x7f75970f5e70>, 'MDInfo': <thread.lock at remote 0x7f7594064270>, 'AvInfo': <thread.lock at remote 0x7f75940640d0>, 'SystemInfo': <thread.lock at remote 0x7f75970f5cf0>, 'LVMInfo': <thread.lock at remote 0x7f7594064430>, 'UserInfo': <thread.lock at remote 0x7f7594064390>, 'RSYNCDInfo': <thread.lock at remote 0x7f75970f5810>, 'AFPInfo': <thread.lock at remote 0x7f75970f5d50>, 'PasswdManageInfo': <thread.lock at remote 0x7f75970f5a50>, 'NetworkInfo': <thread.lock at remote 0x7f75940642d0>, 'CIFSInfo': <th...(truncated)

Ans:
需修改python-gdb裡面的參數:
MAX_OUTPUT_LEN=1024

[gdb-extension]
1. source python-gdb.py
https://raw.githubusercontent.com/WiserTogether/python27/master/python-gdb.py

2. source py-fields.py
https://gist.github.com/kouk/5c2e725bef8b54aae6e0

[Installation]
1. yum install gdb python-debuginfo
2. yum install yum-utils
3. debuginfo-install glibc
4. debuginfo-install python

[Reference]
1. python - gdb support
https://docs.python.org/devguide/gdb.html

2. gdb python online document
https://sourceware.org/gdb/onlinedocs/gdb/Breakpoints-In-Python.html#Breakpoints-In-Python

3. DebuggingWithGdb
https://wiki.python.org/moin/DebuggingWithGdb

4. Extended gdb using python
https://sourceware.org/gdb/onlinedocs/gdb/Python.html
";i:1;N;i:2;N;}i:2;i:67;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2654;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"gdb";i:1;i:1;i:2;i:2654;}i:2;i:2654;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2654;}i:10;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1725:"

[gdb usage]
# go to desired frame number
1. frame frame-number

# gdb print value of whole array
(gdb) p *array@len

(gdb) p/x *blob.data@468
$21 = {0x4, 0x0, 0x4, 0x0, 0x0, 0x0, 0x2, 0x0, 0x4, 0x0, 0x2, 0x0, 0x1, 0x0, 0x26, 0x89, 0x39, 0xba, 0xdd, 0x76, 0x94, 0xf7, 0x30, 0x1e, 0x1e, 0x56, 0x8c,
  0x14, 0x60, 0x73, 0xc5, 0x74, 0xd4, 0x11, 0x98, 0xb6, 0x23, 0xc6, 0xaa, 0xad, 0x6c, 0xa4, 0x58, 0xb3, 0x55, 0x65, 0x0 <repeats 32 times>, 0x70, 0x6f,
  0x73, 0x69, 0x78, 0x5f, 0x61, 0x63, 0x6c, 0x0, 0x4, 0xaa, 0xf7, 0x3d, 0xda, 0x4e, 0xd3, 0x1, 0x76, 0xc4, 0xcc, 0xf8, 0xf8, 0x5b, 0x2a, 0x55, 0x86, 0xae,
  0x49, 0x5b, 0xa1, 0x19, 0x27, 0x1d, 0x60, 0x8f, 0xfe, 0x81, 0x9d, 0x95, 0xa9, 0x6c, 0x18, 0x24, 0x35, 0x40, 0x33, 0x2c, 0xbc, 0x1, 0x0 <repeats 32 times>,
  0x1, 0x0, 0x4, 0x9c, 0xb4, 0x0, 0x0, 0x0, 0xd0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xe0, 0x0, 0x0, 0x0, 0x1, 0x5, 0x0, 0x0, 0x0, 0x0, 0x0, 0x5, 0x15, 0x0,
  0x0, 0x0, 0x9a, 0x51, 0xc0, 0xfd, 0x13, 0xe, 0x69, 0xd1, 0xe9, 0x71, 0xd2, 0xbc, 0xe8, 0x3, 0x0, 0x0, 0x1, 0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x16, 0x2, 0x0,
  0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x0, 0xf4, 0x0, 0x9, 0x0, 0x0, 0x0, 0x0, 0x3, 0x24, 0x0, 0xff, 0x1, 0x1f, 0x0, 0x1, 0x5, 0x0, 0x0...}

# gdb print hex value
p/x var

# print variable
1. print variable-name
2. p variable-name

# backtrace
1. bt
2. bt full

# x command
Displays the memory contents at a given address using the specified format.

# stop gdb
1. q
2. quit

[Reference]
1. gdb reference
http://visualgdb.com/gdbreference

2. Debugging with gdb
https://sourceware.org/gdb/onlinedocs/gdb/

3. debug for thread, multi-process
http://www.study-area.org/cyril/opentools/opentools/x1265.html

# command
gdb /usr/bin/smbd path/to/the/core

";i:1;N;i:2;N;}i:2;i:2677;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4411;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"crash";i:1;i:1;i:2;i:4411;}i:2;i:4411;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4411;}i:14;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:252:"
[FAQ]

[BASIC]
# memory information
1. vm <pid>
2. ps | grpe yas3 | awk '{sum += $8} END {print sum}'

# stack of a process
1. ps | grep rsync
2. bt <pid>

# process information
1. ps

# command
1. crash vmcore vmlinux_kernel2017-10-24_180426_37bc122
";i:1;N;i:2;N;}i:2;i:4436;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4696;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4696;}}