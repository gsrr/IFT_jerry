a:188:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Reference";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:142:"
# Setting up Samba as a Domain Member
https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Domain_Member#Testing_the_Winbindd_Connectivity
";i:1;N;i:2;N;}i:2;i:30;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:183;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:40:"[QMS] GS can't get groups from AD domain";i:1;i:1;i:2;i:183;}i:2;i:183;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:183;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:4227:"
[Reference]
1. https://wiki.samba.org/index.php/Samba_4.2_Features_added/changed
2. https://git.centos.org/blob/rpms!!samba.git/848ca4f68d306440271cfd1c7fdaa12042cc5b9a/SOURCES!samba-4.2.10-s3-winbind-make-sure-domain-member-can-talk-to-trust.patch

[Error Message]
[2018/05/31 14:34:38.330229, 10, pid=2741, effective(0, 0), real(0, 0), class=winbind] ../source3/winbindd/winbindd_cm.c:384(winbind_msg_domain_online)
  Domain INFRA1 is marked as online now.
[2018/05/31 14:34:39.705035,  1, pid=2741, effective(0, 0), real(0, 0)] ../librpc/ndr/ndr.c:439(ndr_print_function_debug)
       wbint_LookupGroupMembers: struct wbint_LookupGroupMembers
          out: struct wbint_LookupGroupMembers
              members                  : *
                  members: struct wbint_Principals
                      num_principals           : 0
                      principals: ARRAY(0)
              result                   : NT_STATUS_DOWNGRADE_DETECTED
[2018/05/31 14:34:39.717674,  5, pid=2741, effective(0, 0), real(0, 0), class=winbind] ../source3/winbindd/winbindd_getgrent.c:149(winbindd_getgrent_recv)
  getgrent failed: NT_STATUS_DOWNGRADE_DETECTED
[2018/05/31 14:34:39.721212, 10, pid=2741, effective(0, 0), real(0, 0), class=winbind] ../source3/winbindd/winbindd.c:787(wb_request_done)
  wb_request_done[2804:GETGRENT]: NT_STATUS_DOWNGRADE_DETECTED

[Error Code]
NT_STATUS_DOWNGRADE_DETECTED

[Analysis]
在winbind的getent passwd / getent group流程是這樣:
for domain in all-domains:
    1. winbind會先連到AD domain, get user information.
    2. 逐一跟所有AD domain進行連接, 在達到250筆時就會先回傳.
    3. 若遇到fail狀況則停止.

此時若重新getent group會沒有抓新的資料, 因為user information並沒有改變.

而這個問題經確認後, 似乎是該AD-trust domain無法支援加密式的連接, 導致每次在跟這個domain要資訊時會fail掉.

從[1]:
Winbind now requires secured connections
To improve protection against rogue domain controllers we now require that when we connect to an AD DC in our forest, that the connection be signed using SMB Signing. Set 'client signing = off' in the smb.conf to disable.

Also and DCE/RPC pipes must be sealed, set 'require strong key = false' and 'winbind sealed pipes = false' to disable.

Finally, the default for 'client ldap sasl wrapping' has been set to 'sign', to ensure the integrity of LDAP connections. Set 'client ldap sasl wrapping = plain' to disable.

從[1]:
Winbindd/Netlogon improvements
The whole concept of maintaining the netlogon secure channel to (other) domain controllers was rewritten in order to maintain global state in a netlogon_creds_cli.tdb. This is the proper fix for a large number of bugs:

 https://bugzilla.samba.org/show_bug.cgi?id=10860
 https://bugzilla.samba.org/show_bug.cgi?id=6563
 https://bugzilla.samba.org/show_bug.cgi?id=7944
 https://bugzilla.samba.org/show_bug.cgi?id=7945
 https://bugzilla.samba.org/show_bug.cgi?id=7568
 https://bugzilla.samba.org/show_bug.cgi?id=8599
