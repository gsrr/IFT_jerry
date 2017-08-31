a:8:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Reference";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:44:"
https://docs.python.org/2/c-api/index.html
";i:1;N;i:2;N;}i:2;i:30;}i:4;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1027:"
All Python objects (even Python integers) have a type and a reference count.
An object’s type determines what kind of object it is
"reference count" counts how many different places there are that have a reference to an object.

It’s that you’ve created 5 million integers simultaneously alive, and each int object consumes 12 bytes. “For speed”, Python maintains an internal free list for integer objects. Unfortunately, that free list is both immortal and unbounded in size.

'del someObject'. This only removes the binding between that identifier and the object. 
'del' doesn't actually result in the object being deleted from memory. 
It merely dereferences that local binding.

Q1 : 為什麼剛init一個object的reference count是2, 而不是1
Ans:
因為object在傳進getreference()時，reference count就會偷偷加1了。


Q2 : anon是什麼東西? (Anonymous memory?)
Ans:
Anon blocks are "large" blocks allocated via malloc or mmap.
'[ anon ]' for allocated memory
'[ stack ]' for the program stack

";i:1;N;i:2;N;}i:2;i:90;}i:5;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:3981:"
VZS:
Virtual Memory Size, It includes all memory that the process can access, including memory that is swapped out and memory that is from shared libraries.

RSS: 
RSS is the Resident Set Size and is used to show how much memory is allocated to that process and is in RAM. It does not include memory that is swapped out. It does include memory from shared libraries as long as the pages from those libraries are actually in memory. It does include all stack and heap memory.

pmap:
1. report memory map of a process
2. writeable/private : 指不含shared memory的部分.

------ pmap -d $pid
21490:   python test_mem.py
Address           Kbytes Mode  Offset           Device    Mapping
0000000000400000       4 r-x-- 0000000000000000 0fd:00000 python2.7
0000000000600000       4 r---- 0000000000000000 0fd:00000 python2.7
0000000000601000       4 rw--- 0000000000001000 0fd:00000 python2.7
00000000011d6000    1020 rw--- 0000000000000000 000:00000   [ anon ]
00007fe141706000      16 r-x-- 0000000000000000 0fd:00000 timemodule.so
00007fe14170a000    2044 ----- 0000000000004000 0fd:00000 timemodule.so
00007fe141909000       4 r---- 0000000000003000 0fd:00000 timemodule.so
00007fe14190a000       8 rw--- 0000000000004000 0fd:00000 timemodule.so
00007fe14190c000  103588 r---- 0000000000000000 0fd:00000 locale-archive
00007fe147e35000    1756 r-x-- 0000000000000000 0fd:00000 libc-2.17.so
00007fe147fec000    2044 ----- 00000000001b7000 0fd:00000 libc-2.17.so
00007fe1481eb000      16 r---- 00000000001b6000 0fd:00000 libc-2.17.so
00007fe1481ef000       8 rw--- 00000000001ba000 0fd:00000 libc-2.17.so
00007fe1481f1000      20 rw--- 0000000000000000 000:00000   [ anon ]
00007fe1481f6000    1024 r-x-- 0000000000000000 0fd:00000 libm-2.17.so
00007fe1482f6000    2048 ----- 0000000000100000 0fd:00000 libm-2.17.so
00007fe1484f6000       4 r---- 0000000000100000 0fd:00000 libm-2.17.so
00007fe1484f7000       4 rw--- 0000000000101000 0fd:00000 libm-2.17.so
00007fe1484f8000       8 r-x-- 0000000000000000 0fd:00000 libutil-2.17.so
00007fe1484fa000    2044 ----- 0000000000002000 0fd:00000 libutil-2.17.so
00007fe1486f9000       4 r---- 0000000000001000 0fd:00000 libutil-2.17.so
00007fe1486fa000       4 rw--- 0000000000002000 0fd:00000 libutil-2.17.so
00007fe1486fb000       8 r-x-- 0000000000000000 0fd:00000 libdl-2.17.so
00007fe1486fd000    2048 ----- 0000000000002000 0fd:00000 libdl-2.17.so
00007fe1488fd000       4 r---- 0000000000002000 0fd:00000 libdl-2.17.so
00007fe1488fe000       4 rw--- 0000000000003000 0fd:00000 libdl-2.17.so
00007fe1488ff000      92 r-x-- 0000000000000000 0fd:00000 libpthread-2.17.so
00007fe148916000    2044 ----- 0000000000017000 0fd:00000 libpthread-2.17.so
00007fe148b15000       4 r---- 0000000000016000 0fd:00000 libpthread-2.17.so
00007fe148b16000       4 rw--- 0000000000017000 0fd:00000 libpthread-2.17.so
00007fe148b17000      16 rw--- 0000000000000000 000:00000   [ anon ]
00007fe148b1b000    1524 r-x-- 0000000000000000 0fd:00000 libpython2.7.so.1.0
00007fe148c98000    2044 ----- 000000000017d000 0fd:00000 libpython2.7.so.1.0
00007fe148e97000       8 r---- 000000000017c000 0fd:00000 libpython2.7.so.1.0
00007fe148e99000     248 rw--- 000000000017e000 0fd:00000 libpython2.7.so.1.0
00007fe148ed7000      60 rw--- 0000000000000000 000:00000   [ anon ]
00007fe148ee6000     128 r-x-- 0000000000000000 0fd:00000 ld-2.17.so
00007fe148fba000    1256 rw--- 0000000000000000 000:00000   [ anon ]
00007fe149104000       4 rw--- 0000000000000000 000:00000   [ anon ]
00007fe149105000       4 r---- 000000000001f000 0fd:00000 ld-2.17.so
00007fe149106000       4 rw--- 0000000000020000 0fd:00000 ld-2.17.so
00007fe149107000       4 rw--- 0000000000000000 000:00000   [ anon ]
00007ffde3a40000     132 rw--- 0000000000000000 000:00000   [ stack ]
00007ffde3a76000       8 r-x-- 0000000000000000 000:00000   [ anon ]
ffffffffff600000       4 r-x-- 0000000000000000 000:00000   [ anon ]
mapped: 125328K    writeable/private: 2800K    shared: 0K
";i:1;N;i:2;N;}i:2;i:1131;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5120;}i:7;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5120;}}