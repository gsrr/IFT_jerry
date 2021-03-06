a:191:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"Test scope";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2172:"
[Samba]
8. 在ntacl加入ldap user-->關掉ldap-->確認可以正常getntacl.
--> 會map 到unix user, 所以看起來不會有問題.

7. 在ntacl加入ad user-->關掉winbind-->確認可以正常getntacl.
Info:
因為不存在, 所以目前會顯示為sid:
{"status": 0, "data": {"path": "/Pool-1/Volume_1/share1/sub1/file_1", "acl": {"DF": 32788, "aces": [{"u": "S-1-5-21-1204859101-1321558819-4221560078-2744", "am": 2032127, "at": 0, "af": 3}, {"u": 1000, "am": 2032127, "at": 0, "af": 3}], "G": 0, "O": 0}}}
--> 增加error handle, 若不存在就回sid.

1. 在samba上設定acl, 確認會產生security.iftacl的key, 並且可以正常parse出內容.
2. 刪除security.NTACL, 再從windows觀看acl, 確認log會產生"NT key is not exist"
3. Open acl from samba normally.
4. 刪除security.NTACL-->設定security.iftacl-->確認從samba看的結果會與security.iftacl相同.
Q1: fail, 無法從security.iftacl正常回報資料.
Info:
../source3/modules/ift_acl.h:177(iftacl_merge) uid 1000 -> sid S-18-0 -> sid (NULL SID)
../source3/modules/ift_acl.h:178(iftacl_merge) uid 8 -> sid (SID ERR) -> sid (NULL SID)

Ans:
成功, 是因為有些時候samba會代null structure, 已經將這些case過濾掉.

5. 設定security.NTACL-->修改security.iftacl並將dirty改為1-->確認從samba看的結果會與security.iftacl相同.  
Info:
[2018/01/30 13:24:46.854189,  0] ../source3/modules/ift_acl.h:177(iftacl_merge)

6. 若security.iftacl與security.NTACL不一致時(security.NTACL不存在), 此時多加入一筆entry後, 會導致原先在posix裡面的資料也都跑出來.

  owner of sd is null
[2018/01/30 13:24:46.856030,  0] ../source3/modules/ift_acl.h:189(iftacl_merge)
  group of sd is null
[2018/01/30 13:24:46.857626,  0] ../source3/modules/ift_acl.h:215(iftacl_merge)
  path:sub3, user of iftad.uid is:1000, sid = S-1-5-21-2896997548-2896997548-2896997548-1022

Ans:
因為samba在顯示acl時, 會將owner與group代為null, 只有aces丟進來, 但我之前判斷若owner為null時就會return.
--> 跑出來似乎不是問題, 因為沒有NT key的關係, 所以重新設定後會變有繼承, 這時候會導致上層的acl被繼承下來.
";i:1;N;i:2;N;}i:2;i:31;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2213;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Summary";i:1;i:1;i:2;i:2213;}i:2;i:2213;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2213;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2612:"
# smb.conf
1. acl_xattr: ignore system acls = True


# posix acl
1. set_cached_acl
2. get_cached_acl

# python
1. uid to sid
from samba.samba3 import smbd, passdb
from samba.samba3 import param as s3param
s3conf = s3param.get_context()
s3conf.load("/etc/samba/smb.conf")
pdb = passdb.PDB(s3conf.get("passdb backend"))
pdb.uid_to_sid(100001)
--> dom_sid('S-1-5-21-2896997548-2896997548-2896997548-100001')

# security descriptor structure in python
['__class__', '__cmp__', '__delattr__', '__doc__', '__format__', '__getattribute__', '__hash__', '__init__', '__ndr_pack__', '__ndr_print__', '__ndr_unpack__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', 'as_sddl', 'dacl', 'dacl_add', 'dacl_del', 'from_sddl', 'group_sid', 'owner_sid', 'revision', 'sacl', 'sacl_add', 'sacl_del', 'type']


dacl : discretionary access control list 
sacl : system access control list 


