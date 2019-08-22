a:14:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Questions";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:609:"

Q2 : anon是什麼東西? (Anonymous memory?)
Ans:
Anon blocks are "large" blocks allocated via malloc or mmap.
'[ anon ]' for allocated memory
'[ stack ]' for the program stack

Q1 : pmap -x 跟 ps aux 都可以得到process memory, 但兩者的值並不相同?
Ans :
正常來講, ps aux所得到的值會比pmap -x來得小, 因為:
The SIZE and RSS fields don't count some parts of a process including the page tables, kernel stack, struct thread_info, and struct task_struct. This is usually at least 20 KiB of memory that is always resident. SIZE is the virtual size of the process (code+data+stack).
";i:1;N;i:2;N;}i:2;i:30;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:649;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Basic";i:1;i:1;i:2;i:649;}i:2;i:649;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:649;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:478:"
VZS:
Virtual Memory Size, It includes all memory that the process can access, including memory that is swapped out and memory that is from shared libraries.

RSS: 
RSS is the Resident Set Size and is used to show how much memory is allocated to that process and is in RAM. 
It does not include memory that is swapped out. It does include memory from shared libraries as long as the pages from those libraries are actually in memory. It does include all stack and heap memory.

";i:1;N;i:2;N;}i:2;i:674;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1162;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Command";i:1;i:1;i:2;i:1162;}i:2;i:1162;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1162;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:42897:"
# pmap -x <pid>
# ps aux | grep <pid>
# cat /proc/26239/maps
# cat /proc/26239/status


# pmap -x <pid>
1. report memory map of a process
2. writeable/private : 指不含shared memory的部分.

