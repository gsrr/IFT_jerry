a:27:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"ldap client";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18;}i:4;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:119:"
service options ldap -z a@0 -a 172.27.112.154 -b dc=test,dc=ift,dc=com -r cn=admin,dc=test,dc=ift,dc=com -p ABcd_1234
";i:1;N;i:2;N;}i:2;i:18;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"ldapserver command:";}i:2;i:146;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:171;}i:8;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:104:"
# start ldapserver
ldapserver host options -d aaa.com -p ABcd_1234 -z a@0
ldapserver host start -z a@0
";i:1;N;i:2;N;}i:2;i:171;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:171;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"schedule command:";}i:2;i:285;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:308;}i:12;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:693:"
schedule create -c rr -s RR_20170210101057 -n New_Schedule_20170210_181330 -z A@0 -t daily -sd 20170210 -ed 00000000 -T 1813 -E off -et 0000

replicate create /Pool-1/Volume_1/test001 -z A@0 -D /Pool-1/Volume_1/UserHome/cc/ -a 127.0.0.1 -P 22 -n off -e on -T nas -p=XXXXX -c off -u="root" -s off -A None -r off

#Third party, encryption off
replicate create /mnt/f1/f1 -T rsync -a 127.0.0.1 -u admin -p admin -D aaa -z a@0

scheduleRR create -tp single -sf /Pool-1/Volume_1/test001 -n New_Schedule_20170210_181330 -st nas -e on -a 127.0.0.1 -P 22 -u root -pw XXXXXX -D /Pool-1/Volume_1/UserHome/cc/ -c off -s off -t daily -T 1813 -sd 20170210 -ed 00000000 -r off -et 0000 -E off -z a@8709770
";i:1;N;i:2;N;}i:2;i:308;}i:13;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1010;}i:14;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1010;}i:15;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1010;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:55:" The nascmd_client.py is under /usr/local/NAS/misc/Cmd/";}i:2;i:1014;}i:17;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1069;}i:18;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1069;}i:19;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1069;}i:20;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1069;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1073;}i:22;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1074;}i:23;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1074;}i:24;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1074;}i:25;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:659:"
Start service:
  * systemctl start nascli

Stop Service:
  * systemctl stop nascli

batch test: (example)
  * python nascmd_client.py -f Script/ldapserver.txt -o output.log

debug mode:
  * python nascmd_client.py -c "enable_debug" (No limit in log message)
  * python nascmd_client.py -c "disable_debug" (log message is limited in 300 bytes)

check alive:
  * python nascmd_client.py -c "check_alive -z a@0"

reload module:
  * python nascmd_client.py -c "reload_module $module_name"

interactive mode:
  * python nascmd_client.py -i

ssl transporation:
  * python nascmd_client.py --ssl -c "ha status -z a@0"

unit test:
  * python nascmd_client.py --test
";i:1;N;i:2;N;}i:2;i:1080;}i:26;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1080;}}