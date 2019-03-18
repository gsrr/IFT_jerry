a:61:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Folder Rsync";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:154:"
Q : How to run expect file manually?
Ans:
/usr/bin/python /usr/local/NAS/misc/agent/python/backup/rsyncAgent.py startRR /tmp/RR_20180606100758.exp 3 30

";i:1;N;i:2;N;}i:2;i:33;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:198;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"IFTACL";i:1;i:1;i:2;i:198;}i:2;i:198;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:198;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:696:"
Q: How to enable iftacl for volume?
Ans:
1. /usr/local/iftacl_vol /Pool-1/volume_1/ -e
2. getfattr -d -m - /Pool-1/volume_1/
getfattr: Removing leading '/' from absolute path names
# file: Pool-1/volume_1/
security.iftacl=0sAQARAQAAAAAAAAAAjAQACwAAAAMAAwAfAf8BAAAAAAADABIAqQIAAAAAAAMAEgCpAwAAAAA=
security.iftacl_vol
trusted.volname="volume_1"

Q: How to show the debug message of iftacl?
Ans:
1. /usr/local/iftacl_dbg
2. dmesg -w
[20777.216456] ++++iftacl_debug_enable+++, 1

0 --> close
1 --> open

Q: How to switch between iftacl and posix-acl?
Ans:
1. /usr/local/iftacl_switch
2. dmesg -w
[20034.958464] ++++ift_switch+++, 0

0 --> close (switch to posix-acl)
1 --> open (switch to iftacl)

";i:1;N;i:2;N;}i:2;i:224;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:930;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"user / group";i:1;i:1;i:2;i:930;}i:2;i:930;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:930;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:512:"

[Question]
Q: How to add group relation between nt-group and unix-group?
Ans:
Example: 
/usr/bin/net groupmap add ntgroup='uesrs' unixgroup='users' rid=513 type=local

Description:
This example have two steps:
1. Add a nt group named "users" with rid 513.
2. Create relation between ntgroup and unixgroup.

[Question]
Q: How to remove group relation between nt-group and unix-group?
Ans:
Example: 
/usr/bin/net groupmap delete ntgroup='users'

Description:
This example will remove the ntgroup named users.

 
";i:1;N;i:2;N;}i:2;i:963;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1485;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"Frequently Asked Questions";i:1;i:1;i:2;i:1485;}i:2;i:1485;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1485;}i:15;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1526;}i:16;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1526;}i:17;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1526;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1530;}i:19;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:21:"nas:faq:gmodel_ctrlab";i:1;s:53:"Gui send A/B controller in G-Model, How to handle it?";}i:2;i:1531;}i:20;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1610;}i:21;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1610;}i:22;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1610;}i:23;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1610;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1614;}i:25;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:29:"nas:faq:haserver_reloadModule";i:1;s:32:"How to reload module in HAServer";}i:2;i:1615;}i:26;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1681;}i:27;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1681;}i:28;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1681;}i:29;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1681;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1685;}i:31;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:24:"nas:faq:haserver_initXml";i:1;s:39:"How to init xml config file in HAServer";}i:2;i:1686;}i:32;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1754;}i:33;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1754;}i:34;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1754;}i:35;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1754;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1758;}i:37;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:15:"nas:faq:nas_nfs";i:1;s:22:"How to set nfs service";}i:2;i:1759;}i:38;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1801;}i:39;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1801;}i:40;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1801;}i:41;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1801;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1805;}i:43;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:19:"nas:faq:create_file";i:1;s:28:"Create file by specific size";}i:2;i:1806;}i:44;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1858;}i:45;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1858;}i:46;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1858;}i:47;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1858;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1862;}i:49;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:33:"nas:faq:export_import_ldap_server";i:1;s:39:"ldap server export and import mechanism";}i:2;i:1863;}i:50;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1940;}i:51;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1940;}i:52;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1940;}i:53;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1940;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1944;}i:55;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:37:"nas:faq:mount_root_filesystem_byiscsi";i:1;s:30:"mount root filesystem by iscsi";}i:2;i:1945;}i:56;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2017;}i:57;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2017;}i:58;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2017;}i:59;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2017;}i:60;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2017;}}