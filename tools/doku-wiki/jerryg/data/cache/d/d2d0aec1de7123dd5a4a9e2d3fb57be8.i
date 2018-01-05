a:59:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"FAQ";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:6;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:8;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:4585:"
Q7 : 在load parameter時,會發生segmentation fault?
Ans :
花了不少時間進行確認, 看了4.2.3與4.4在load parameter時的code都相同.
--> 最後看到是pytalloc中的pytalloc_steal code有所不一樣. (pytalloc 2.1.2 and pytalloc 2.1.9)
--> 兩邊python所得到的pyObject size也不相同. (.__sizeof__())

試著裝了libtalloc 2.1.6 與pytalloc 2.1.6進行測試 --> 結果ok.
1. pytalloc 2.1.6
--> http://rpm.pbone.net/index.php3/stat/4/idpl/35491718/dir/centos_7/com/pytalloc-2.1.6-1.el7.x86_64.rpm.html

2. libtalloc 2.1.6
--> http://rpm.pbone.net/index.php3/stat/4/idpl/35045440/dir/scientific_linux_7/com/libtalloc-2.1.6-1.el7.x86_64.rpm.html

3. install from rpm
rpm -ivh --force <package name>

Reference:
1. What is pyalloc?
--> https://download.samba.org/pub/unpacked/talloc/pytalloc_guide.txt

2. Build Samba from source
--> https://wiki.samba.org/index.php/Build_Samba_from_Source


Q6 : get_acl.py for samba ntacl
Ans :
The code segment below can work fine in my machine, but it will segmentation fault in GS.

from samba.samba3 import param as s3param
from samba.dcerpc import security
from samba.samba3 import smbd

s3conf = s3param.get_context()
s3conf.load("/etc/samba/smb.conf")

raw_input()
print smbd.get_nt_acl("/tmp/abcd/f2", security.SECINFO_OWNER | security.SECINFO_GROUP | security.SECINFO_DACL | security.SECINFO_SACL, service=None)
--- The code ---


#flow
lpcfg_load --> 

Q5 : flow of get_nt_acl?
Ans :
若使用以下的code進行測試, 會發生fail:
mkdir failed on directory : No such file or directory
No builtin nor plugin backend for  found
PANIC: pdb_get_methods: failed to get pdb methods for backend

--- code ---
from samba.dcerpc import security
from samba.samba3 import smbd
raw_input()
smbd.get_nt_acl("/tmp/abcd/f2", security.SECINFO_OWNER | security.SECINFO_GROUP | security.SECINFO_DACL | security.SECINFO_SACL, service=None)
--- code ---

這是因為沒有load parameter, 導致執行lp_profile_acls()時會fail.

# flow
get_nt_acl_conn --> vfswrap_get_nt_acl --> posix_get_nt_acl --> posix_get_nt_acl_common --> lp_profile_acls

Q4 : import error for "from samba.samba3 import smbd"
Traceback (most recent call last):
  File "smb-ntacl.py", line 2, in <module>
    from samba.netcmd.ntacl import cmd_ntacl_get
  File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line 22, in <module>
    from samba.ntacls import setntacl, getntacl
  File "/usr/lib64/python2.7/site-packages/samba/ntacls.py", line 26, in <module>
    from samba.samba3 import smbd
ImportError: /usr/lib64/samba/libgse-samba4.so: symbol krb5_get_init_creds_opt_set_pac_request, version krb5_3_MIT not defined in file libkrb5.so.3 with link time reference

Ans : 
krb5-libs.x86_64的version為1.13, 最新為1.15
--> yum update krb5-libs.x86_64

Q3 : import error for xattr_native
Traceback (most recent call last):
  File "smb-ntacl.py", line 2, in <module>
    from samba.netcmd.ntacl import cmd_ntacl_get
  File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line 22, in <module>
    from samba.ntacls import setntacl, getntacl
  File "/usr/lib64/python2.7/site-packages/samba/ntacls.py", line 23, in <module>
    import samba.xattr_native, samba.xattr_tdb, samba.posix_eadb
ImportError: No module named xattr_native

Ans :
--> 註解掉 import samba.xattr_native, samba.xattr_tdb, samba.posix_eadb

Q2 : import ldb error
[root@nas_8716691_a samba-tool]# python smb-ntacl.py ntacl_get /Pool-1/Volume_1/d1/file1
Traceback (most recent call last):
  File "smb-ntacl.py", line 2, in <module>
    from samba.netcmd.ntacl import cmd_ntacl_get
  File "/usr/lib64/python2.7/site-packages/samba/__init__.py", line 49, in <module>
    import ldb
ImportError: No module named ldb

Ans :
缺少 ldb module.
--> yum install pyldb

Q1 : import error in gs
[root@nas_8716691_a samba-tool]# python smb-ntacl.py ntacl_get /Pool-1/Volume_1/d1/file1
Traceback (most recent call last):
  File "smb-ntacl.py", line 2, in <module>
    from samba.netcmd.ntacl import cmd_ntacl_get
  File "/usr/lib64/python2.7/site-packages/samba/__init__.py", line 27, in <module>
    import samba.param
