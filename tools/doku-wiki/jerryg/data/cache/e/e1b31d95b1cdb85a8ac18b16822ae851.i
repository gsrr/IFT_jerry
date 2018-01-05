a:184:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Reference";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:142:"
# Setting up Samba as a Domain Member
https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Domain_Member#Testing_the_Winbindd_Connectivity
";i:1;N;i:2;N;}i:2;i:30;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:182;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:35:"login samba server by kerberos auth";i:1;i:1;i:2;i:182;}i:2;i:182;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:182;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:877:"
這個問題大概有兩個面向:
1. samba service
1.1 需使用netbios進行login(ip 與netbios的行為不一樣)
ip 會預設走ntlm的方式, netbios則是走kerberos的方式.

1.2 可以使用smbclient進行測試:
(https://cwiki.apache.org/confluence/display/DIRxINTEROP/Using+Kerberos+Credentials+with+smbclient)

a. 先join AD
b. 使用kinit跟AD要一個key : kinit administrator@WINADNTP.EVT
(或使用wbinfo -K administrator%ABcd_1234)
c. smbclient -k //nas_8632830_a/AA -R host -U administrator -d 4


2. other service (透過pam認證, 像sftp, ftp...etc)
2.1 需要先將/etc/security/pam_winbind.conf裡面的kerberos設定enable
(https://wiki.samba.org/index.php/PAM_Kerberos_Authentication)
主要有兩個東西:
krb5_auth = yes
krb5_ccache_type = FILE

2.2 當user登入時,  就會在tmp底下產生一個該user的key file, 像是/tmp/krb5cc_11001703


";i:1;N;i:2;N;}i:2;i:237;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1124;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"Event and Error message";i:1;i:1;i:2;i:1124;}i:2;i:1124;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1124;}i:11;a:3:{i:0;s:10:"table_open";i:1;a:3:{i:0;i:5;i:1;i:9;i:2;i:1162;}i:2;i:1161;}i:12;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:1161;}i:13;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1161;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1163;}i:15;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1164;}i:16;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1164;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1165;}i:18;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1166;}i:19;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1166;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"message";}i:2;i:1167;}i:21;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1174;}i:22;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1174;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"event";}i:2;i:1175;}i:24;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1180;}i:25;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1180;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1181;}i:27;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1182;}i:28;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:1183;}i:29;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:1183;}i:30;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1183;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"AD";}i:2;i:1185;}i:32;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1187;}i:33;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1187;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:"Password / Accout Error (Preauthentication failed)";}i:2;i:1188;}i:35;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1238;}i:36;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1238;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:" 使用者名稱或密碼不正確。";}i:2;i:1239;}i:38;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1276;}i:39;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1276;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:1277;}i:41;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1280;}i:42;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1280;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1281;}i:44;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1282;}i:45;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:1283;}i:46;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:1283;}i:47;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1283;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"AD";}i:2;i:1285;}i:49;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1287;}i:50;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1287;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:" Dns Entry error (Can not find KDC Server) ";}i:2;i:1288;}i:52;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1331;}i:53;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:5:"right";i:2;i:1;}i:2;i:1331;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"  X ";}i:2;i:1332;}i:55;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1336;}i:56;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1336;}i:57;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:1337;}i:58;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1340;}i:59;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1340;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1341;}i:61;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1342;}i:62;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:1343;}i:63;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:1343;}i:64;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1343;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"AD";}i:2;i:1345;}i:66;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1347;}i:67;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1347;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:" ip error (Can't contact LDAP server)";}i:2;i:1348;}i:69;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1385;}i:70;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:4:"left";i:2;i:1;}i:2;i:1385;}i:71;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:" 無法連到網域伺務器。  ";}i:2;i:1386;}i:72;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1419;}i:73;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1419;}i:74;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:1420;}i:75;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1423;}i:76;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1423;}i:77;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1424;}i:78;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1425;}i:79;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:1426;}i:80;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:1426;}i:81;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1426;}i:82;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"AD";}i:2;i:1428;}i:83;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1430;}i:84;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1430;}i:85;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:127:" account 沒有admin 權限 ( Failed to join domain: Failed to set account flags for machine account (NT_STATUS_ACCESS_DENIED))";}i:2;i:1431;}i:86;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1558;}i:87;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:4:"left";i:2;i:1;}i:2;i:1558;}i:88;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:" X  ";}i:2;i:1559;}i:89;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1563;}i:90;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1563;}i:91;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:1564;}i:92;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1567;}i:93;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1567;}i:94;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1568;}i:95;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1569;}i:96;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:1570;}i:97;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:1570;}i:98;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1570;}i:99;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"LDAP";}i:2;i:1572;}i:100;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1576;}i:101;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1576;}i:102;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:" Password (ldap_bind: Invalid credentials) ";}i:2;i:1577;}i:103;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1620;}i:104;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:4:"left";i:2;i:1;}i:2;i:1620;}i:105;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:" 使用者名稱或密碼不正確。  ";}i:2;i:1621;}i:106;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1660;}i:107;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1660;}i:108;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:1661;}i:109;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1664;}i:110;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1664;}i:111;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1665;}i:112;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1666;}i:113;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:1667;}i:114;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:1667;}i:115;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1667;}i:116;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"LDAP";}i:2;i:1669;}i:117;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1673;}i:118;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1673;}i:119;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:" User Dn error (ldap_bind: Invalid credentials) ";}i:2;i:1674;}i:120;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1722;}i:121;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1722;}i:122;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:" 使用者名稱或密碼不正確。 ";}i:2;i:1723;}i:123;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1761;}i:124;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1761;}i:125;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:1762;}i:126;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1765;}i:127;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1765;}i:128;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1766;}i:129;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1767;}i:130;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:1768;}i:131;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:1768;}i:132;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1768;}i:133;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"LDAP";}i:2;i:1770;}i:134;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1774;}i:135;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1774;}i:136;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:" ip error (can not contact ldap server)";}i:2;i:1775;}i:137;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1814;}i:138;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1814;}i:139;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:" 無法連接到LDAP伺服器 ";}i:2;i:1815;}i:140;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1845;}i:141;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1845;}i:142;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:1846;}i:143;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1849;}i:144;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1849;}i:145;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1850;}i:146;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1851;}i:147;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:1852;}i:148;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:1852;}i:149;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1852;}i:150;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"LDAP";}i:2;i:1854;}i:151;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1858;}i:152;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1858;}i:153;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:" Base Dn error (No such object)";}i:2;i:1859;}i:154;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1890;}i:155;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1890;}i:156;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:1891;}i:157;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1894;}i:158;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1894;}i:159;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:1895;}i:160;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1898;}i:161;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:1898;}i:162;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1899;}i:163;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:1900;}i:164;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:1901;}i:165;a:3:{i:0;s:11:"table_close";i:1;a:1:{i:0;i:1901;}i:2;i:1901;}i:166;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1907;}i:167;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"acl";i:1;i:1;i:2;i:1907;}i:2;i:1907;}i:168;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1907;}i:169;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2415:"
# user join group after login
## gs-join group-ad
1. user1 login samba
2. join group (ad)
3. without update user list
ret --> can not access share folder (without relogin)
relogin --> can access share folder

[root@nas_8446485_a ~]# id WINADNTP\\test001
uid=11001369(WINADNTP\test001) gid=11000513(WINADNTP\domain users) groups=11001369(WINADNTP\test001),11000513(WINADNTP\domain users),11001372(WINADNTP\group002)

## gs-join group-ad
1. user1 login samba
2. join group (ad)
3. without update user list
ret --> can not access share folder (without relogin)
relogin --> can access share folder

[root@nas_8446485_a ~]# id WINADNTP\\test001
uid=11001369(WINADNTP\test001) gid=11000513(WINADNTP\domain users) groups=11001369(WINADNTP\test001),11000513(WINADNTP\domain users),11001372(WINADNTP\group002)

## gs-join group-ad
1. user1 login samba
2. user1 join group
3. update user list 
ret --> can not access share folder 
relogin --> can access share folder

## gs without re-login
1. user1 login samba
2. user1 join group (ad)
3. update user list
ret -->

## gs without re-login
1. user1 login samba
2. user1 join group (ad)
3. without update user list
ret --> 
relogin --> 

## gs-join group-ldap
1. user1 login samba
2. user1 join group
3. without update user list 
ret --> can not access share folder (without relogin)
relogin --> can not access share folder

## gs-join group-ldap
1. user1 login samba
2. user1 join group
3. update user list 
ret --> can not access share folder (without relogin)
relogin --> can access share folder

## gs-leave group-ldap
1. user1 login samba
2. user1 leave group
3. without update user list 
ret --> can access share folder (without relogin)
relogin --> can access share folder

## gs-leave group-ldap
1. user1 login samba
2. user1 leave group
3. update user list 
ret --> can access share folder (without relogin)
relogin --> can not can access share folder

## synology without re-login
1. user1 login samba
2. join group
3. waiting time (check user list)
ret --> 


Summary:
1. 一定要重新login才會生效, 不論有update user or not. (nscd -i group)
2. ad跟ldap的行為不太一樣, ad的id command似乎沒有辦法再nscd -i group就更新, 必須要重新login
3. ad只要重新login, 其acl就可以生效, 即便id user沒有更新也沒關係.
3. synology 在add group時, 似乎可以不用重新login, 但leave group時等了15分鐘還是可以操作.

";i:1;N;i:2;N;}i:2;i:1930;}i:170;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4356;}i:171;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"AD take over";i:1;i:1;i:2;i:4356;}i:2;i:4356;}i:172;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4356;}i:173;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1677:"
172.27.120.180 WIN-2012R2ADC.winadntp.evt
172.27.120.179 WIN-2012R2ADNTP.winadntp.evt
# join AD message
Using short domain name -- WINADNTP
5433 Joined 'NAS_824366_A' to dns domain 'winadntp.evt'
5434 No DNS domain configured for nas_824366_a. Unable to perform DNS Update.)
--> normal message

# failed to join AD
Mar 27 02:42:12 nas_824366_a ldapOperation[2449]: (cmd, out) = (['/usr/bin/net', 'ads', 'join', '-S', 'WIN-2012R2ADC.winadntp.evt', '-U', 'administrator%ABcd_1234', '-s', '/etc/samba/net_smb.conf'], Failed to join domain: Failed to set
machine spn: Constraint violation Do you have sufficient permissions to create machine accounts?)
Mar 27 02:42:12 nas_824366_a diagnosticOperation[2449]: {'status': 71, 'err': '', 'out': 'Failed to join domain: Failed to set machine spn: Constraint violation\nDo you have sufficient permissions to create machine accounts?'}
--> Delete the computer account of AD

Root Cause:
若A, B兩台機器, A join完斷線, 這時候會換join B來進行接手,此時新增加的computer object id與join A時並不一樣,
所以當A起來後, 會多出一個computerCNF的object, 導致若要換成joinA接手時會失敗.

# 另外一個問題是沒辦法透過DNS找不到ip
--> 看起來是因為找到192.168.99.14去了, 導致DNS會一直回覆unknown host.
anyway , 目前測試起來, 應該不需要進行重新join的動作.
只要透過wbinfo -P來讓winbind ping AD, 就可以讓winbind建立正確連線.

test scope:
1. DNS應該只保留查詢得到的nameserver. (192.168.99.14, 192.168.99.16都應該去除)
2. 將AD斷線, 等待約5~10分鐘, 再重新使用AD user來登入samba, 確認該user可以正常登入.

";i:1;N;i:2;N;}i:2;i:4388;}i:174;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6074;}i:175;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"AD related commands";i:1;i:1;i:2;i:6074;}i:2;i:6074;}i:176;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6074;}i:177;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:580:"
# smbd
1. port 139, port 445

# nmbd
1. port 137, port 138
UDP    172.27.12.71:137       *:*                                    4
UDP    172.27.12.71:138       *:*                                    4

# search workgroup
1. net ads workgroup -S 172.27.120.130
2. nmblookup -A 172.27.l20.130
3. 

# join AD
net ads join -U administrator%ABcd1234

# leave AD
net ads leave -U administrator%ABcd1234

# join specific AD
net ads join -S WIN-2012R2ADC.winadntp.evt -U administrator%ABcd_1234

# leave specific AD
net ads leave -S WIN-2012R2ADC.winadntp.evt -U administrator%ABcd_1234
";i:1;N;i:2;N;}i:2;i:6113;}i:178;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6703;}i:179;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Error Message";i:1;i:1;i:2;i:6703;}i:2;i:6703;}i:180;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6703;}i:181;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1233:"
# can not get user information (MIS , England)
getent group : 3m40 + 3m37

