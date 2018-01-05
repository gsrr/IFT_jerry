a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:320:"
Q1 : docker exec -it command returns following error "cannot enable tty mode on non tty input"
Ans : 
1. -i 是interactive mode --> 會與container的程式連接stdin and stdout
2. -t 是pseudo terminal --> 會與container建立pesudo terminal (stdin and stdout), 但不會與裡面的程式建立stdin and stdout.



";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}