# format
# dacl_flags
"P"                    --> SDDL_PROTECTED	        The SE_DACL_PROTECTED flag is set.
"AR"                   --> SDDL_AUTO_INHERIT_REQ	The SE_DACL_AUTO_INHERIT_REQ flag is set.
"AI"                   --> SDDL_AUTO_INHERITED	        The SE_DACL_AUTO_INHERITED flag is set.
"NO_ACCESS_CONTROL"    --> SSDL_NULL_ACL	        The ACL is null.

# account
1. uid
2. Create Owner  (CO, S-1-3-0)
3. Create Group  (CG, S-1-3-1)
4. Everyone      (WD, S-1-1-0)
5. S-1-22-2-0    (S-1-22-2代表unix, 0為uid, 所以是root group)
ref : https://msdn.microsoft.com/en-us/library/cc980032.aspx

ace_type;ace_flags;rights;object_guid;inherit_object_guid;account_sid

# ace_type
A --> Allow
D --> Deny

# ace_flags
OI --> Object inheritance
CI --> Container inheritance
IO --> Inheritance only
ID --> Inherited

# ace_type
Allow    0x00
Deny     0x01

# ace_flags
This folder and file = 0x01
This folder and subfolders = 0x02
NO_PROPAGATE_INHERIT = 0x04 (Only apply the permission to objects/containers within this folder.)
No set this folder = 0x08
This acl is inherited = 0x10
    
# access mask
Full Control	               0x1f01ff	
	
List folders/READ data	       0x100001	 1048577
Create files/Write data	       0x100002
Create folders/Append data     0x100004
Read extended attributes       0x100008
Write attribute	               0x100100
Write extended attribute       0x100010
Traverse folders/execute files 0x100020
Delete subfolders and files    0x100040
READ Attribute	               0x100080
Delete	                       0x110000
Read permission	               0x120000
Change permission	       0x140000  1310720
take owner	               0x180000  1572864
";i:1;N;i:2;N;}i:2;i:2241;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4862;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Installation";i:1;i:1;i:2;i:4862;}i:2;i:4862;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4862;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:315:"
[FAQ]
Q1 : samba-tool 無法get domain sid, 該如何處理?
Ans :
目前是assign一個domain sid給他就可以進行處理, 但為什麼會這樣還是需要進行確認.
domain_sid = security.dom_sid("S-1-5-21")

[packages]
  * yum install -y samba4-python
  * yum install -y samba*
  * yum install pytalloc


";i:1;N;i:2;N;}i:2;i:4894;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4894;}i:13;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:5219;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"file location";}i:2;i:5221;}i:15;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:5234;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5236;}i:17;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:5236;}i:18;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5236;}i:19;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5236;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:" /usr/lib64/python2.7/site-packages/samba/";}i:2;i:5240;}i:21;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5282;}i:22;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5282;}i:23;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:5282;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5282;}i:25;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:5284;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Actions";}i:2;i:5286;}i:27;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:5293;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5295;}i:29;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:5295;}i:30;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5295;}i:31;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5295;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:92:" Remove the extended attribute stored in file, the advanced acl of the file is not affected.";}i:2;i:5299;}i:33;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5391;}i:34;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5391;}i:35;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:5391;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5391;}i:37;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:5393;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"Access Right";}i:2;i:5395;}i:39;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:5407;}i:40;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5409;}i:41;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5409;}i:42;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:19:":samba:ic493699.png";i:1;s:0:"";i:2;N;i:3;s:3:"600";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:5411;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5439;}i:44;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5443;}i:45;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"FAQ";i:1;i:1;i:2;i:5443;}i:2;i:5443;}i:46;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:5443;}i:47;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2963:"
Q7 : 看起來 pytalloc_get_type就會得到security descriptor,  但是怎麼拿到的?
Ans :

Q6 : 從程式架夠看起來有一直遞迴在處理, 但到底在遞迴處理什麼? (是上層檔案 or 下層檔案)
Ans :

Q5 : vfs_handle_struct *handle是指什麼東西的handle?
Ans :

Q4 : 若使用samba-tool set ntacl的話, 也會同步更改到posix-acl嗎?
Ans :
是的, 若使用./samba-tool set ntacl進行設定的話, 也會同步更改到posix-acl

