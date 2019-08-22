a:10:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"FAQ";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2473:"
Q3 : 為什麼在minimal ACLs時, group class是follow owning group entry? 而在extended acls是follow mask entry?
Ans:
1. Ref. : https://web.archive.org/web/20150919060634/http://users.suse.com/~agruen/acl/linux-acls/online/
2. 首先我們先確定幾件事情:
2.1 named group and named user entries are assigned to the group class.

3. 因為named group , named user and owning group都是屬於group class, 
若owning group的權限是r, 而named group的權限是rw, 
這時若group class的permission是依照owning group來定義的話, 會產生一個問題:
named group的權限將會超出group class所定義的權限.
所以這時才會使用mask entry來定義group class的權限, mask is upper bound permission of group class.
此時無論named group 與named user的權限為何, 也都無法超出group class所定義的權限.

Q2 : POSIX對 file acl的定義?
Ans:
1. Thress classes of permission model:
1.1 owner class : access privileges of the file owner
1.2 group class : access privileges of the owning group
1.3 other class : access privileges of all users

2. minimal ACLs and Extended ACLs
2.1 minimal ACLs : three ACL entries
2.2 Extended ACLs : three ACL entries + mask entry , named user and named group entries.


Q1 : default acl的mask 看起來不會繼承下去.
Ans :
1. 在使用rsync 複製檔案時, 一開始的temp file權限會繼承上層folder的default acl:

[root@nas_8739447_a test001]# getfacl .file10G.VrrLS7
# file: .file10G.VrrLS7
# owner: root
# group: root
user::rw-
user:test:rwx                   #effective:---
user:100003:rwx                 #effective:---
group::r-x                      #effective:---
group:users:r-x                 #effective:---
mask::---
other::---

2. 接下來rename完成後, 就會把acl設定過來 (-p option)

[root@nas_8739447_a test001]# getfacl file10G
# file: file10G
# owner: root
# group: root
user::r--
user:test:rwx                   #effective:r--
user:100003:rwx                 #effective:r--
group::r-x                      #effective:r--
group:users:r-x                 #effective:r--
mask::r--
other::r--

3. user, group, other的權限都會被設定過來, 
但因為有mask, 所以原本設定在group的部分會改成設定在mask上面.

4. mask只會作用在 named user entries or named group objects

5. If an ACL contains named user or named group entries, and no mask entry exists, a mask entry containing the same permissions as the group entry is created.
";i:1;N;i:2;N;}i:2;i:24;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2507;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Usage of setfacl";i:1;i:1;i:2;i:2507;}i:2;i:2507;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2507;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:381:"
# delete acl entry from file
setfacl -x group:user /tmp/fileacl

# set mask for file
[root@nas_8739447_a Volume_1]# setfacl -m "m::r" /tmp/fileacl
[root@nas_8739447_a Volume_1]# getfacl /tmp/fileacl
getfacl: Removing leading '/' from absolute path names
# file: tmp/fileacl
# owner: root
# group: root
user::rwx
group::rwx                      #effective:r--
mask::r--
other::---
";i:1;N;i:2;N;}i:2;i:2544;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2933;}i:9;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2933;}}