[root@nas_8771030_a HAAgent]# pmap -x 26239
26239:   /usr/bin/python /usr/local/NAS/misc/Cmd/NASCmd.py -s
Address           Kbytes     RSS   Dirty Mode  Mapping
0000000000400000       4       4       0 r-x-- python2.7
0000000000600000       4       4       4 r---- python2.7
0000000000601000       4       4       4 rw--- python2.7
00000000012b9000    9852    9848    9848 rw---   [ anon ]
0000000001c58000     108     108     108 rw---   [ anon ]
00007fe000000000     292     292     292 rw---   [ anon ]
00007fe000049000   65244       0       0 -----   [ anon ]
00007fe004000000     132     132     132 rw---   [ anon ]
00007fe004021000     620     620     620 rw---   [ anon ]
00007fe0040bc000   64784       0       0 -----   [ anon ]
00007fe00affe000       4       0       0 -----   [ anon ]
00007fe00afff000    8192      12      12 rw---   [ anon ]
00007fe00b7ff000       4       0       0 -----   [ anon ]
00007fe00b800000    8192      24      24 rw---   [ anon ]
00007fe00c000000     132     132     132 rw---   [ anon ]
00007fe00c021000     228     228     228 rw---   [ anon ]
00007fe00c05a000   65176       0       0 -----   [ anon ]
00007fe010277000    1792    1584    1584 rw---   [ anon ]
00007fe010437000       4       0       0 -----   [ anon ]
00007fe010438000   10240    2072    2072 rw---   [ anon ]
00007fe010e38000       4       0       0 -----   [ anon ]
00007fe010e39000    8192      20      20 rw---   [ anon ]
00007fe011639000      16       0       0 r-x-- termios.so
00007fe01163d000    2044       0       0 ----- termios.so
00007fe01183c000       4       4       4 r---- termios.so
00007fe01183d000       8       8       8 rw--- termios.so
00007fe01183f000    2048    2048    2048 rw---   [ anon ]
00007fe011a3f000       8       8       0 r-x-- syslog.so
00007fe011a41000    2044       0       0 ----- syslog.so
00007fe011c40000       4       4       4 r---- syslog.so
00007fe011c41000       4       4       4 rw--- syslog.so
00007fe011c42000     256     256     256 rw---   [ anon ]
00007fe011c82000     708       0       0 r-x-- libsqlite3.so.0.8.6
00007fe011d33000    2044       0       0 ----- libsqlite3.so.0.8.6
00007fe011f32000       8       8       8 r---- libsqlite3.so.0.8.6
00007fe011f34000      12      12      12 rw--- libsqlite3.so.0.8.6
00007fe011f37000      68       0       0 r-x-- _sqlite3.so
00007fe011f48000    2048       0       0 ----- _sqlite3.so
00007fe012148000       4       4       4 r---- _sqlite3.so
00007fe012149000       8       8       8 rw--- _sqlite3.so
00007fe01214b000     256     256     256 rw---   [ anon ]
00007fe01218b000      16       0       0 r-x-- _localemodule.so
00007fe01218f000    2044       0       0 ----- _localemodule.so
00007fe01238e000       4       4       4 r---- _localemodule.so
00007fe01238f000       4       4       4 rw--- _localemodule.so
00007fe012390000     512     512     512 rw---   [ anon ]
00007fe012410000      28       0       0 r-x-- libffi.so.6.0.1
00007fe012417000    2044       0       0 ----- libffi.so.6.0.1
00007fe012616000       4       4       4 r---- libffi.so.6.0.1
00007fe012617000       4       4       4 rw--- libffi.so.6.0.1
00007fe012618000     104      16       0 r-x-- _ctypes.so
00007fe012632000    2044       0       0 ----- _ctypes.so
00007fe012831000       4       4       4 r---- _ctypes.so
00007fe012832000      16      16      16 rw--- _ctypes.so
00007fe012836000      12       0       0 r-x-- fcntlmodule.so
00007fe012839000    2044       0       0 ----- fcntlmodule.so
00007fe012a38000       4       4       4 r---- fcntlmodule.so
00007fe012a39000       4       4       4 rw--- fcntlmodule.so
00007fe012a3a000      20       0       0 r-x-- selectmodule.so
00007fe012a3f000    2044       0       0 ----- selectmodule.so
00007fe012c3e000       4       4       4 r---- selectmodule.so
00007fe012c3f000       8       8       8 rw--- selectmodule.so
00007fe012c41000     256     256     256 rw---   [ anon ]
00007fe012c81000      12       8       0 r-x-- _randommodule.so
00007fe012c84000    2044       0       0 ----- _randommodule.so
00007fe012e83000       4       4       4 r---- _randommodule.so
00007fe012e84000       4       4       4 rw--- _randommodule.so
00007fe012e85000      16       0       0 r-x-- _hashlib.so
00007fe012e89000    2044       0       0 ----- _hashlib.so
00007fe013088000       4       4       4 r---- _hashlib.so
00007fe013089000       4       4       4 rw--- _hashlib.so
00007fe01308a000       4       4       4 rw---   [ anon ]
00007fe01308b000      68       0       0 r-x-- datetime.so
00007fe01309c000    2044       0       0 ----- datetime.so
00007fe01329b000       4       4       4 r---- datetime.so
00007fe01329c000      16      12      12 rw--- datetime.so
00007fe0132a0000     256     256     256 rw---   [ anon ]
00007fe0132e0000      72       0       0 r-x-- cPickle.so
00007fe0132f2000    2048       0       0 ----- cPickle.so
00007fe0134f2000       4       4       4 r---- cPickle.so
00007fe0134f3000       4       4       4 rw--- cPickle.so
00007fe0134f4000     256     256     256 rw---   [ anon ]
00007fe013534000      32      24       0 r-x-- _json.so
00007fe01353c000    2044       0       0 ----- _json.so
00007fe01373b000       4       4       4 r---- _json.so
00007fe01373c000       4       4       4 rw--- _json.so
00007fe01373d000      12       0       0 r-x-- _heapq.so
00007fe013740000    2044       0       0 ----- _heapq.so
00007fe01393f000       4       4       4 r---- _heapq.so
00007fe013940000       8       8       8 rw--- _heapq.so
00007fe013942000      40       0       0 r-x-- itertoolsmodule.so
00007fe01394c000    2044       0       0 ----- itertoolsmodule.so
00007fe013b4b000       4       4       4 r---- itertoolsmodule.so
00007fe013b4c000      20      20      20 rw--- itertoolsmodule.so
00007fe013b51000      36       4       0 r-x-- operator.so
00007fe013b5a000    2044       0       0 ----- operator.so
00007fe013d59000       4       4       4 r---- operator.so
00007fe013d5a000       8       8       8 rw--- operator.so
00007fe013d5c000      24      12       0 r-x-- _collectionsmodule.so
00007fe013d62000    2044       0       0 ----- _collectionsmodule.so
00007fe013f61000       4       4       4 r---- _collectionsmodule.so
00007fe013f62000       8       8       8 rw--- _collectionsmodule.so
00007fe013f64000      20       0       0 r-x-- binascii.so
00007fe013f69000    2044       0       0 ----- binascii.so
00007fe014168000       4       4       4 r---- binascii.so
00007fe014169000       4       4       4 rw--- binascii.so
00007fe01416a000      28      16       0 r-x-- _struct.so
00007fe014171000    2044       0       0 ----- _struct.so
00007fe014370000       4       4       4 r---- _struct.so
00007fe014371000       8       8       8 rw--- _struct.so
00007fe014373000      16       8       0 r-x-- cStringIO.so
00007fe014377000    2044       0       0 ----- cStringIO.so
00007fe014576000       4       4       4 r---- cStringIO.so
00007fe014577000       8       8       8 rw--- cStringIO.so
00007fe014579000     144       0       0 r-x-- liblzma.so.5.0.99
00007fe01459d000    2044       0       0 ----- liblzma.so.5.0.99
00007fe01479c000       4       4       4 r---- liblzma.so.5.0.99
00007fe01479d000       4       4       4 rw--- liblzma.so.5.0.99
00007fe01479e000     384       0       0 r-x-- libpcre.so.1.2.0
00007fe0147fe000    2044       0       0 ----- libpcre.so.1.2.0
00007fe0149fd000       4       4       4 r---- libpcre.so.1.2.0
00007fe0149fe000       4       4       4 rw--- libpcre.so.1.2.0
00007fe0149ff000     132       0       0 r-x-- libselinux.so.1
00007fe014a20000    2048       0       0 ----- libselinux.so.1
00007fe014c20000       4       4       4 r---- libselinux.so.1
00007fe014c21000       4       4       4 rw--- libselinux.so.1
00007fe014c22000       8       4       4 rw---   [ anon ]
00007fe014c24000      88       0       0 r-x-- libresolv-2.17.so
00007fe014c3a000    2048       0       0 ----- libresolv-2.17.so
00007fe014e3a000       4       4       4 r---- libresolv-2.17.so
00007fe014e3b000       4       4       4 rw--- libresolv-2.17.so
00007fe014e3c000       8       0       0 rw---   [ anon ]
00007fe014e3e000      12       0       0 r-x-- libkeyutils.so.1.5
00007fe014e41000    2044       0       0 ----- libkeyutils.so.1.5
00007fe015040000       4       4       4 r---- libkeyutils.so.1.5
00007fe015041000       4       4       4 rw--- libkeyutils.so.1.5
00007fe015042000      52       0       0 r-x-- libkrb5support.so.0.1
00007fe01504f000    2048       0       0 ----- libkrb5support.so.0.1
00007fe01524f000       4       4       4 r---- libkrb5support.so.0.1
00007fe015250000       4       4       4 rw--- libkrb5support.so.0.1
00007fe015251000      84       0       0 r-x-- libz.so.1.2.7
00007fe015266000    2044       0       0 ----- libz.so.1.2.7
00007fe015465000       4       4       4 r---- libz.so.1.2.7
00007fe015466000       4       4       4 rw--- libz.so.1.2.7
00007fe015467000     188       0       0 r-x-- libk5crypto.so.3.1
00007fe015496000    2044       0       0 ----- libk5crypto.so.3.1
00007fe015695000       8       8       8 r---- libk5crypto.so.3.1
00007fe015697000       4       4       4 rw--- libk5crypto.so.3.1
00007fe015698000       4       0       0 rw---   [ anon ]
00007fe015699000      12       0       0 r-x-- libcom_err.so.2.1
00007fe01569c000    2044       0       0 ----- libcom_err.so.2.1
00007fe01589b000       4       4       4 r---- libcom_err.so.2.1
00007fe01589c000       4       4       4 rw--- libcom_err.so.2.1
00007fe01589d000     852       0       0 r-x-- libkrb5.so.3.3
00007fe015972000    2048       0       0 ----- libkrb5.so.3.3
00007fe015b72000      52      52      52 r---- libkrb5.so.3.3
00007fe015b7f000      12      12      12 rw--- libkrb5.so.3.3
00007fe015b82000     292       0       0 r-x-- libgssapi_krb5.so.2.2
00007fe015bcb000    2048       0       0 ----- libgssapi_krb5.so.2.2
00007fe015dcb000       4       4       4 r---- libgssapi_krb5.so.2.2
00007fe015dcc000       8       8       8 rw--- libgssapi_krb5.so.2.2
00007fe015dce000    1780       0       0 r-x-- libcrypto.so.1.0.1e
00007fe015f8b000    2048       0       0 ----- libcrypto.so.1.0.1e
00007fe01618b000     104     104     104 r---- libcrypto.so.1.0.1e
00007fe0161a5000      48      48      48 rw--- libcrypto.so.1.0.1e
00007fe0161b1000      16      16      16 rw---   [ anon ]
00007fe0161b5000     396       0       0 r-x-- libssl.so.1.0.1e
00007fe016218000    2044       0       0 ----- libssl.so.1.0.1e
00007fe016417000      16      16      16 r---- libssl.so.1.0.1e
00007fe01641b000      28      28      28 rw--- libssl.so.1.0.1e
00007fe016422000      76       4       0 r-x-- _ssl.so
00007fe016435000    2044       0       0 ----- _ssl.so
00007fe016634000       4       4       4 r---- _ssl.so
00007fe016635000      16      16      16 rw--- _ssl.so
00007fe016639000      12       4       0 r-x-- _functoolsmodule.so
00007fe01663c000    2044       0       0 ----- _functoolsmodule.so
00007fe01683b000       4       4       4 r---- _functoolsmodule.so
00007fe01683c000       4       4       4 rw--- _functoolsmodule.so
00007fe01683d000      60      28       0 r-x-- _socketmodule.so
00007fe01684c000    2044       0       0 ----- _socketmodule.so
00007fe016a4b000       4       4       4 r---- _socketmodule.so
00007fe016a4c000      20      20      16 rw--- _socketmodule.so
00007fe016a51000       8       0       0 r-x-- grpmodule.so
00007fe016a53000    2044       0       0 ----- grpmodule.so
00007fe016c52000       4       4       4 r---- grpmodule.so
00007fe016c53000       4       4       4 rw--- grpmodule.so
00007fe016c54000      28       0       0 r-x-- math.so
00007fe016c5b000    2044       0       0 ----- math.so
00007fe016e5a000       4       4       4 r---- math.so
00007fe016e5b000       8       8       8 rw--- math.so
00007fe016e5d000     772     772     772 rw---   [ anon ]
00007fe016f1e000      16      12       0 r-x-- timemodule.so
00007fe016f22000    2044       0       0 ----- timemodule.so
00007fe017121000       4       4       4 r---- timemodule.so
00007fe017122000       8       8       8 rw--- timemodule.so
00007fe017124000     148       0       0 r-x-- libtinfo.so.5.9
00007fe017149000    2048       0       0 ----- libtinfo.so.5.9
00007fe017349000      16      16      16 r---- libtinfo.so.5.9
00007fe01734d000       4       4       4 rw--- libtinfo.so.5.9
00007fe01734e000     240       0       0 r-x-- libreadline.so.6.2
00007fe01738a000    2048       0       0 ----- libreadline.so.6.2
00007fe01758a000       8       8       8 r---- libreadline.so.6.2
00007fe01758c000      24      24      24 rw--- libreadline.so.6.2
00007fe017592000       8       8       8 rw---   [ anon ]
00007fe017594000      20       0       0 r-x-- readline.so
00007fe017599000    2044       0       0 ----- readline.so
00007fe017798000       4       4       4 r---- readline.so
00007fe017799000       8       8       8 rw--- readline.so
00007fe01779b000      20       0       0 r-x-- stropmodule.so
00007fe0177a0000    2044       0       0 ----- stropmodule.so
00007fe01799f000       4       4       4 r---- stropmodule.so
00007fe0179a0000       8       8       8 rw--- stropmodule.so
00007fe0179a2000     512     512     512 rw---   [ anon ]
00007fe017a22000     512     512     512 rw---   [ anon ]
00007fe017aa2000  103580       0       0 r---- locale-archive
00007fe01dfc9000    1752     444       0 r-x-- libc-2.17.so
00007fe01e17f000    2048       0       0 ----- libc-2.17.so
00007fe01e37f000      16      16      16 r---- libc-2.17.so
00007fe01e383000       8       8       8 rw--- libc-2.17.so
00007fe01e385000      20      12      12 rw---   [ anon ]
00007fe01e38a000    1028      68       0 r-x-- libm-2.17.so
00007fe01e48b000    2044       0       0 ----- libm-2.17.so
00007fe01e68a000       4       4       4 r---- libm-2.17.so
00007fe01e68b000       4       4       4 rw--- libm-2.17.so
00007fe01e68c000       8       4       0 r-x-- libutil-2.17.so
00007fe01e68e000    2044       0       0 ----- libutil-2.17.so
00007fe01e88d000       4       4       4 r---- libutil-2.17.so
00007fe01e88e000       4       4       4 rw--- libutil-2.17.so
00007fe01e88f000      12       4       0 r-x-- libdl-2.17.so
00007fe01e892000    2044       0       0 ----- libdl-2.17.so
00007fe01ea91000       4       4       4 r---- libdl-2.17.so
00007fe01ea92000       4       4       4 rw--- libdl-2.17.so
00007fe01ea93000      88      68       0 r-x-- libpthread-2.17.so
00007fe01eaa9000    2048       0       0 ----- libpthread-2.17.so
00007fe01eca9000       4       4       4 r---- libpthread-2.17.so
00007fe01ecaa000       4       4       4 rw--- libpthread-2.17.so
00007fe01ecab000      16       4       4 rw---   [ anon ]
00007fe01ecaf000    1772     944       0 r-x-- libpython2.7.so.1.0
00007fe01ee6a000    2044       0       0 ----- libpython2.7.so.1.0
00007fe01f069000       4       4       4 r---- libpython2.7.so.1.0
00007fe01f06a000     248     228     220 rw--- libpython2.7.so.1.0
00007fe01f0a8000      64      64      64 rw---   [ anon ]
00007fe01f0b8000     132      40       0 r-x-- ld-2.17.so
00007fe01f0e3000     256     256     256 rw---   [ anon ]
00007fe01f123000     212       0       0 r--s- passwd
00007fe01f158000     512     512     512 rw---   [ anon ]
00007fe01f209000     788     788     788 rw---   [ anon ]
00007fe01f2d7000       4       4       4 rw---   [ anon ]
00007fe01f2d8000       4       4       4 rw---   [ anon ]
00007fe01f2d9000       4       4       4 r---- ld-2.17.so
00007fe01f2da000       4       4       4 rw--- ld-2.17.so
00007fe01f2db000       4       4       4 rw---   [ anon ]
00007fff3f7da000     132      36      36 rw---   [ stack ]
00007fff3f7fc000       8       4       0 r-x--   [ anon ]
ffffffffff600000       4       0       0 r-x--   [ anon ]
---------------- ------- ------- -------
total kB          469220   25208   23472

