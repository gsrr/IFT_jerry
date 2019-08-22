a:15:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"byobu";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:217:"
# change escape key (tmux based)
1. modify file : ~/.byobu/keybindings.tmux
2.

" -n is equal to -T root, 代表從root table移走這個key
unbind-key -n C-a
set -g prefix ^B
set -g prefix2 F12
bind a send-prefix


";i:1;N;i:2;N;}i:2;i:26;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:253;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"linux tools";i:1;i:1;i:2;i:253;}i:2;i:253;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:253;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:3543:"
# flush data to disk
1. sync
2. blockdev --flushbufs /dev/sda

# mount file system
1. 確認type:
[root@nas_8716691_a Volume_1]# blkid /dev/sdi
/dev/sdi: LABEL="+" UUID="4b19f3f6-7ae2-475a-abbb-bd2ff2981116" TYPE="xfs"

2. umount file system:
umount /Pool-1/Volume_1_6E8F6B4548C2F75E/

3. 確認mount參數:
[root@nas_8716691_a Volume_1]# mount
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
devtmpfs on /dev type devtmpfs (rw,nosuid,size=1930892k,nr_inodes=482723,mode=755)
securityfs on /sys/kernel/security type securityfs (rw,nosuid,nodev,noexec,relatime)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=755)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,mode=755)
cgroup on /sys/fs/cgroup/systemd type cgroup (rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/usr/lib/systemd/systemd-cgroups-agent,name=systemd)
pstore on /sys/fs/pstore type pstore (rw,nosuid,nodev,noexec,relatime)
cgroup on /sys/fs/cgroup/memory type cgroup (rw,nosuid,nodev,noexec,relatime,memory)
cgroup on /sys/fs/cgroup/blkio type cgroup (rw,nosuid,nodev,noexec,relatime,blkio)
cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup (rw,nosuid,nodev,noexec,relatime,cpuacct,cpu)
cgroup on /sys/fs/cgroup/perf_event type cgroup (rw,nosuid,nodev,noexec,relatime,perf_event)
cgroup on /sys/fs/cgroup/hugetlb type cgroup (rw,nosuid,nodev,noexec,relatime,hugetlb)
cgroup on /sys/fs/cgroup/freezer type cgroup (rw,nosuid,nodev,noexec,relatime,freezer)
cgroup on /sys/fs/cgroup/net_cls type cgroup (rw,nosuid,nodev,noexec,relatime,net_cls)
cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,nosuid,nodev,noexec,relatime,cpuset)
cgroup on /sys/fs/cgroup/devices type cgroup (rw,nosuid,nodev,noexec,relatime,devices)
configfs on /sys/kernel/config type configfs (rw,relatime)
/dev/mapper/vg_eonfs-root on / type xfs (rw,relatime,sync,attr2,inode64,noquota)
systemd-1 on /proc/sys/fs/binfmt_misc type autofs (rw,relatime,fd=31,pgrp=1,timeout=300,minproto=5,maxproto=5,direct)
hugetlbfs on /dev/hugepages type hugetlbfs (rw,relatime)
debugfs on /sys/kernel/debug type debugfs (rw,relatime)
mqueue on /dev/mqueue type mqueue (rw,relatime)
sunrpc on /var/lib/nfs/rpc_pipefs type rpc_pipefs (rw,relatime)
binfmt_misc on /proc/sys/fs/binfmt_misc type binfmt_misc (rw,relatime)
nfsd on /proc/fs/nfsd type nfsd (rw,relatime)
tmpfs on /nastmp type tmpfs (rw,relatime,size=65536k)
/dev/sda3 on /boot type xfs (rw,relatime,attr2,inode64,noquota)
/dev/mapper/vg_eonfs-var_log on /var/log type xfs (rw,relatime,sync,wsync,attr2,inode64,noquota)
/dev/sdd on /var/crash type xfs (rw,relatime,sync,wsync,attr2,inode64,prjquota)
/dev/md127 on /cfpool type xfs (rw,relatime,sync,wsync,attr2,inode64,prjquota)
/dev/md126 on /embdEonOne type xfs (rw,relatime,sync,wsync,attr2,inode64,noquota)
/dev/sdh on /Pool-1/Volume_1 type xfs (rw,relatime,nouuid,attr2,inode64,usrquota,prjquota)
tmpfs on /run/user/0 type tmpfs (rw,nosuid,nodev,relatime,size=388224k,mode=700)
/dev/sdi on /Pool-1/Volume_1_6E8F6B4548C2F75E type xfs (rw,relatime,nouuid,attr2,inode64,usrquota,prjquota)

4. mount filesystem:
mount -o rw,relatime,nouuid,attr2,inode64,usrquota,prjquota /dev/sdi /Pool-1/Volume_1_6E8F6B4548C2F75E/

# smbcacls
fpath="/f2/f2"; for i in `seq 3 1 1000`; do fpath=$fpath"/f"$i; echo $fpath"/f"$i; smbcacls //172.27.112.150/testext $fpath -U aa%11111111 --add ACL:bb:ALLOWED/3/FULL;done
";i:1;N;i:2;N;}i:2;i:285;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3838;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"python";i:1;i:1;i:2;i:3838;}i:2;i:3838;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:3838;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:249:"
# get caller's name
>>> import inspect
>>> def f1(): f2()
... 
>>> def f2():
...   curframe = inspect.currentframe()
...   calframe = inspect.getouterframes(curframe, 2)
...   print 'caller name:', calframe[1][3]
... 
>>> f1()
caller name: f1
>>> 
";i:1;N;i:2;N;}i:2;i:3864;}i:12;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:518:"
# itertools
def permutations(arr):
    # disadvantage : 暴力法, 速度慢, 需等到全部東西都回傳才可以進行處理
    import itertools
    return itertools.permutations(arr)

# euclidean distance
def euclidean(v1, v2):
    from scipy.spatial import distance
    return distance.euclidean(v1, v2)

def euclidean(v1, v2):
    return sqrt(sum( (x - y)**2 for x, y in zip(v1, v2)))
   
# basic algorithm
1. stack & queue
2. binary search tree
3. bfs & dfs
4. permutations
5. subset
6. binary combinations
";i:1;N;i:2;N;}i:2;i:4128;}i:13;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4654;}i:14;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4654;}}