Q3 : set_nt_acl與get_nt_acl的flow?
Ans :
parse_acl_blob(xacl.version = 4) --> ndr_pull_struct_blob --> ndr_pull_xattr_NTACL


Q2 : NT-acl的結構如何解讀?
Ans :
1. getfattr的value開頭的0s代表使用base64進行encode.
2. 若使用getfattr -n security.NTACL -e hex f4 , 就可以dump出跟strace裡面一樣的value.

[root@nas_8801737_a f2]# getfattr -n security.NTACL -e hex f4
# file: f4
security.NTACL=0x0400040000000200040002000100da6a415c3d9c07c704ac3d17a62bb80ad4eace772fb8c449d4b3c109b645f35d0000000000000000000000000000000000000000000000000000000000000000706f7369785f61636c00f8dc3b7f6c4cd30133dc3e9e50718d63fad9ee3c7d5d4a79dbb745ad846dd547878608edb755117100000000000000000000000000000000000000000000000000000000000000000100049cb4000000d000000000000000e0000000010500000000000515000000acacacacacacacacacacacacae8601000102000000000005200000002002000002002c000100000000032400ff011f00010500000000000515000000acacacacacacacacacacacacae860100

[root@nas_8801737_a f2]# cat test.py
a = "0x0400040000000200040002000100da6a415c3d9c07c704ac3d17a62bb80ad4eace772fb8c449d4b3c109b645f35d0000000000000000000000000000000000000000000000000000000000000000706f7369785f61636c00f8dc3b7f6c4cd30133dc3e9e50718d63fad9ee3c7d5d4a79dbb745ad846dd547878608edb755117100000000000000000000000000000000000000000000000000000000000000000100049cb4000000d000000000000000e0000000010500000000000515000000acacacacacacacacacacacacae8601000102000000000005200000002002000002002c000100000000032400ff011f00010500000000000515000000acacacacacacacacacacacacae860100"

ret = []
for i in xrange(2, len(a[2:]) + 2, 2):
        ret.append( chr(int(a[2:][i - 2:i], 16)))
print ret


Q1 : 若從putty建立一個folder, 並設好acl, 從Samba看會是如何?
Ans :
Create by putty:
>>> xattr("f2").list()
[u'trusted.SGI_ACL_FILE', u'trusted.SGI_ACL_DEFAULT', u'system.posix_acl_access', u'system.posix_acl_default']

posix acl of f2:
[root@nas_8801737_a smb]# getfacl f2
# file: f2
# owner: root
# group: root
user::rwx
user:aa:rwx
group::r-x
mask::rwx
other::r-x
default:user::rwx
default:user:aa:rwx
default:group::r-x
default:mask::rwx
default:other::r-x

--> 只要從Samba設過一次, 所有設定就會apply到security.NTACL
--> 更改Samba ntacl, 會同步更改到posix acl.
--> Samba裡面的ACL Entry是 or起來看的.


Create by Samba service:
>>> xattr("f1").list()
[u'user.DOSATTRIB', u'trusted.SGI_ACL_FILE', u'trusted.SGI_ACL_DEFAULT', u'security.NTACL', u'system.posix_acl_access', u'system.posix_acl_default']


";i:1;N;i:2;N;}i:2;i:5466;}i:48;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8440;}i:49;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"Set NT-acl";i:1;i:1;i:2;i:8440;}i:2;i:8440;}i:50;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:8440;}i:51;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:624:"
# samba-tool
[root@localhost bin]# ./samba-tool ntacl get /tmp/ccc.txt --as-sddl
O:S-1-5-21-3863028735-649080503-733086412-1000G:DUD:AI(D;;0x001f01ff;;;S-1-5-21-3863028735-649080503-733086412-1000)(A;;0x001f01ff;;;DU)(A;ID;0x001f01ff;;;S-1-5-21-3863028735-649080503-733086412-1000)(A;ID;0x001200a9;;;DU)(A;ID;0x001200a9;;;WD)

# set ntacl
./samba-tool ntacl set "O:S-1-5-21-2896997548-2896997548-2896997548-1003G:BAD:(A;;0x001f019f;;;S-1-5-21-2896997548-2896997548-2896997548-1003)(A;;0x00120089;;;BA)(A;;0x00120089;;;WD)" /tmp/test.txt