ImportError: /lib64/libpytalloc-util.so.2: version `PYTALLOC_UTIL_2.1.6' not found (required by /usr/lib64/python2.7/site-packages/samba/param.so)

Ans : 
[root@nas_8716691_a samba-tool]# strings /usr/lib64/python2.7/site-packages/samba/param.so | grep 2.1.6
PYTALLOC_UTIL_2.1.6
所以要支援param.so, 至少需要PYTALLOC_UTIL_2.1.6, 但目前GS的版本只在2.1.2
目前的pytalloc為2.1.9, 所以直接進行update即可.
--> yum update pytalloc


";i:1;N;i:2;N;}i:2;i:14;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14;}i:9;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4609;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Summary";}i:2;i:4611;}i:11;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:4618;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:4620;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4626;}i:14;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1029:"
# getntacl and setntacl script
from samba.samba3 import param as s3param
from samba.dcerpc import security
from samba.samba3 import smbd


def getntacl():
        s3conf = s3param.get_context()
        s3conf.load("/etc/samba/smb.conf")

        acl = smbd.get_nt_acl("/Pool-1/Volume_1/d12/file1.txt", security.SECINFO_OWNER | security.SECINFO_GROUP | security.SECINFO_DACL | security.SECINFO_SACL, service=None)
        print acl.as_sddl()
        return acl.as_sddl()

def setntacl(sddl):
        sd = security.descriptor.from_sddl(sddl, security.dom_sid())
        print sd
        s3conf = s3param.get_context()
        s3conf.load("/etc/samba/smb.conf")

        smbd.set_nt_acl("/Pool-1/Volume_1/d12/file2.txt", security.SECINFO_OWNER | security.SECINFO_GROUP | security.SECINFO_DACL | security.SECINFO_SACL, sd, service = None)

sddl = getntacl()
setntacl(sddl)

# Requirement for porting to GS
1. rpm -ivh --force libtalloc-2.1.6-1.el7.x86_64.rpm
2. rpm -ivh --force pytalloc-2.1.6-1.el7.x86_64.rpm
3. yum install pyldb
";i:1;N;i:2;N;}i:2;i:4626;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4626;}i:16;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:5665;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:" requirement ";}i:2;i:5667;}i:18;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:5680;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5682;}i:20;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:5682;}i:21;a:3:{i:0;s:13:"listitem_open";i:1;a:2:{i:0;i:1;i:1;i:1;}i:2;i:5682;}i:22;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5682;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:" mark #import samba.xattr_native, samba.xattr_tdb, samba.posix_eadb";}i:2;i:5686;}i:24;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5753;}i:25;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:5753;}i:26;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:2;}i:2;i:5753;}i:27;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5753;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:" /usr/lib64/python2.7/site-packages/samba/ntacls.py";}i:2;i:5759;}i:29;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5810;}i:30;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5810;}i:31;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:5810;}i:32;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5810;}i:33;a:3:{i:0;s:13:"listitem_open";i:1;a:2:{i:0;i:1;i:1;i:1;}i:2;i:5810;}i:34;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5810;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" replace ";}i:2;i:5814;}i:36;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:5823;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"tdbsam";}i:2;i:5824;}i:38;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5830;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:" with ";}i:2;i:5831;}i:40;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:5837;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"samba_dsdb";}i:2;i:5838;}i:42;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5848;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:" when setting ntacl (optional?)";}i:2;i:5849;}i:44;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5880;}i:45;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:5880;}i:46;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:2;}i:2;i:5880;}i:47;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5880;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:" /usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py";}i:2;i:5886;}i:49;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5943;}i:50;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5943;}i:51;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:5943;}i:52;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5943;}i:53;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:5943;}i:54;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"Basic commands";i:1;i:1;i:2;i:5945;}i:2;i:5945;}i:55;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:5945;}i:56;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1075:"
# dump all extended attribute
1. getfattr --dump filename 
--> only to dumps the user.*

2. getfattr -d -m "" /Pool-1/Volume_1/d1/file1

3. xattr in python
[root@nas_8716691_a ~]# function geteas() { echo -e "import xattr\nes = xattr.xattr('$1').list()\nprint es\n" | python; }
[root@nas_8716691_a ~]# geteas /Pool-1/Volume_1/d1/file1
[u'user.DOSATTRIB', u'trusted.SGI_ACL_FILE', u'security.NTACL', u'system.posix_acl_access']
[root@nas_8716691_a ~]# geteas "/Pool-1/Volume_1/d1/file 1"
[u'user.DOSATTRIB', u'trusted.SGI_ACL_FILE', u'security.NTACL', u'system.posix_acl_access']

# get ntacl from file
[root@nas_824366_a ~]# ./samba-tool ntacl get /tmp/user.ldif --as-sddl
O:S-1-5-21-2896997548-2896997548-2896997548-1003G:BAD:(A;;0x001f019f;;;S-1-5-21-2896997548-2896997548-2896997548-1003)(A;;0x00120089;;;BA)(A;;0x00120089;;;WD)

# set ntacl to file
[root@nas_824366_a ~]# ./samba-tool ntacl set "O:S-1-5-21-2896997548-2896997548-2896997548-1003G:BAD:(A;;0x001f019f;;;S-1-5-21-2896997548-2896997548-2896997548-1003)(A;;0x00120089;;;BA)(A;;0x00120089;;;WD)" /tmp/test.txt
";i:1;N;i:2;N;}i:2;i:5979;}i:57;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7062;}i:58;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:7062;}}