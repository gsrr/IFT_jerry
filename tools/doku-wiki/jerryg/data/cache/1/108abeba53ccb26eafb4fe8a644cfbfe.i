a:10:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"FAQ";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2783:"
Q2 : nfs4_acl, how to operate?
Ans :
1. mount nfs4 file system --> mount -t nfs4 127.0.0.1:/tmp /mnt
2. get acl --> 
root@CentOS7-Build /mnt $ nfs4_getfacl /mnt/1234
A::OWNER@:rwatTcCy
A::900:rtcy
A::GROUP@:rtcy
A::EVERYONE@:rtcy

3. set acl:
--> mount by no_root_squash
--> nfs4_setfacl -a A::4106:r /mnt/123

4. nfs4_acl 看起來跟samba的運作機制不一樣, samba是另外存一個security.NTACL來設定acl.
而nfs4_acl則是存在原先的posix_acl裡面, 但是會透過各種轉換機制來設定posix_acl, 並達到NTACL所要的結果.
4.1 那轉換的行為跟規則都可以跟samba一致嗎?
Ans :
看起來並不完全一樣, 以user而言, 若新增一個user bb有rwatcy權限, 但沒有x權限,
--> nfs4_acl 會轉換成bb有rwatcy, 且增加一個deny x的權限.
--> 但是在Samba則不會有這個deny x權限.

4.2 若group有rw, 但user有rwx呢?
Ans :
同上述狀況, group會增加一個deny x權限, 但Samba不會有這個deny x權限.

4.3 若everyone只有rw呢?
Ans : 
--> nfs4_acl 不會新增一個deny x權限, 就算Samba加入everyone deny x也一樣.

4.4 若在nfs4_acl中移除一個項目, 在posix_acl裡面會有什麼影響?
Ans :
--> 看起來有點鳥, 沒有辦法對個別的項目進行刪除, 所有動作還是以posix_acl為主.
--> 應該說他取決於系統server本身的支援程度, 因為目前GS只支援rwx, 所以設定上就只能多個attr一起設定.
--> 但是可以設定deny, 雖然也是作用到posix_acl身上就是了.
--> 所以permission check還是會使用vfs本身的permission check. (nfs4裡面並無獨立一塊進行)

4.5 所有permission_check也只有針對posix_acl在進行嗎?
Ans :

# setting acl
1. http://pro-toolz.net/data/unix-tipz/nfs4_setfacl.html
2. https://www.osc.edu/book/export/html/4523
3. https://sambaxp.org/archive_data/SambaXP2013-DATA/wed/track2/Alexander_Werth-NFSv4-ACLs.pdf

4. http://wiki.linux-nfs.org/wiki/index.php/ACLs 
--> fs/nfsd/nfs4acl.c
Q2-1 : compatible with Samba?
Ans :


Q1 : NFS的share設定為 
/tmp        *(rw,all_squash,anonuid=1008,anongid=1009,no_subtree_check,insecure,sync)
為什麼從Windows mount起來時, 將file copy出來之後會是read only?

Ans:
1. 設定為all_squash, anonuid為1008, anongid為1009, 照理說進來的user都要被壓成uid=1008這個user.
但是從windows進來似乎會變成others.
--> 從mount command可以看到windows所mount的資訊.
發現所mount的uid為-1, gid為-2, 所以才會被server認定為others.

2. 在windows上設定 AnonymousGid 與 AnonymousUid並重開機 (DWORD (32bit))
--> regedit 
--> HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ClientForNFS\CurrentVersion\Default
(ref : http://blog.xuite.net/misgarlic/weblogic/250981836-windows+%E4%B8%BB%E6%A9%9F%E6%8E%9B%E8%BC%89+NFS+shared+storage)


";i:1;N;i:2;N;}i:2;i:24;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2817;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Basic";i:1;i:1;i:2;i:2817;}i:2;i:2817;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2817;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:482:"
# Reference
[nfs - vbird]
1. http://linux.vbird.org/linux_server/0330nfs.php#nfsserver_exports

# network
1. port 
--> linux : 2049
--> windows : 944

# commands
1. nfs share information
--> showmount -e localhost
--> cat /var/lib/nfs/etab

2. mount information
--> df -h

3. nfs server
--> systemctl start nfs

4. nfs client
--> mount -t nfs 127.0.0.1:/Pool-1/Volume_1/Share1 /mnt





# conf
1. /etc/exports

# Installation
1. yum install nfs-utils
2. yum install nfs4-acl-tools
";i:1;N;i:2;N;}i:2;i:2842;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3333;}i:9;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3333;}}