# ps aux | grep 26239
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root     26239  0.2  0.6 469008 25208 ?        S    05:10   1:38 /usr/bin/python /usr/local/NAS/misc/Cmd/NASCmd.py -s


# cat /proc/26239/maps
00400000-00401000 r-xp 00000000 fd:01 18184943                           /usr/bin/python2.7
00600000-00601000 r--p 00000000 fd:01 18184943                           /usr/bin/python2.7
00601000-00602000 rw-p 00001000 fd:01 18184943                           /usr/bin/python2.7
012b9000-01c58000 rw-p 00000000 00:00 0                                  [heap]
01c58000-01c73000 rw-p 00000000 00:00 0                                  [heap]
7fe000000000-7fe000049000 rw-p 00000000 00:00 0
7fe000049000-7fe004000000 ---p 00000000 00:00 0
7fe004000000-7fe004021000 rw-p 00000000 00:00 0
7fe004021000-7fe0040bc000 rw-p 00000000 00:00 0
7fe0040bc000-7fe008000000 ---p 00000000 00:00 0
7fe00affe000-7fe00afff000 ---p 00000000 00:00 0
7fe00afff000-7fe00b7ff000 rw-p 00000000 00:00 0
7fe00b7ff000-7fe00b800000 ---p 00000000 00:00 0
7fe00b800000-7fe00c000000 rw-p 00000000 00:00 0
7fe00c000000-7fe00c021000 rw-p 00000000 00:00 0
7fe00c021000-7fe00c05a000 rw-p 00000000 00:00 0
7fe00c05a000-7fe010000000 ---p 00000000 00:00 0
7fe010277000-7fe010437000 rw-p 00000000 00:00 0
7fe010437000-7fe010438000 ---p 00000000 00:00 0
7fe010438000-7fe010e38000 rw-p 00000000 00:00 0                          [stack:26239]
7fe010e38000-7fe010e39000 ---p 00000000 00:00 0
7fe010e39000-7fe011639000 rw-p 00000000 00:00 0
7fe011639000-7fe01163d000 r-xp 00000000 fd:01 39319                      /usr/lib64/python2.7/lib-dynload/termios.so
7fe01163d000-7fe01183c000 ---p 00004000 fd:01 39319                      /usr/lib64/python2.7/lib-dynload/termios.so
7fe01183c000-7fe01183d000 r--p 00003000 fd:01 39319                      /usr/lib64/python2.7/lib-dynload/termios.so
7fe01183d000-7fe01183f000 rw-p 00004000 fd:01 39319                      /usr/lib64/python2.7/lib-dynload/termios.so
7fe01183f000-7fe011a3f000 rw-p 00000000 00:00 0
7fe011a3f000-7fe011a41000 r-xp 00000000 fd:01 39318                      /usr/lib64/python2.7/lib-dynload/syslog.so
7fe011a41000-7fe011c40000 ---p 00002000 fd:01 39318                      /usr/lib64/python2.7/lib-dynload/syslog.so
7fe011c40000-7fe011c41000 r--p 00001000 fd:01 39318                      /usr/lib64/python2.7/lib-dynload/syslog.so
7fe011c41000-7fe011c42000 rw-p 00002000 fd:01 39318                      /usr/lib64/python2.7/lib-dynload/syslog.so
7fe011c42000-7fe011c82000 rw-p 00000000 00:00 0
7fe011c82000-7fe011d33000 r-xp 00000000 fd:01 25300865                   /usr/lib64/libsqlite3.so.0.8.6
7fe011d33000-7fe011f32000 ---p 000b1000 fd:01 25300865                   /usr/lib64/libsqlite3.so.0.8.6
7fe011f32000-7fe011f34000 r--p 000b0000 fd:01 25300865                   /usr/lib64/libsqlite3.so.0.8.6
7fe011f34000-7fe011f37000 rw-p 000b2000 fd:01 25300865                   /usr/lib64/libsqlite3.so.0.8.6
7fe011f37000-7fe011f48000 r-xp 00000000 fd:01 39286                      /usr/lib64/python2.7/lib-dynload/_sqlite3.so
7fe011f48000-7fe012148000 ---p 00011000 fd:01 39286                      /usr/lib64/python2.7/lib-dynload/_sqlite3.so
7fe012148000-7fe012149000 r--p 00011000 fd:01 39286                      /usr/lib64/python2.7/lib-dynload/_sqlite3.so
7fe012149000-7fe01214b000 rw-p 00012000 fd:01 39286                      /usr/lib64/python2.7/lib-dynload/_sqlite3.so
7fe01214b000-7fe01218b000 rw-p 00000000 00:00 0
7fe01218b000-7fe01218f000 r-xp 00000000 fd:01 39280                      /usr/lib64/python2.7/lib-dynload/_localemodule.so
7fe01218f000-7fe01238e000 ---p 00004000 fd:01 39280                      /usr/lib64/python2.7/lib-dynload/_localemodule.so
7fe01238e000-7fe01238f000 r--p 00003000 fd:01 39280                      /usr/lib64/python2.7/lib-dynload/_localemodule.so
7fe01238f000-7fe012390000 rw-p 00004000 fd:01 39280                      /usr/lib64/python2.7/lib-dynload/_localemodule.so
7fe012390000-7fe012410000 rw-p 00000000 00:00 0
7fe012410000-7fe012417000 r-xp 00000000 fd:01 25300710                   /usr/lib64/libffi.so.6.0.1
7fe012417000-7fe012616000 ---p 00007000 fd:01 25300710                   /usr/lib64/libffi.so.6.0.1
7fe012616000-7fe012617000 r--p 00006000 fd:01 25300710                   /usr/lib64/libffi.so.6.0.1
7fe012617000-7fe012618000 rw-p 00007000 fd:01 25300710                   /usr/lib64/libffi.so.6.0.1
7fe012618000-7fe012632000 r-xp 00000000 fd:01 39270                      /usr/lib64/python2.7/lib-dynload/_ctypes.so
7fe012632000-7fe012831000 ---p 0001a000 fd:01 39270                      /usr/lib64/python2.7/lib-dynload/_ctypes.so
7fe012831000-7fe012832000 r--p 00019000 fd:01 39270                      /usr/lib64/python2.7/lib-dynload/_ctypes.so
7fe012832000-7fe012836000 rw-p 0001a000 fd:01 39270                      /usr/lib64/python2.7/lib-dynload/_ctypes.so
7fe012836000-7fe012839000 r-xp 00000000 fd:01 39299                      /usr/lib64/python2.7/lib-dynload/fcntlmodule.so
7fe012839000-7fe012a38000 ---p 00003000 fd:01 39299                      /usr/lib64/python2.7/lib-dynload/fcntlmodule.so
7fe012a38000-7fe012a39000 r--p 00002000 fd:01 39299                      /usr/lib64/python2.7/lib-dynload/fcntlmodule.so
7fe012a39000-7fe012a3a000 rw-p 00003000 fd:01 39299                      /usr/lib64/python2.7/lib-dynload/fcntlmodule.so
7fe012a3a000-7fe012a3f000 r-xp 00000000 fd:01 39315                      /usr/lib64/python2.7/lib-dynload/selectmodule.so
7fe012a3f000-7fe012c3e000 ---p 00005000 fd:01 39315                      /usr/lib64/python2.7/lib-dynload/selectmodule.so
7fe012c3e000-7fe012c3f000 r--p 00004000 fd:01 39315                      /usr/lib64/python2.7/lib-dynload/selectmodule.so
7fe012c3f000-7fe012c41000 rw-p 00005000 fd:01 39315                      /usr/lib64/python2.7/lib-dynload/selectmodule.so
7fe012c41000-7fe012c81000 rw-p 00000000 00:00 0
7fe012c81000-7fe012c84000 r-xp 00000000 fd:01 39284                      /usr/lib64/python2.7/lib-dynload/_randommodule.so
7fe012c84000-7fe012e83000 ---p 00003000 fd:01 39284                      /usr/lib64/python2.7/lib-dynload/_randommodule.so
7fe012e83000-7fe012e84000 r--p 00002000 fd:01 39284                      /usr/lib64/python2.7/lib-dynload/_randommodule.so
7fe012e84000-7fe012e85000 rw-p 00003000 fd:01 39284                      /usr/lib64/python2.7/lib-dynload/_randommodule.so
7fe012e85000-7fe012e89000 r-xp 00000000 fd:01 39275                      /usr/lib64/python2.7/lib-dynload/_hashlib.so
7fe012e89000-7fe013088000 ---p 00004000 fd:01 39275                      /usr/lib64/python2.7/lib-dynload/_hashlib.so
7fe013088000-7fe013089000 r--p 00003000 fd:01 39275                      /usr/lib64/python2.7/lib-dynload/_hashlib.so
7fe013089000-7fe01308a000 rw-p 00004000 fd:01 39275                      /usr/lib64/python2.7/lib-dynload/_hashlib.so
7fe01308a000-7fe01308b000 rw-p 00000000 00:00 0
7fe01308b000-7fe01309c000 r-xp 00000000 fd:01 39296                      /usr/lib64/python2.7/lib-dynload/datetime.so
7fe01309c000-7fe01329b000 ---p 00011000 fd:01 39296                      /usr/lib64/python2.7/lib-dynload/datetime.so
7fe01329b000-7fe01329c000 r--p 00010000 fd:01 39296                      /usr/lib64/python2.7/lib-dynload/datetime.so
7fe01329c000-7fe0132a0000 rw-p 00011000 fd:01 39296                      /usr/lib64/python2.7/lib-dynload/datetime.so
7fe0132a0000-7fe0132e0000 rw-p 00000000 00:00 0
7fe0132e0000-7fe0132f2000 r-xp 00000000 fd:01 39293                      /usr/lib64/python2.7/lib-dynload/cPickle.so
7fe0132f2000-7fe0134f2000 ---p 00012000 fd:01 39293                      /usr/lib64/python2.7/lib-dynload/cPickle.so
7fe0134f2000-7fe0134f3000 r--p 00012000 fd:01 39293                      /usr/lib64/python2.7/lib-dynload/cPickle.so
7fe0134f3000-7fe0134f4000 rw-p 00013000 fd:01 39293                      /usr/lib64/python2.7/lib-dynload/cPickle.so
7fe0134f4000-7fe013534000 rw-p 00000000 00:00 0
7fe013534000-7fe01353c000 r-xp 00000000 fd:01 39279                      /usr/lib64/python2.7/lib-dynload/_json.so
7fe01353c000-7fe01373b000 ---p 00008000 fd:01 39279                      /usr/lib64/python2.7/lib-dynload/_json.so
7fe01373b000-7fe01373c000 r--p 00007000 fd:01 39279                      /usr/lib64/python2.7/lib-dynload/_json.so
7fe01373c000-7fe01373d000 rw-p 00008000 fd:01 39279                      /usr/lib64/python2.7/lib-dynload/_json.so
7fe01373d000-7fe013740000 r-xp 00000000 fd:01 39276                      /usr/lib64/python2.7/lib-dynload/_heapq.so
7fe013740000-7fe01393f000 ---p 00003000 fd:01 39276                      /usr/lib64/python2.7/lib-dynload/_heapq.so
7fe01393f000-7fe013940000 r--p 00002000 fd:01 39276                      /usr/lib64/python2.7/lib-dynload/_heapq.so
7fe013940000-7fe013942000 rw-p 00003000 fd:01 39276                      /usr/lib64/python2.7/lib-dynload/_heapq.so
7fe013942000-7fe01394c000 r-xp 00000000 fd:01 39304                      /usr/lib64/python2.7/lib-dynload/itertoolsmodule.so
7fe01394c000-7fe013b4b000 ---p 0000a000 fd:01 39304                      /usr/lib64/python2.7/lib-dynload/itertoolsmodule.so
7fe013b4b000-7fe013b4c000 r--p 00009000 fd:01 39304                      /usr/lib64/python2.7/lib-dynload/itertoolsmodule.so
7fe013b4c000-7fe013b51000 rw-p 0000a000 fd:01 39304                      /usr/lib64/python2.7/lib-dynload/itertoolsmodule.so
7fe013b51000-7fe013b5a000 r-xp 00000000 fd:01 39309                      /usr/lib64/python2.7/lib-dynload/operator.so
7fe013b5a000-7fe013d59000 ---p 00009000 fd:01 39309                      /usr/lib64/python2.7/lib-dynload/operator.so
7fe013d59000-7fe013d5a000 r--p 00008000 fd:01 39309                      /usr/lib64/python2.7/lib-dynload/operator.so
7fe013d5a000-7fe013d5c000 rw-p 00009000 fd:01 39309                      /usr/lib64/python2.7/lib-dynload/operator.so
7fe013d5c000-7fe013d62000 r-xp 00000000 fd:01 39267                      /usr/lib64/python2.7/lib-dynload/_collectionsmodule.so
7fe013d62000-7fe013f61000 ---p 00006000 fd:01 39267                      /usr/lib64/python2.7/lib-dynload/_collectionsmodule.so
7fe013f61000-7fe013f62000 r--p 00005000 fd:01 39267                      /usr/lib64/python2.7/lib-dynload/_collectionsmodule.so
7fe013f62000-7fe013f64000 rw-p 00006000 fd:01 39267                      /usr/lib64/python2.7/lib-dynload/_collectionsmodule.so
7fe013f64000-7fe013f69000 r-xp 00000000 fd:01 39291                      /usr/lib64/python2.7/lib-dynload/binascii.so
7fe013f69000-7fe014168000 ---p 00005000 fd:01 39291                      /usr/lib64/python2.7/lib-dynload/binascii.so
7fe014168000-7fe014169000 r--p 00004000 fd:01 39291                      /usr/lib64/python2.7/lib-dynload/binascii.so
7fe014169000-7fe01416a000 rw-p 00005000 fd:01 39291                      /usr/lib64/python2.7/lib-dynload/binascii.so
7fe01416a000-7fe014171000 r-xp 00000000 fd:01 39288                      /usr/lib64/python2.7/lib-dynload/_struct.so
7fe014171000-7fe014370000 ---p 00007000 fd:01 39288                      /usr/lib64/python2.7/lib-dynload/_struct.so
7fe014370000-7fe014371000 r--p 00006000 fd:01 39288                      /usr/lib64/python2.7/lib-dynload/_struct.so
7fe014371000-7fe014373000 rw-p 00007000 fd:01 39288                      /usr/lib64/python2.7/lib-dynload/_struct.so
7fe014373000-7fe014377000 r-xp 00000000 fd:01 39294                      /usr/lib64/python2.7/lib-dynload/cStringIO.so
7fe014377000-7fe014576000 ---p 00004000 fd:01 39294                      /usr/lib64/python2.7/lib-dynload/cStringIO.so
7fe014576000-7fe014577000 r--p 00003000 fd:01 39294                      /usr/lib64/python2.7/lib-dynload/cStringIO.so
7fe014577000-7fe014579000 rw-p 00004000 fd:01 39294                      /usr/lib64/python2.7/lib-dynload/cStringIO.so
7fe014579000-7fe01459d000 r-xp 00000000 fd:01 25223349                   /usr/lib64/liblzma.so.5.0.99
7fe01459d000-7fe01479c000 ---p 00024000 fd:01 25223349                   /usr/lib64/liblzma.so.5.0.99
7fe01479c000-7fe01479d000 r--p 00023000 fd:01 25223349                   /usr/lib64/liblzma.so.5.0.99
7fe01479d000-7fe01479e000 rw-p 00024000 fd:01 25223349                   /usr/lib64/liblzma.so.5.0.99
7fe01479e000-7fe0147fe000 r-xp 00000000 fd:01 25300490                   /usr/lib64/libpcre.so.1.2.0
7fe0147fe000-7fe0149fd000 ---p 00060000 fd:01 25300490                   /usr/lib64/libpcre.so.1.2.0
7fe0149fd000-7fe0149fe000 r--p 0005f000 fd:01 25300490                   /usr/lib64/libpcre.so.1.2.0
7fe0149fe000-7fe0149ff000 rw-p 00060000 fd:01 25300490                   /usr/lib64/libpcre.so.1.2.0
7fe0149ff000-7fe014a20000 r-xp 00000000 fd:01 25300509                   /usr/lib64/libselinux.so.1
7fe014a20000-7fe014c20000 ---p 00021000 fd:01 25300509                   /usr/lib64/libselinux.so.1
7fe014c20000-7fe014c21000 r--p 00021000 fd:01 25300509                   /usr/lib64/libselinux.so.1
7fe014c21000-7fe014c22000 rw-p 00022000 fd:01 25300509                   /usr/lib64/libselinux.so.1
7fe014c22000-7fe014c24000 rw-p 00000000 00:00 0
7fe014c24000-7fe014c3a000 r-xp 00000000 fd:01 25213202                   /usr/lib64/libresolv-2.17.so
7fe014c3a000-7fe014e3a000 ---p 00016000 fd:01 25213202                   /usr/lib64/libresolv-2.17.so
7fe014e3a000-7fe014e3b000 r--p 00016000 fd:01 25213202                   /usr/lib64/libresolv-2.17.so
7fe014e3b000-7fe014e3c000 rw-p 00017000 fd:01 25213202                   /usr/lib64/libresolv-2.17.so
7fe014e3c000-7fe014e3e000 rw-p 00000000 00:00 0
7fe014e3e000-7fe014e41000 r-xp 00000000 fd:01 25301361                   /usr/lib64/libkeyutils.so.1.5
7fe014e41000-7fe015040000 ---p 00003000 fd:01 25301361                   /usr/lib64/libkeyutils.so.1.5
7fe015040000-7fe015041000 r--p 00002000 fd:01 25301361                   /usr/lib64/libkeyutils.so.1.5
7fe015041000-7fe015042000 rw-p 00003000 fd:01 25301361                   /usr/lib64/libkeyutils.so.1.5
7fe015042000-7fe01504f000 r-xp 00000000 fd:01 25301973                   /usr/lib64/libkrb5support.so.0.1
7fe01504f000-7fe01524f000 ---p 0000d000 fd:01 25301973                   /usr/lib64/libkrb5support.so.0.1
7fe01524f000-7fe015250000 r--p 0000d000 fd:01 25301973                   /usr/lib64/libkrb5support.so.0.1
7fe015250000-7fe015251000 rw-p 0000e000 fd:01 25301973                   /usr/lib64/libkrb5support.so.0.1
7fe015251000-7fe015266000 r-xp 00000000 fd:01 25300506                   /usr/lib64/libz.so.1.2.7
7fe015266000-7fe015465000 ---p 00015000 fd:01 25300506                   /usr/lib64/libz.so.1.2.7
7fe015465000-7fe015466000 r--p 00014000 fd:01 25300506                   /usr/lib64/libz.so.1.2.7
7fe015466000-7fe015467000 rw-p 00015000 fd:01 25300506                   /usr/lib64/libz.so.1.2.7
7fe015467000-7fe015496000 r-xp 00000000 fd:01 25301667                   /usr/lib64/libk5crypto.so.3.1
7fe015496000-7fe015695000 ---p 0002f000 fd:01 25301667                   /usr/lib64/libk5crypto.so.3.1
7fe015695000-7fe015697000 r--p 0002e000 fd:01 25301667                   /usr/lib64/libk5crypto.so.3.1
7fe015697000-7fe015698000 rw-p 00030000 fd:01 25301667                   /usr/lib64/libk5crypto.so.3.1
7fe015698000-7fe015699000 rw-p 00000000 00:00 0
7fe015699000-7fe01569c000 r-xp 00000000 fd:01 25300629                   /usr/lib64/libcom_err.so.2.1
7fe01569c000-7fe01589b000 ---p 00003000 fd:01 25300629                   /usr/lib64/libcom_err.so.2.1
7fe01589b000-7fe01589c000 r--p 00002000 fd:01 25300629                   /usr/lib64/libcom_err.so.2.1
7fe01589c000-7fe01589d000 rw-p 00003000 fd:01 25300629                   /usr/lib64/libcom_err.so.2.1
7fe01589d000-7fe015972000 r-xp 00000000 fd:01 25301971                   /usr/lib64/libkrb5.so.3.3
7fe015972000-7fe015b72000 ---p 000d5000 fd:01 25301971                   /usr/lib64/libkrb5.so.3.3
7fe015b72000-7fe015b7f000 r--p 000d5000 fd:01 25301971                   /usr/lib64/libkrb5.so.3.3
7fe015b7f000-7fe015b82000 rw-p 000e2000 fd:01 25301971                   /usr/lib64/libkrb5.so.3.3
7fe015b82000-7fe015bcb000 r-xp 00000000 fd:01 25301663                   /usr/lib64/libgssapi_krb5.so.2.2
7fe015bcb000-7fe015dcb000 ---p 00049000 fd:01 25301663                   /usr/lib64/libgssapi_krb5.so.2.2
7fe015dcb000-7fe015dcc000 r--p 00049000 fd:01 25301663                   /usr/lib64/libgssapi_krb5.so.2.2
7fe015dcc000-7fe015dce000 rw-p 0004a000 fd:01 25301663                   /usr/lib64/libgssapi_krb5.so.2.2
7fe015dce000-7fe015f8b000 r-xp 00000000 fd:01 25301657                   /usr/lib64/libcrypto.so.1.0.1e
7fe015f8b000-7fe01618b000 ---p 001bd000 fd:01 25301657                   /usr/lib64/libcrypto.so.1.0.1e
7fe01618b000-7fe0161a5000 r--p 001bd000 fd:01 25301657                   /usr/lib64/libcrypto.so.1.0.1e
7fe0161a5000-7fe0161b1000 rw-p 001d7000 fd:01 25301657                   /usr/lib64/libcrypto.so.1.0.1e
7fe0161b1000-7fe0161b5000 rw-p 00000000 00:00 0
7fe0161b5000-7fe016218000 r-xp 00000000 fd:01 25301659                   /usr/lib64/libssl.so.1.0.1e
7fe016218000-7fe016417000 ---p 00063000 fd:01 25301659                   /usr/lib64/libssl.so.1.0.1e
7fe016417000-7fe01641b000 r--p 00062000 fd:01 25301659                   /usr/lib64/libssl.so.1.0.1e
7fe01641b000-7fe016422000 rw-p 00066000 fd:01 25301659                   /usr/lib64/libssl.so.1.0.1e
7fe016422000-7fe016435000 r-xp 00000000 fd:01 39287                      /usr/lib64/python2.7/lib-dynload/_ssl.so
7fe016435000-7fe016634000 ---p 00013000 fd:01 39287                      /usr/lib64/python2.7/lib-dynload/_ssl.so
7fe016634000-7fe016635000 r--p 00012000 fd:01 39287                      /usr/lib64/python2.7/lib-dynload/_ssl.so
7fe016635000-7fe016639000 rw-p 00013000 fd:01 39287                      /usr/lib64/python2.7/lib-dynload/_ssl.so
7fe016639000-7fe01663c000 r-xp 00000000 fd:01 39274                      /usr/lib64/python2.7/lib-dynload/_functoolsmodule.so
7fe01663c000-7fe01683b000 ---p 00003000 fd:01 39274                      /usr/lib64/python2.7/lib-dynload/_functoolsmodule.so
7fe01683b000-7fe01683c000 r--p 00002000 fd:01 39274                      /usr/lib64/python2.7/lib-dynload/_functoolsmodule.so
7fe01683c000-7fe01683d000 rw-p 00003000 fd:01 39274                      /usr/lib64/python2.7/lib-dynload/_functoolsmodule.so
7fe01683d000-7fe01684c000 r-xp 00000000 fd:01 39285                      /usr/lib64/python2.7/lib-dynload/_socketmodule.so
7fe01684c000-7fe016a4b000 ---p 0000f000 fd:01 39285                      /usr/lib64/python2.7/lib-dynload/_socketmodule.so
7fe016a4b000-7fe016a4c000 r--p 0000e000 fd:01 39285                      /usr/lib64/python2.7/lib-dynload/_socketmodule.so
7fe016a4c000-7fe016a51000 rw-p 0000f000 fd:01 39285                      /usr/lib64/python2.7/lib-dynload/_socketmodule.so
7fe016a51000-7fe016a53000 r-xp 00000000 fd:01 39302                      /usr/lib64/python2.7/lib-dynload/grpmodule.so
7fe016a53000-7fe016c52000 ---p 00002000 fd:01 39302                      /usr/lib64/python2.7/lib-dynload/grpmodule.so
7fe016c52000-7fe016c53000 r--p 00001000 fd:01 39302                      /usr/lib64/python2.7/lib-dynload/grpmodule.so
7fe016c53000-7fe016c54000 rw-p 00002000 fd:01 39302                      /usr/lib64/python2.7/lib-dynload/grpmodule.so
7fe016c54000-7fe016c5b000 r-xp 00000000 fd:01 39306                      /usr/lib64/python2.7/lib-dynload/math.so
7fe016c5b000-7fe016e5a000 ---p 00007000 fd:01 39306                      /usr/lib64/python2.7/lib-dynload/math.so
7fe016e5a000-7fe016e5b000 r--p 00006000 fd:01 39306                      /usr/lib64/python2.7/lib-dynload/math.so
7fe016e5b000-7fe016e5d000 rw-p 00007000 fd:01 39306                      /usr/lib64/python2.7/lib-dynload/math.so
7fe016e5d000-7fe016f1e000 rw-p 00000000 00:00 0
7fe016f1e000-7fe016f22000 r-xp 00000000 fd:01 39320                      /usr/lib64/python2.7/lib-dynload/timemodule.so
7fe016f22000-7fe017121000 ---p 00004000 fd:01 39320                      /usr/lib64/python2.7/lib-dynload/timemodule.so
7fe017121000-7fe017122000 r--p 00003000 fd:01 39320                      /usr/lib64/python2.7/lib-dynload/timemodule.so
7fe017122000-7fe017124000 rw-p 00004000 fd:01 39320                      /usr/lib64/python2.7/lib-dynload/timemodule.so
7fe017124000-7fe017149000 r-xp 00000000 fd:01 25300489                   /usr/lib64/libtinfo.so.5.9
7fe017149000-7fe017349000 ---p 00025000 fd:01 25300489                   /usr/lib64/libtinfo.so.5.9
7fe017349000-7fe01734d000 r--p 00025000 fd:01 25300489                   /usr/lib64/libtinfo.so.5.9
7fe01734d000-7fe01734e000 rw-p 00029000 fd:01 25300489                   /usr/lib64/libtinfo.so.5.9
7fe01734e000-7fe01738a000 r-xp 00000000 fd:01 25300639                   /usr/lib64/libreadline.so.6.2
7fe01738a000-7fe01758a000 ---p 0003c000 fd:01 25300639                   /usr/lib64/libreadline.so.6.2
7fe01758a000-7fe01758c000 r--p 0003c000 fd:01 25300639                   /usr/lib64/libreadline.so.6.2
7fe01758c000-7fe017592000 rw-p 0003e000 fd:01 25300639                   /usr/lib64/libreadline.so.6.2
7fe017592000-7fe017594000 rw-p 00000000 00:00 0
7fe017594000-7fe017599000 r-xp 00000000 fd:01 39313                      /usr/lib64/python2.7/lib-dynload/readline.so
7fe017599000-7fe017798000 ---p 00005000 fd:01 39313                      /usr/lib64/python2.7/lib-dynload/readline.so
7fe017798000-7fe017799000 r--p 00004000 fd:01 39313                      /usr/lib64/python2.7/lib-dynload/readline.so
7fe017799000-7fe01779b000 rw-p 00005000 fd:01 39313                      /usr/lib64/python2.7/lib-dynload/readline.so
7fe01779b000-7fe0177a0000 r-xp 00000000 fd:01 39317                      /usr/lib64/python2.7/lib-dynload/stropmodule.so
7fe0177a0000-7fe01799f000 ---p 00005000 fd:01 39317                      /usr/lib64/python2.7/lib-dynload/stropmodule.so
7fe01799f000-7fe0179a0000 r--p 00004000 fd:01 39317                      /usr/lib64/python2.7/lib-dynload/stropmodule.so
7fe0179a0000-7fe0179a2000 rw-p 00005000 fd:01 39317                      /usr/lib64/python2.7/lib-dynload/stropmodule.so
7fe0179a2000-7fe017a22000 rw-p 00000000 00:00 0
7fe017a22000-7fe017aa2000 rw-p 00000000 00:00 0
7fe017aa2000-7fe01dfc9000 r--p 00000000 fd:01 8447784                    /usr/lib/locale/locale-archive
7fe01dfc9000-7fe01e17f000 r-xp 00000000 fd:01 25167894                   /usr/lib64/libc-2.17.so
7fe01e17f000-7fe01e37f000 ---p 001b6000 fd:01 25167894                   /usr/lib64/libc-2.17.so
7fe01e37f000-7fe01e383000 r--p 001b6000 fd:01 25167894                   /usr/lib64/libc-2.17.so
7fe01e383000-7fe01e385000 rw-p 001ba000 fd:01 25167894                   /usr/lib64/libc-2.17.so
7fe01e385000-7fe01e38a000 rw-p 00000000 00:00 0
7fe01e38a000-7fe01e48b000 r-xp 00000000 fd:01 25167902                   /usr/lib64/libm-2.17.so
7fe01e48b000-7fe01e68a000 ---p 00101000 fd:01 25167902                   /usr/lib64/libm-2.17.so
7fe01e68a000-7fe01e68b000 r--p 00100000 fd:01 25167902                   /usr/lib64/libm-2.17.so
7fe01e68b000-7fe01e68c000 rw-p 00101000 fd:01 25167902                   /usr/lib64/libm-2.17.so
7fe01e68c000-7fe01e68e000 r-xp 00000000 fd:01 25213208                   /usr/lib64/libutil-2.17.so
7fe01e68e000-7fe01e88d000 ---p 00002000 fd:01 25213208                   /usr/lib64/libutil-2.17.so
7fe01e88d000-7fe01e88e000 r--p 00001000 fd:01 25213208                   /usr/lib64/libutil-2.17.so
7fe01e88e000-7fe01e88f000 rw-p 00002000 fd:01 25213208                   /usr/lib64/libutil-2.17.so
7fe01e88f000-7fe01e892000 r-xp 00000000 fd:01 25167900                   /usr/lib64/libdl-2.17.so
7fe01e892000-7fe01ea91000 ---p 00003000 fd:01 25167900                   /usr/lib64/libdl-2.17.so
7fe01ea91000-7fe01ea92000 r--p 00002000 fd:01 25167900                   /usr/lib64/libdl-2.17.so
7fe01ea92000-7fe01ea93000 rw-p 00003000 fd:01 25167900                   /usr/lib64/libdl-2.17.so
7fe01ea93000-7fe01eaa9000 r-xp 00000000 fd:01 25213200                   /usr/lib64/libpthread-2.17.so
7fe01eaa9000-7fe01eca9000 ---p 00016000 fd:01 25213200                   /usr/lib64/libpthread-2.17.so
7fe01eca9000-7fe01ecaa000 r--p 00016000 fd:01 25213200                   /usr/lib64/libpthread-2.17.so
7fe01ecaa000-7fe01ecab000 rw-p 00017000 fd:01 25213200                   /usr/lib64/libpthread-2.17.so
7fe01ecab000-7fe01ecaf000 rw-p 00000000 00:00 0
7fe01ecaf000-7fe01ee6a000 r-xp 00000000 fd:01 26078219                   /usr/lib64/libpython2.7.so.1.0
7fe01ee6a000-7fe01f069000 ---p 001bb000 fd:01 26078219                   /usr/lib64/libpython2.7.so.1.0
7fe01f069000-7fe01f06a000 r--p 001ba000 fd:01 26078219                   /usr/lib64/libpython2.7.so.1.0
7fe01f06a000-7fe01f0a8000 rw-p 001bb000 fd:01 26078219                   /usr/lib64/libpython2.7.so.1.0
7fe01f0a8000-7fe01f0b8000 rw-p 00000000 00:00 0
7fe01f0b8000-7fe01f0d9000 r-xp 00000000 fd:01 25167887                   /usr/lib64/ld-2.17.so
7fe01f0e3000-7fe01f123000 rw-p 00000000 00:00 0
7fe01f123000-7fe01f158000 r--s 00000000 fd:01 27466505                   /var/db/nscd/passwd
7fe01f158000-7fe01f1d8000 rw-p 00000000 00:00 0
7fe01f209000-7fe01f2ce000 rw-p 00000000 00:00 0
7fe01f2d7000-7fe01f2d8000 rw-p 00000000 00:00 0
7fe01f2d8000-7fe01f2d9000 rw-p 00000000 00:00 0
7fe01f2d9000-7fe01f2da000 r--p 00021000 fd:01 25167887                   /usr/lib64/ld-2.17.so
7fe01f2da000-7fe01f2db000 rw-p 00022000 fd:01 25167887                   /usr/lib64/ld-2.17.so
7fe01f2db000-7fe01f2dc000 rw-p 00000000 00:00 0
7fff3f7da000-7fff3f7fb000 rw-p 00000000 00:00 0
7fff3f7fc000-7fff3f7fe000 r-xp 00000000 00:00 0                          [vdso]
ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]


