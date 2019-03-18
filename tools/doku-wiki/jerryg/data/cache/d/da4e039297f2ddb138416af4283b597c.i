a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Summary";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:499:"
2. map unix group to samba group
Ans :
需透過net groupmap 將unixgroup map到ntgroup
example : 
1. net groupmap add ntgroup="group01" unixgroup=group01 rid=50001 type=l
2. net groupmap delete ntgroup="group01"
ref : https://www.samba.org/samba/docs/man/Samba-HOWTO-Collection/groupmapping.html#id2598232

1. "admin user" for smb.conf
Ans :
[Share1]
    admin user = user1    # user1 will has the admin privilege in Share1.

[Share2]
    admin user = AD_Domain\user2   # setting for ad user
    
";i:1;N;i:2;N;}i:2;i:28;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:536;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:536;}}