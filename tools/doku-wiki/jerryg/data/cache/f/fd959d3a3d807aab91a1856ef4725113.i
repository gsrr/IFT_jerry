a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Basic of Process";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1641:"
Q7 : thread is running in the same cpu core?
Ans :
No, threads can run in different cpu cores. 

Q6 : cpu core of process?
Ans :
1. taskset -c -p <pid>
2. ps -o pid,psr,comm -p <pid>
4. ps -aTF
3. top
The top command can also show the CPU assigned to a given process. First, launch top command with "p" option. 
Then press 'f' key, and add "Last used CPU" column to the display. 
The currently used CPU core will appear under "P" (or "PSR") column.

Q5 : Format of "ps aux"?
Ans : 

PID 
%CPU --> Percentage of CPU used by the process.
%MEM --> Percentage of memory used by the process.
VSZ --> virtual size in kilobytes
RSS --> real memory size or resident set size in 1024 byte units
TTY         
STAT --> the process state code
START   
TIME      
COMMAND 
(The process state codes include D, uninterruptable sleep; N, low priority; R, runnable (on run queue); S, sleeping; T, traced or stopped; Z, defunct (zombie).)

Q4 : Dump memory from a process?
Ans :
# dump memory
1. cat /proc/[pid]/maps
00621000-00622000 rw-p 00021000 08:01 592398 /usr/libexec/dovecot/pop3-login
...
2. gdb --pid [pid]
3. (gdb) dump memory /root/output 0x00621000 0x00622000

# generate a core file
1. gcore pid
2. gdb /usr/bin/python core.pid

Q3 : memory of a process?
1. top -p $pid ; press "e" for different memory units
2. ps aux --sort -rss
3. pmap <pid>

rss -> The real memory (resident set) size of the process (in 1024 by units).
%mem  -> The percentage of real memory used by this process.

Q2 : thread of a process?
Ans :
1. ps -T -p $pid
2. top -H -p $pid

Q1 : process 包含了哪些資訊?
Ans : 
1. open fd of a process : ls -l /proc/<pid>/fd
";i:1;N;i:2;N;}i:2;i:38;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1687;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1687;}}