# failed to join AD
Failed to join domain: failed to join domain 'WINADNTP.EVT' over rpc: None of the information to be translated has been translated.
--> Delete the computer account of AD

# failed to join AD
[root@nas_8686288_a ~]# net ads join -U administrator%ABcd_1234 -s /etc/samba/net_smb.conf
Failed to join domain: Invalid configuration ("workgroup" set to '', should be 'WINADNTP') and configuration modification was not requested
--> nmblookup -A ip , 沒辦法得到group information?
Ans : 
看起來是客戶將netbios over tcp/ip這個service關掉了, 導致nmblookup -A ip 沒有辦法得到資訊.
打開的方式如下: 
http://172.27.12.189/jerryg/lib/exe/fetch.php?media=netbios_over_tcpip.png

# failed to join AD (not have admin privilege)
n  1 15:47:21 mlmlpppnt03_a ldapOperation[1318]: joinAD result: {'status': 71, 'err': '', 'out': 'Failed to join domain: User specified does not have administrator privileges'}

# account error
joinAD result: {'status': 71, 'err': '', 'out': "Failed to join domain: failed to lookup DC info for domain 'VCPILTPAC.COM' over rpc: Account locked out"}
--> 看起來是帳號沒有辦法使用.?

";i:1;N;i:2;N;}i:2;i:6736;}i:182;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7978;}i:183;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:7978;}}