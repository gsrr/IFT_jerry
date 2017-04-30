a:22:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Reference";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:142:"
# Setting up Samba as a Domain Member
https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Domain_Member#Testing_the_Winbindd_Connectivity
";i:1;N;i:2;N;}i:2;i:30;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:182;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"acl";i:1;i:1;i:2;i:182;}i:2;i:182;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:182;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2415:"
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

";i:1;N;i:2;N;}i:2;i:205;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2631;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"AD take over";i:1;i:1;i:2;i:2631;}i:2;i:2631;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2631;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1677:"
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

";i:1;N;i:2;N;}i:2;i:2663;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4349;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"join AD";i:1;i:1;i:2;i:4349;}i:2;i:4349;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4349;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:284:"
# join AD
net ads join -U administrator%ABcd1234

# leave AD
net ads leave -U administrator%ABcd1234

# join specific AD
net ads join -S WIN-2012R2ADC.winadntp.evt -U administrator%ABcd_1234

# leave specific AD
net ads leave -S WIN-2012R2ADC.winadntp.evt -U administrator%ABcd_1234
";i:1;N;i:2;N;}i:2;i:4376;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4670;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Error Message";i:1;i:1;i:2;i:4670;}i:2;i:4670;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4670;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:502:"
# failed to join AD
Failed to join domain: failed to join domain 'WINADNTP.EVT' over rpc: None of the information to be translated has been translated.
--> Delete the computer account of AD

# failed to join AD
[root@nas_8686288_a ~]# net ads join -U administrator%ABcd_1234 -s /etc/samba/net_smb.conf
Failed to join domain: Invalid configuration ("workgroup" set to '', should be 'WINADNTP') and configuration modification was not requested
--> nmblookup -A ip , 沒辦法得到group information?



";i:1;N;i:2;N;}i:2;i:4703;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5214;}i:21;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5214;}}