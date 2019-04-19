a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Questions";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:429:"
Q1 : pmap -x 跟 ps aux 都可以得到process memory, 但兩者的值並不相同?
Ans :
正常來講, ps aux所得到的值會比pmap -x來得小, 因為:
The SIZE and RSS fields don't count some parts of a process including the page tables, kernel stack, struct thread_info, and struct task_struct. This is usually at least 20 KiB of memory that is always resident. SIZE is the virtual size of the process (code+data+stack).
";i:1;N;i:2;N;}i:2;i:30;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:467;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:467;}}