# smbcacls
smbcacls //172.27.112.150/testext file1 -U aa --add ACL:aa:ALLOWED/3/FULL
";i:1;N;i:2;N;}i:2;i:8471;}i:52;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9105;}i:53;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:53:"sddl format (Security Descriptor Definition Language)";i:1;i:1;i:2;i:9105;}i:2;i:9105;}i:54;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:9105;}i:55;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:683:"
The following is an example SDDL string:
O:S-1-5-21-3863028735-649080503-733086412-1000G:DUD:AI(D;;0x001f01ff;;;S-1-5-21-3863028735-649080503-733086412-1000)(A;;0x001f01ff;;;DU)(A;ID;0x001f01ff;;;S-1-5-21-3863028735-649080503-733086412-1000)(A;ID;0x001200a9;;;DU)(A;ID;0x001200a9;;;WD)

To better view the various part:
O:S-1-5-21-3863028735-649080503-733086412-1000 
G:DU 
D:AI
  (D;;0x001f01ff;;;S-1-5-21-3863028735-649080503-733086412-1000)
  (A;;0x001f01ff;;;DU)
  (A;ID;0x001f01ff;;;S-1-5-21-3863028735-649080503-733086412-1000)
  (A;ID;0x001200a9;;;DU)
  (A;ID;0x001200a9;;;WD)
  
  (ACE TYPE:ACE_FLAGS:PERMISSION;;;USER)
  --> ACE_TYPE
      --> A (Allow)
      --> D (DENY)
";i:1;N;i:2;N;}i:2;i:9179;}i:56;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:468:"
Main Part Format:
  O: SID string := Owner
  G: SID string := Group
  D: ACE String := DACL (Discretionary Access Control List)
  S: ACE String := SACL (Security Access Control List) (optional)(optional)
  
"P" --> SDDL_PROTECTED(The SE_DACL_PROTECTED flag is set.)
"AR" --> SDDL_AUTO_INHERIT_REQ(The SE_DACL_AUTO_INHERIT_REQ flag is set.)
"AI" --> SDDL_AUTO_INHERITED(The SE_DACL_AUTO_INHERITED flag is set.)
"NO_ACCESS_CONTROL"  --> SSDL_NULL_ACL(The ACL is null.)
";i:1;N;i:2;N;}i:2;i:9876;}i:57;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1062:"
SID String Chart:
  SID                 String Account alias
  "AN"                Anonymous logon.
  "AU"                Authenticated users.
  "BA"                Built-in administrators.
  "BG"                Built-in guests.
  "BU"                Built-in users.
  “CO”                Creator Owner
  "CG" --> Creator group. The corresponding RID is SECURITY_CREATOR_GROUP_RID.
  "DA"                Domain administrators.
  "DG"                Domain guests.
  "DU"                Domain users
  "EA"                Enterprise administrators
  "WD"                Everyone
  "IU"                Interactively logged-on user.
  "LA"                Local administrator.
  "LG"                Local guest.
  "LS"                Local service account.
  "SY"                Local system
  "NU"                Network logon user
  "NS"                Network service account
  "PU"                Power users
  "RD"                Terminal server users (Remote Desktop)

Ref : https://msdn.microsoft.com/en-us/library/windows/desktop/aa379602(v=vs.85).aspx
";i:1;N;i:2;N;}i:2;i:10358;}i:58;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:452:"
ace_type;ace_flags;rights;object_guid;inherit_object_guid;account_sid;(resource_attribute)
ace_flags:
"CI"  --> ContainerInherit --> The access mask is propagated to child container objects.
"IO"                 SDDL_INHERIT_ONLY
"ID"                 SDDL_INHERITED
"OI"  --> ObjectInherit --> The access mask is propagated onto child leaf objects.

