a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:491:"
# 修改mtime
[root@nas_8716691_a ~]# stat source/file1.txt
  File: ‘source/file1.txt’
  Size: 6               Blocks: 8          IO Block: 4096   regular file
Device: fd01h/64769d    Inode: 10557046    Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2017-08-25 09:57:52.047363908 +0800
Modify: 2017-08-25 09:58:36.650362706 +0800
Change: 2017-08-25 09:59:56.403360558 +0800

touch -m -d '2017-08-25 09:58:36.650362706 +0800' /source/file1.txt
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}