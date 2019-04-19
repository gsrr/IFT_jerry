a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Restrict root login";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:26;}i:4;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:237:"
# do not allow user login by root in sshd_config
PermitRootLogin no

# do not allow user login by password in sshd_config
PasswordAuthentication yes  

# remove password of root
1. passwd -d root
2. debug : login by iftsup and su root

";i:1;N;i:2;N;}i:2;i:26;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:26;}}