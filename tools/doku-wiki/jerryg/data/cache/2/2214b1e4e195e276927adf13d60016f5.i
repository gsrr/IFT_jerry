a:8:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"FAQ";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:6;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8;}i:6;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2559:"

Q6 : rcu_head?
Ans :
Typically, the rcu_head structure is embedded in the data structure that uses RCU for updating and lookup.

Q1 : How vfs load file?
Ans :
func : inode_init_always
file : fs/inode.c

inode structure
file : include/linux/fs.h


Q2 : Change location of iftacl.h
Ans:
1. fs/open.c:36:21: fatal error: ift_acl.h: No such file or directory
2. fs/namei.c: 
3. fs/attr.c
4. fs/xattr.c
5. fs/nfsd/vfs.c:
6. fs/xfs/xfs_iops.c
7. 

Q3 : 從rcu的說明, 在write cache的時候應該會先copy一份等待所有read的人都離開之後, 再進行更新.
但我好像看不到這樣的動作.
Ans:
再看一次rcu的說明:
若該memory空間有人再使用, 則這時候使用rcu_assign_pointer,會確認pointer assign會在別人使用後再進行.
1 p->a = 1;
2 p->b = 2;
3 p->c = 3;
4 rcu_assign_pointer(gp, p);
rcu_assign_pointer(gp, p); 裡面加了 memory barrier 保證 pointer assign 發生於 line 1-3 之後.

也就是說, 若這時候有人在使用該acl區塊的memory時, 這時候是不會進行pointer assign的動作.

Q4 : 從code看到:
129static inline void set_cached_acl(struct inode *inode,
130				  int type,
131				  struct posix_acl *acl)
132{
133	struct posix_acl **p = acl_by_type(inode, type);
134	struct posix_acl *old;
135	spin_lock(&inode->i_lock);
136	old = *p;
137	rcu_assign_pointer(*p, posix_acl_dup(acl));
138	spin_unlock(&inode->i_lock);
139	if (old != ACL_NOT_CACHED)
140		posix_acl_release(old);
141}

為什麼在rcu的外面還需要使用spin_lock?

Ans:
因為這是為了擋住在write後面進來的人, 所以若是:
R,R,R,R,W,R,R,R,R
這時候W前面的人拿的是舊acl, W後面的人拿的是新acl.
而rcu是為了Write前面的人所使用, 因為要等前面的用完才可以更新.
若不是使用rcu機制的話, 會變成Read的部分要多一個write lock, 而這個lock要等所有read的人離開才會釋放.
(不能使用inode-i_lock, 因為這樣會擋住對inode的操作, 變成read只能一次一個人.)

Q5 : rcu_read_lock()
#define rcu_read_lock()         preempt_disable()
读者在访问被RCU保护的共享数据期间不能被阻塞，这是RCU机制得以实现的一个基本前提，也就说当读者在引用被RCU保护的共享数据期间，读者所在的CPU不能发生上下文切换.
那如果發生context switch會怎樣? 因為rcu標榜的優點就是對reader快速, 所以在rcu mode下get acl是不會加任何reference cnt.
這時候若是被switch出去的話, 有可能會導致記憶體內容被更改.
(在path_init裡面會將rcu lock拉起來)

";i:1;N;i:2;N;}i:2;i:15;}i:7;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:15;}}