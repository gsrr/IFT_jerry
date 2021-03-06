a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1368:"
Tag: python, os.open, touch, permission
Q1 : The file permission is different between "os.open" and "touch".
Ans :
The default acl of parent folder is:
default:user::---
default:user:root:---
default:user:yichun:rwx
default:user:Jack:r-x
default:user:testUser1:rwx
default:user:testUser2:rwx
default:group::r-x
default:group:users:r-x
default:mask::rwx
default:other::r-x

The file permission create by os.open("file1", os.O_CREAT) is
user::---
user:root:---
user:yichun:rwx
user:Jack:r-x
user:testUser1:rwx
user:testUser2:rwx
group::r-x
group:users:r-x
mask::rwx
other::r-x

The file permission create by "touch" command is:
user::---
user:root:---
user:yichun:rwx                 #effective:rw-
user:Jack:r-x                   #effective:r--
user:testUser1:rwx              #effective:rw-
user:testUser2:rwx              #effective:rw-
group::r-x                      #effective:r--
group:users:r-x                 #effective:r--
mask::rw-
other::r--

1. Why different?
Because mode of "touch" is 0666, but the mode of "os.open" is 0777 by default.
so we can deal with this by follow:
os.open("file1", os.O_CREAT, 0666)

2. What is the interaction between mode and default acl?
The acl was interacted by umask, mode, and default acl.
the final acl is mode & (~umask) & (default acl)

posix_acl_create_masq(clone, mode_p); // in xfs --> merge mode and default acl.

";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}