Ref : https://msdn.microsoft.com/en-us/library/system.security.accesscontrol.aceflags(v=vs.110).aspx
";i:1;N;i:2;N;}i:2;i:11434;}i:59;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11434;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"ACE String Format";}i:2;i:11895;}i:61;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:85:"http://172.27.112.239/dokuwiki/lib/exe/fetch.php?media=samba:ace_strings_windows_.pdf";i:1;N;}i:2;i:11912;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:12001;}i:63;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:107:"https://web.archive.org/web/20150810083345/http://networkadminkb.com/KB/a152/how-to-read-a-sddl-string.aspx";i:1;N;}i:2;i:12002;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"
ACE String Format: ";}i:2;i:12113;}i:65;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:96:"https://web.archive.org/web/20141228035833/http://msdn.microsoft.com/en-us/library/aa374928.aspx";i:1;N;}i:2;i:12133;}i:66;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12233;}i:67;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12233;}i:68;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:12235;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Security Descriptor";}i:2;i:12237;}i:70;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:12256;}i:71;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12258;}i:72;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:12258;}i:73;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12258;}i:74;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12258;}i:75;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:" Security Descriptor ";}i:2;i:12262;}i:76;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:12283;}i:77;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"> DACL ";}i:2;i:12285;}i:78;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:12292;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"> ACE Header ";}i:2;i:12294;}i:80;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:12307;}i:81;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"> ACCESS_MASK";}i:2;i:12309;}i:82;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12322;}i:83;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12322;}i:84;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12322;}i:85;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12322;}i:86;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:" The SECURITY_DESCRIPTOR structure defines the security attributes of an object.";}i:2;i:12326;}i:87;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12406;}i:88;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12406;}i:89;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12406;}i:90;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12406;}i:91;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:102:" These attributes specify who owns the object; who can access the object and what they can do with it.";}i:2;i:12410;}i:92;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12512;}i:93;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12512;}i:94;a:3:{i:0;s:13:"listitem_open";i:1;a:2:{i:0;i:1;i:1;i:1;}i:2;i:12512;}i:95;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12512;}i:96;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:" OffsetDacl";}i:2;i:12516;}i:97;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12527;}i:98;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:12527;}i:99;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:2;}i:2;i:12527;}i:100;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12527;}i:101;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:" An unsigned 32-bit integer that specifies the offset to the ";}i:2;i:12533;}i:102;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"ACL";}i:2;i:12594;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:" that contains ACEs that control access. ";}i:2;i:12597;}i:104;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12638;}i:105;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12638;}i:106;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:12638;}i:107;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12638;}i:108;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:12638;}i:109;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12638;}i:110;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:54:"https://msdn.microsoft.com/en-us/library/cc230366.aspx";i:1;N;}i:2;i:12640;}i:111;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12698;}i:112;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12698;}i:113;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:12700;}i:114;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"DACL";}i:2;i:12702;}i:115;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:12706;}i:116;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:12708;}i:117;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12714;}i:118;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:116:"
typedef struct _ACL {
  BYTE AclRevision;
  BYTE Sbz1;
  WORD AclSize;
  WORD AceCount;
  WORD Sbz2;
} ACL, *PACL;
";i:1;N;i:2;N;}i:2;i:12714;}i:119;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12714;}i:120;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:79:"https://msdn.microsoft.com/en-us/library/windows/desktop/aa374931(v=vs.85).aspx";i:1;N;}i:2;i:12839;}i:121;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12922;}i:122;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12922;}i:123;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:12924;}i:124;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"ACE";}i:2;i:12926;}i:125;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:12929;}i:126;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:12931;}i:127;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12937;}i:128;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:107:"
typedef struct _ACE_HEADER {
  BYTE AceType;
  BYTE AceFlags;
  WORD AceSize;
} ACE_HEADER, *PACE_HEADER;
";i:1;N;i:2;N;}i:2;i:12937;}i:129;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12937;}i:130;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:13054;}i:131;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"ACCESS MASK";}i:2;i:13056;}i:132;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:13067;}i:133;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13069;}i:134;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:13069;}i:135;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13069;}i:136;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13069;}i:137;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:" Control the access permission of a file.";}i:2;i:13073;}i:138;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:13114;}i:139;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:13114;}i:140;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:13114;}i:141;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13114;}i:142;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:54:"https://msdn.microsoft.com/en-us/library/cc230294.aspx";i:1;N;}i:2;i:13115;}i:143;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13173;}i:144;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13173;}i:145;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:13175;}i:146;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"Example of Security Descriptor";}i:2;i:13177;}i:147;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:13207;}i:148;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:13209;}i:149;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13215;}i:150;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:5431:"
    security_descriptor: struct security_descriptor
        revision                 : SECURITY_DESCRIPTOR_REVISION_1 (1)
        type                     : 0x8c04 (35844)
               0: SEC_DESC_OWNER_DEFAULTED
               0: SEC_DESC_GROUP_DEFAULTED
               1: SEC_DESC_DACL_PRESENT
               0: SEC_DESC_DACL_DEFAULTED
               0: SEC_DESC_SACL_PRESENT
               0: SEC_DESC_SACL_DEFAULTED
               0: SEC_DESC_DACL_TRUSTED
               0: SEC_DESC_SERVER_SECURITY
               0: SEC_DESC_DACL_AUTO_INHERIT_REQ
               0: SEC_DESC_SACL_AUTO_INHERIT_REQ
               1: SEC_DESC_DACL_AUTO_INHERITED
               1: SEC_DESC_SACL_AUTO_INHERITED
               0: SEC_DESC_DACL_PROTECTED
               0: SEC_DESC_SACL_PROTECTED
               0: SEC_DESC_RM_CONTROL_VALID
               1: SEC_DESC_SELF_RELATIVE
        owner_sid                : *
            owner_sid                : S-1-5-21-3863028735-649080503-733086412-1000
        group_sid                : *
            group_sid                : S-1-5-21-3863028735-649080503-733086412-513
        sacl                     : NULL
        dacl                     : *
            dacl: struct security_acl
                revision                 : SECURITY_ACL_REVISION_NT4 (2)
                size                     : 0x0078 (120)
                num_aces                 : 0x00000004 (4)
                aces: ARRAY(4)
                    aces: struct security_ace
                        type                     : SEC_ACE_TYPE_ACCESS_DENIED (1)
                        flags                    : 0x00 (0)
                               0: SEC_ACE_FLAG_OBJECT_INHERIT
                               0: SEC_ACE_FLAG_CONTAINER_INHERIT
                               0: SEC_ACE_FLAG_NO_PROPAGATE_INHERIT
                               0: SEC_ACE_FLAG_INHERIT_ONLY
                               0: SEC_ACE_FLAG_INHERITED_ACE
                            0x00: SEC_ACE_FLAG_VALID_INHERIT (0)
                               0: SEC_ACE_FLAG_SUCCESSFUL_ACCESS
                               0: SEC_ACE_FLAG_FAILED_ACCESS
                        size                     : 0x0014 (20)
                        access_mask              : 0x000f011e (983326)
                        object                   : union security_ace_object_ctr(case 1)
                        trustee                  : S-1-1-0
                    aces: struct security_ace
                        type                     : SEC_ACE_TYPE_ACCESS_ALLOWED (0)
                        flags                    : 0x10 (16)
                               0: SEC_ACE_FLAG_OBJECT_INHERIT
                               0: SEC_ACE_FLAG_CONTAINER_INHERIT
                               0: SEC_ACE_FLAG_NO_PROPAGATE_INHERIT
                               0: SEC_ACE_FLAG_INHERIT_ONLY
                               1: SEC_ACE_FLAG_INHERITED_ACE
                            0x00: SEC_ACE_FLAG_VALID_INHERIT (0)
                               0: SEC_ACE_FLAG_SUCCESSFUL_ACCESS
                               0: SEC_ACE_FLAG_FAILED_ACCESS
                        size                     : 0x0024 (36)
                        access_mask              : 0x001f01ff (2032127)
                        object                   : union security_ace_object_ctr(case 0)
                        trustee                  : S-1-5-21-3863028735-649080503-733086412-1000
                    aces: struct security_ace
                        type                     : SEC_ACE_TYPE_ACCESS_ALLOWED (0)
                        flags                    : 0x10 (16)
                               0: SEC_ACE_FLAG_OBJECT_INHERIT
                               0: SEC_ACE_FLAG_CONTAINER_INHERIT
                               0: SEC_ACE_FLAG_NO_PROPAGATE_INHERIT
                               0: SEC_ACE_FLAG_INHERIT_ONLY
                               1: SEC_ACE_FLAG_INHERITED_ACE
                            0x00: SEC_ACE_FLAG_VALID_INHERIT (0)
                               0: SEC_ACE_FLAG_SUCCESSFUL_ACCESS
                               0: SEC_ACE_FLAG_FAILED_ACCESS
                        size                     : 0x0024 (36)
                        access_mask              : 0x001200a9 (1179817)
                        object                   : union security_ace_object_ctr(case 0)
                        trustee                  : S-1-5-21-3863028735-649080503-733086412-513
                    aces: struct security_ace
                        type                     : SEC_ACE_TYPE_ACCESS_ALLOWED (0)
                        flags                    : 0x10 (16)
                               0: SEC_ACE_FLAG_OBJECT_INHERIT
                               0: SEC_ACE_FLAG_CONTAINER_INHERIT
                               0: SEC_ACE_FLAG_NO_PROPAGATE_INHERIT
                               0: SEC_ACE_FLAG_INHERIT_ONLY
                               1: SEC_ACE_FLAG_INHERITED_ACE
                            0x00: SEC_ACE_FLAG_VALID_INHERIT (0)
                               0: SEC_ACE_FLAG_SUCCESSFUL_ACCESS
                               0: SEC_ACE_FLAG_FAILED_ACCESS
                        size                     : 0x0014 (20)
                        access_mask              : 0x001200a9 (1179817)
                        object                   : union security_ace_object_ctr(case 0)
                        trustee                  : S-1-1-0
