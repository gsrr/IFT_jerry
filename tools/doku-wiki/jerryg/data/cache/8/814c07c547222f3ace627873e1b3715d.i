a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"fork and zombie";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:966:"
Q4 : Difference between System() and fork()?
Ans : 
1. System等同於fork + exec + waitpid
2. 執行System時, SIGCHILD會被阻擋, 但SIGINT(Ctrl-C) and SIGQUIT會被忽略.

Q3 : How to avoid zombie?
Ans :
1. Add waitpid() somewhere in the parent process
2. Perform double fork()
3. Explicitly ignore SIGCHLD signal in parent.
(http://low-understated.blogspot.tw/2009/08/program-ex1-kill-prog1prog1-ps-ef-prog1.html)

Q2 : process table?
Ans :
ps command

Q1 : What is zombie process?
Ans1 :
1. A zombie process or defunct process is a process that has completed execution (via the exit system call) but still has an entry in the process table.

2. It is a process in the "Terminated state". This occurs for child processes, where the entry is still needed to allow the parent process to read its child's exit status.

3. Once the exit status is read via the wait system call, the zombie's entry is removed from the process table and it is said to be "reaped".
";i:1;N;i:2;N;}i:2;i:37;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1011;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1011;}}