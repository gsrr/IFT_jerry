a:22:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Kernel io";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:77:"
Q1 : 有辦法trace出整個io的路嗎? (從file system 到driver寫進io)
";i:1;N;i:2;N;}i:2;i:30;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:117;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"dentry";i:1;i:1;i:2;i:117;}i:2;i:117;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:117;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:14:"
# structure

";i:1;N;i:2;N;}i:2;i:143;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:166;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"sys call";i:1;i:1;i:2;i:166;}i:2;i:166;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:166;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1366:"
Q4 : system call of access
Ans :
access(user space) -->access(kernel space, open.c) --> faccessat(open.c)

Q3 : 在link_path_walk裡面, 一開始的nd是working directory, 這會導致連/lib/..的path也都跑到ift_inode_permission.
Ans :
後來改法是... 直接改在path_walk外面, 當有fail時, walk again without rcu mode.


Q2 : ls的flow為何?
Ans : 
1. filename_lookup --> path_lookupat --> link_path_walk --> may_lookup (namei.c) --> (wrong)

2. SYSCALL_DEFINE4(open.c) --> do_sys_open --> do_filp_open(nami.c) --> path_openat(nami.c, LOOKUP_RCU) -->  link_path_walk --> may_lookup -->

[explaination]
1. do_flip_open
Ans:
1. do_flip_open的作用主要是在解析文件路徑並新建一個file structure.
2. do_flip_open : input為path name, output為file structure.
filp是翻動, 所以等於是一直翻動路徑來進行open.
3. nameidata类型的nd在整个路径查找过程中充当中间变量，它既可以为当前查找输入数据，又可以保存本次查找的结果

Q1 : How to map from user-space to kernel-space?
Ans :
假使我們從user space看到一個system call為openat, 
從unistd.h可以看到這個define of this system call:
__SYSCALL(288, sys_openat, 4)

然後搜尋SYSCALL_DEFINE4, 可以在open.c中看到該function:
SYSCALL_DEFINE4(openat, int, dfd, const char __user *, filename, int, flags, umode_t, mode)

";i:1;N;i:2;N;}i:2;i:193;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1569;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"iattr";i:1;i:1;i:2;i:1569;}i:2;i:1569;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1569;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1:"
";i:1;N;i:2;N;}i:2;i:1594;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1605;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"user_namespace";i:1;i:1;i:2;i:1605;}i:2;i:1605;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1605;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2:"

";i:1;N;i:2;N;}i:2;i:1639;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1649;}i:21;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1649;}}