";i:1;N;i:2;N;}i:2;i:13215;}i:151;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:316:"
Their are two kinds of acl in samba file:
security.NTACL and system.posix_acl_access

Get value of acl:
getfattr -n system.posix_acl_access iptbl_routing_tmp
getfattr -n security.NTACL iptbl_routing_tmp

Remove attribute
getfattr -x system.posix_acl iptbl_routing_tmp
setfattr -x security.NTACL  iptbl_routing_tmp

";i:1;N;i:2;N;}i:2;i:18660;}i:152;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18660;}i:153;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:18986;}i:154;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:" python xattr ";}i:2;i:18988;}i:155;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:19002;}i:156;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:19004;}i:157;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19010;}i:158;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1777:"
>>> import xattr
>>> xattr.listxattr("file.txt")
['user.mime_type']
>>> xattr.getxattr("file.txt", "user.mime_type")
'text/plain'
>>> xattr.setxattr("file.txt", "user.comment", "Simple text file")
>>> xattr.listxattr("file.txt")
['user.mime_type', 'user.comment']
>>> xattr.removexattr ("file.txt", "user.comment")

>>> import xattr
>>> xattr.listxattr("iptbl_routing_tmp")
(u'trusted.SGI_ACL_FILE', u'security.NTACL', u'system.posix_acl_access')
>>> xattr.getxattr("/tmp/aaa.txt", "security.NTACL")
'\x04\x00\x04\x00\x00\x00\x02\x00\x04\x00\x02\x00\x01\x00\xc3\xa9x\x96L\xd3{\x9b\xa6\x8a\x9e\x97\xf2\xb2\xf5\x83\xcb\x93\xc2\x8d\xc8\xcc9\xa5\xc8\x89\xa4#\xee\xce\x14\xc4\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00posix_acl\x00d\xbf\xfe]\xf0j\xd2\x01\x8e\xc4 \xd8Zlu.\xa0\xdc\xe5\x05\xe8\x93\x93\xc3\xe7\\e\xd0\xdf\xc9(V\xc4\xabT\xc7\xb2\x93>\x0c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x04\x8c\xb4\x00\x00\x00\xd0\x00\x00\x00\x00\x00\x00\x00\xec\x00\x00\x00\x01\x05\x00\x00\x00\x00\x00\x05\x15\x00\x00\x00\xff#A\xe6\xb7.\xb0&\xcc\x02\xb2+\xe8\x03\x00\x00\x01\x05\x00\x00\x00\x00\x00\x05\x15\x00\x00\x00\xff#A\xe6\xb7.\xb0&\xcc\x02\xb2+\x01\x02\x00\x00\x02\x00x\x00\x04\x00\x00\x00\x01\x00\x14\x00\x1e\x01\x0f\x00\x01\x01\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x10$\x00\xff\x01\x1f\x00\x01\x05\x00\x00\x00\x00\x00\x05\x15\x00\x00\x00\xff#A\xe6\xb7.\xb0&\xcc\x02\xb2+\xe8\x03\x00\x00\x00\x10$\x00\xa9\x00\x12\x00\x01\x05\x00\x00\x00\x00\x00\x05\x15\x00\x00\x00\xff#A\xe6\xb7.\xb0&\xcc\x02\xb2+\x01\x02\x00\x00\x00\x10\x14\x00\xa9\x00\x12\x00\x01\x01\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00'