In addition a strong session key is now required by default, which means that communication to older servers or clients might be rejected by default.

For the client side we have the following new options:
"require strong key" (yes by default), "reject md5 servers" (no by default). E.g. for Samba 3.0.37 you need "require strong key = no" and
for NT4 DCs you need "require strong key = no" and "client NTLMv2 auth = no",

On the server side (as domain controller) we have the following new options:
"allow nt4 crypto" (no by default), "reject md5 client" (no by default). E.g. in order to allow Samba < 3.0.27 or NT4 members to work you need "allow nt4 crypto = yes"
winbindd does not list group memberships for display purposes (e.g. getent group <domain\<group>) anymore by default.
The new default is "winbind expand groups = 0" now, the reason for this is the same as for "winbind enum users = no" and "winbind enum groups = no". Providing this information is not always reliably possible, e.g. if there are trusted domains.

[Correlation]
1. 將winbind的連接取消加密方式.
2. Modify /etc/samba/smb.conf and /etc/samba/net_smb.conf
require strong key = no
winbind sealed pipes = no

";i:1;N;i:2;N;}i:2;i:243;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4480;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:35:"login samba server by kerberos auth";i:1;i:1;i:2;i:4480;}i:2;i:4480;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4480;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:877:"
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


";i:1;N;i:2;N;}i:2;i:4535;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5422;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"Event and Error message";i:1;i:1;i:2;i:5422;}i:2;i:5422;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:5422;}i:15;a:3:{i:0;s:10:"table_open";i:1;a:3:{i:0;i:5;i:1;i:9;i:2;i:5460;}i:2;i:5459;}i:16;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5459;}i:17;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5459;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5461;}i:19;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5462;}i:20;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5462;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5463;}i:22;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5464;}i:23;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5464;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"message";}i:2;i:5465;}i:25;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5472;}i:26;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5472;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"event";}i:2;i:5473;}i:28;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5478;}i:29;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5478;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5479;}i:31;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5480;}i:32;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5481;}i:33;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5481;}i:34;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5481;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"AD";}i:2;i:5483;}i:36;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5485;}i:37;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5485;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:"Password / Accout Error (Preauthentication failed)";}i:2;i:5486;}i:39;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5536;}i:40;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5536;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:" 使用者名稱或密碼不正確。";}i:2;i:5537;}i:42;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5574;}i:43;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5574;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:5575;}i:45;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5578;}i:46;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5578;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5579;}i:48;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5580;}i:49;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5581;}i:50;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5581;}i:51;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5581;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"AD";}i:2;i:5583;}i:53;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5585;}i:54;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5585;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:" Dns Entry error (Can not find KDC Server) ";}i:2;i:5586;}i:56;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5629;}i:57;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:5:"right";i:2;i:1;}i:2;i:5629;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"  X ";}i:2;i:5630;}i:59;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5634;}i:60;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5634;}i:61;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:5635;}i:62;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5638;}i:63;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5638;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5639;}i:65;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5640;}i:66;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5641;}i:67;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5641;}i:68;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5641;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"AD";}i:2;i:5643;}i:70;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5645;}i:71;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5645;}i:72;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:" ip error (Can't contact LDAP server)";}i:2;i:5646;}i:73;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5683;}i:74;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:4:"left";i:2;i:1;}i:2;i:5683;}i:75;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:" 無法連到網域伺務器。  ";}i:2;i:5684;}i:76;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5717;}i:77;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5717;}i:78;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:5718;}i:79;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5721;}i:80;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5721;}i:81;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5722;}i:82;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5723;}i:83;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5724;}i:84;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5724;}i:85;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5724;}i:86;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"AD";}i:2;i:5726;}i:87;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5728;}i:88;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5728;}i:89;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:127:" account 沒有admin 權限 ( Failed to join domain: Failed to set account flags for machine account (NT_STATUS_ACCESS_DENIED))";}i:2;i:5729;}i:90;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5856;}i:91;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:4:"left";i:2;i:1;}i:2;i:5856;}i:92;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:" X  ";}i:2;i:5857;}i:93;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5861;}i:94;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5861;}i:95;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:5862;}i:96;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5865;}i:97;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5865;}i:98;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5866;}i:99;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5867;}i:100;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5868;}i:101;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5868;}i:102;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5868;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"LDAP";}i:2;i:5870;}i:104;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5874;}i:105;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5874;}i:106;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:" Password (ldap_bind: Invalid credentials) ";}i:2;i:5875;}i:107;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5918;}i:108;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:4:"left";i:2;i:1;}i:2;i:5918;}i:109;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:" 使用者名稱或密碼不正確。  ";}i:2;i:5919;}i:110;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5958;}i:111;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5958;}i:112;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:5959;}i:113;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5962;}i:114;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5962;}i:115;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5963;}i:116;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5964;}i:117;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5965;}i:118;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5965;}i:119;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5965;}i:120;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"LDAP";}i:2;i:5967;}i:121;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5971;}i:122;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5971;}i:123;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:" User Dn error (ldap_bind: Invalid credentials) ";}i:2;i:5972;}i:124;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6020;}i:125;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6020;}i:126;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:" 使用者名稱或密碼不正確。 ";}i:2;i:6021;}i:127;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6059;}i:128;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6059;}i:129;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:6060;}i:130;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6063;}i:131;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6063;}i:132;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6064;}i:133;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6065;}i:134;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6066;}i:135;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6066;}i:136;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6066;}i:137;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"LDAP";}i:2;i:6068;}i:138;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6072;}i:139;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6072;}i:140;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:" ip error (can not contact ldap server)";}i:2;i:6073;}i:141;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6112;}i:142;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6112;}i:143;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:" 無法連接到LDAP伺服器 ";}i:2;i:6113;}i:144;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6143;}i:145;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6143;}i:146;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:6144;}i:147;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6147;}i:148;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6147;}i:149;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6148;}i:150;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6149;}i:151;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6150;}i:152;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6150;}i:153;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6150;}i:154;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"LDAP";}i:2;i:6152;}i:155;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6156;}i:156;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6156;}i:157;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:" Base Dn error (No such object)";}i:2;i:6157;}i:158;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6188;}i:159;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6188;}i:160;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:6189;}i:161;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6192;}i:162;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6192;}i:163;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" X ";}i:2;i:6193;}i:164;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6196;}i:165;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6196;}i:166;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6197;}i:167;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6198;}i:168;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6199;}i:169;a:3:{i:0;s:11:"table_close";i:1;a:1:{i:0;i:6199;}i:2;i:6199;}i:170;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6205;}i:171;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"acl";i:1;i:1;i:2;i:6205;}i:2;i:6205;}i:172;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6205;}i:173;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2415:"
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

";i:1;N;i:2;N;}i:2;i:6228;}i:174;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8654;}i:175;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"AD take over";i:1;i:1;i:2;i:8654;}i:2;i:8654;}i:176;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:8654;}i:177;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1677:"
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

";i:1;N;i:2;N;}i:2;i:8686;}i:178;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10372;}i:179;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"AD related commands";i:1;i:1;i:2;i:10372;}i:2;i:10372;}i:180;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:10372;}i:181;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:580:"
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
";i:1;N;i:2;N;}i:2;i:10411;}i:182;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11001;}i:183;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Error Message";i:1;i:1;i:2;i:11001;}i:2;i:11001;}i:184;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:11001;}i:185;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1457:"
# port 445 is blocked
Failed to join domain: failed to lookup DC info for domain 'DVT.CANEAD.INFORTREND' over rpc: {Device Timeout} The specified I/O operation on %hs was not completed before the time-out period expired.



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

";i:1;N;i:2;N;}i:2;i:11034;}i:186;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12500;}i:187;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:12500;}}