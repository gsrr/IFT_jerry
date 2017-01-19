a:15:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:0;}i:3;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:0;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:55:" The nascmd_client.py is under /usr/local/NAS/misc/Cmd/";}i:2;i:4;}i:5;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:59;}i:6;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:59;}i:7;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:59;}i:8;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:59;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:63;}i:10;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:64;}i:11;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:64;}i:12;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:64;}i:13;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:678:"
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
  * Unordered List Itempython nascmd_client.py --test
";i:1;N;i:2;N;}i:2;i:70;}i:14;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:70;}}