";i:1;N;i:2;N;}i:2;i:19010;}i:159;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19010;}i:160;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:36:"http://pyxattr.k1024.org/module.html";i:1;N;}i:2;i:20796;}i:161;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20836;}i:162;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20836;}i:163;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:20838;}i:164;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"getfattr";}i:2;i:20840;}i:165;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:20848;}i:166;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:20850;}i:167;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20856;}i:168;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:679:"
[root@nas_8739448_a tmp]# getfattr -n security.NTACL iptbl_routing_tmp
# file: iptbl_routing_tmp
security.NTACL=0sBAAEAAAAAgAEAAIAAQCgPPxFRKKf60tg7eMr3o2YCABj0ryLFTbz/WLezJUMOwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAcG9zaXhfYWNsAOY0mev7Z9IB5zfZZ+WOJ9bNEn25ikX0nyceXW1OjYfXDcDf4n7o+hYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEABJy0AAAA0AAAAAAAAADgAAAAAQUAAAAAAAUVAAAArKysrKysrKysrKys6AMAAAECAAAAAAAWAgAAAAAAAAACAFgAAwAAAAAAJACfAR8AAQUAAAAAAAUVAAAArKysrKysrKysrKys6AMAAAAAGACJABIAAQIAAAAAABYCAAAAAAAAAAAAFACfAR8AAQEAAAAAAAEAAAAA