# cat /proc/26239/status
Name:   python
State:  S (sleeping)
Tgid:   26239
Ngid:   0
Pid:    26239
PPid:   18329
TracerPid:      0
Uid:    0       0       0       0
Gid:    0       0       0       0
FDSize: 64
Groups:
VmPeak:   469288 kB
VmSize:   469008 kB
VmLck:         0 kB
VmPin:         0 kB
VmHWM:     25376 kB
VmRSS:     25208 kB
VmData:   250552 kB
VmStk:       136 kB
VmExe:         4 kB
VmLib:     11192 kB
VmPTE:       308 kB
VmSwap:        0 kB
Threads:        1
SigQ:   0/15084
SigPnd: 0000000000000000
ShdPnd: 0000000000000000
SigBlk: 0000000000000000
SigIgn: 0000000001001006
SigCgt: 0000000180000000
CapInh: 0000000000000000
CapPrm: 0000001fffffffff
CapEff: 0000001fffffffff
CapBnd: 0000001fffffffff
Seccomp:        0
Cpus_allowed:   ff
Cpus_allowed_list:      0-7
Mems_allowed:   00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000001
Mems_allowed_list:      0
voluntary_ctxt_switches:        485222
nonvoluntary_ctxt_switches:     3820
";i:1;N;i:2;N;}i:2;i:1189;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:44095;}i:13;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:44095;}}