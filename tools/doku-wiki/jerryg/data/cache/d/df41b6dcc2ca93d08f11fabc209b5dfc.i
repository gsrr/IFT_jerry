a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:658:"
[Command]
1. discover
iscsiadm -m discovery -t st -p 192.168.12.20

2. login
iscsiadm -m node -T iqn.2016-02.local.itzgeek.server:disk1 -p 192.168.12.20 -l

3. umount
umount /mnt

4. logout
iscsiadm -m node --targetname" "iqn.2010-10.synolog y-iscsi:newvirtualdisk.1" --portal" "192.168.0.227:3260" --logout

[Installation]
1.  yum install iscsi-initiator-utils

[Reference]
1. Configure iSCSI Target & Initiator on CentOS 7 / RHEL7
http://www.itzgeek.com/how-tos/linux/centos-how-tos/configure-iscsi-target-initiator-on-centos-7-rhel7.html

2. Windows 7 Initiatior(iSCSI Client)
http://linux-guys.blogspot.tw/2011/01/windows-7-initiatioriscsi-client.html

";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}