(that this attribute is not shown by the getfattr -d filename, it can only be retreived by naming it as in: getfattr -n security.NTACL filename.)
";i:1;N;i:2;N;}i:2;i:20856;}i:169;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20856;}i:170;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:68:"https://www.samba.org/samba/docs/man/manpages-3/vfs_acl_xattr.8.html";i:1;N;}i:2;i:21544;}i:171;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:21616;}i:172;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21622;}i:173;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:213:"
root@nas_8739448_a tmp]# getfattr -n system.posix_acl_access iptbl_routing_tmp
# file: iptbl_routing_tmp
system.posix_acl_access=0sAgAAAAEABwD/////AgAHAAAAAAACAAYANwAAAAQABAD/////CAAEAAAAAAAQAAcA/////yAABwD/////
";i:1;N;i:2;N;}i:2;i:21622;}i:174;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21622;}i:175;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:21845;}i:176;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"attr";}i:2;i:21847;}i:177;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:21851;}i:178;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:21853;}i:179;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21859;}i:180;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:181:"
[root@nas_8739448_a tmp]# attr -l iptbl_routing_tmp
Attribute "SGI_ACL_FILE" has a 76 byte value for iptbl_routing_tmp
Attribute "NTACL" has a 312 byte value for iptbl_routing_tmp
";i:1;N;i:2;N;}i:2;i:21859;}i:181;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:76:"
[root@nas_8739448_a tmp]# attr -l -q  iptbl_routing_tmp
SGI_ACL_FILE
NTACL
";i:1;N;i:2;N;}i:2;i:22054;}i:182;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:140:"
[root@nas_8739448_a tmp]# attr -Rqg SGI_ACL_FILE iptbl_routing_tmp
▒▒▒▒▒▒▒▒▒▒▒ ▒▒▒▒[root@nas_8739448_a tmp]#
";i:1;N;i:2;N;}i:2;i:22144;}i:183;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22144;}i:184;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:22294;}i:185;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"ntacls.py";}i:2;i:22296;}i:186;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:22305;}i:187;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:22307;}i:188;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22307;}i:189;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:22307;}i:190;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:22307;}}