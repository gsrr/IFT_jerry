a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:10878:"
INFO: Current debug levels:
  all: 10
  tdb: 10
  printdrivers: 10
  lanman: 10
  smb: 10
  rpc_parse: 10
  rpc_srv: 10
  rpc_cli: 10
  passdb: 10
  sam: 10
  auth: 10
  winbind: 10
  vfs: 10
  idmap: 10
  quota: 10
  acls: 10
  locking: 10
  msdfs: 10
  dmapi: 10
  registry: 10
  scavenger: 10
  dns: 10
  ldb: 10
doing parameter map acl inherit = No
doing parameter multicast dns register = no
doing parameter netbios name = TEST
doing parameter nfs4:acedup = merge
doing parameter nfs4:mode = special
doing parameter passdb backend = ldapsam:ldap://172.27.112.241
doing parameter posix locking = no
doing parameter printcap name = /dev/null
doing parameter printing = bsd
doing parameter smb2 max credits = 32768
doing parameter store dos attributes = yes
doing parameter template shell = /bin/nassh
doing parameter use client driver = yes
doing parameter vfs objects = /usr/lib64/samba/vfs/acl_xattr.so
doing parameter winbind enum groups = yes
doing parameter winbind enum users = yes
doing parameter winbind expand groups = 1
doing parameter winbind nss info = rfc2307
doing parameter winbind refresh tickets = true
doing parameter winbind request timeout = 60
doing parameter winbind trusted domains only = no
doing parameter winbind use default domain = no
doing parameter wins server =
doing parameter workgroup = Workgroup
pm_process() returned Yes
lp_servicenumber: couldn't find homes
Netbios name list:-
my_netbios_names[0]="TEST"
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
vnn pid 4447 = 0
Registering messaging pointer for type 2 - private_data=(nil)
Registering messaging pointer for type 9 - private_data=(nil)
Registered MSG_REQ_POOL_USAGE
Registering messaging pointer for type 11 - private_data=(nil)
Registering messaging pointer for type 12 - private_data=(nil)
Registered MSG_REQ_DMALLOC_MARK and LOG_CHANGED
Registering messaging pointer for type 1 - private_data=(nil)
Registering messaging pointer for type 5 - private_data=(nil)
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
db_open_ctdb: opened database 'g_lock.tdb' with dbid 0x4d2a432b
db_open_ctdb: opened database 'secrets.tdb' with dbid 0x7132c184
Attempting to find a passdb backend to match ldapsam:ldap://172.27.112.241 (ldapsam)
No builtin backend found, trying to load plugin
Probing module 'ldapsam'
Probing module 'ldapsam': Trying to load from /usr/lib64/samba/pdb/ldapsam.so
Module 'ldapsam' loaded
Attempting to register passdb backend ldapsam
Successfully added passdb backend 'ldapsam'
Attempting to register passdb backend NDS_ldapsam
Successfully added passdb backend 'NDS_ldapsam'
Attempting to register passdb backend IPA_ldapsam
Successfully added passdb backend 'IPA_ldapsam'
Found pdb backend ldapsam
smbldap_search_domain_info: Searching for:[(&(objectClass=sambaDomain)(sambaDomainName=TEST))]
smbldap_search_ext: base => [dc=test,dc=ift,dc=com], filter => [(&(objectClass=sambaDomain)(sambaDomainName=TEST))], scope => [2]
The connection to the LDAP server was closed
smb_ldap_setup_connection: ldap://172.27.112.241
smbldap_open_connection: connection opened
ldap_connect_system: Binding to ldap server ldap://172.27.112.241 as "uid=root,cn=users,dc=test,dc=ift,dc=com"
ldap_connect_system: successful connection to the LDAP server
ldap_connect_system: LDAP server does support paged results
The LDAP server is successfully connected
pdb backend ldapsam:ldap://172.27.112.241 has a valid init
check lock order 2 for g_lock.tdb
lock order:  1:<none> 2:g_lock.tdb 3:<none>
Locking db 1294615339 key 7472616E73616374696F
ctdb_data.dptr = (nil), dmaster = 4294967295 (0) 0
ctdbd_migrate: Sending ctdb packet
Locking db 1294615339 key 7472616E73616374696F
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
ctdbd_control: Sending ctdb packet
db_open_ctdb: opened database 'dbwrap_watchers.tdb' with dbid 0x6afb8c09
Unlocking db 1294615339 key 7472616E73616374696F
release lock order 2 for g_lock.tdb
lock order:  1:<none> 2:<none> 3:<none>
../source3/lib/dbwrap/dbwrap_ctdb.c:364 transaction started on db 0x7132c184
check lock order 2 for g_lock.tdb
lock order:  1:<none> 2:g_lock.tdb 3:<none>
Locking db 1294615339 key 7472616E73616374696F
ctdbd_control: Sending ctdb packet
Unlocking db 1294615339 key 7472616E73616374696F
release lock order 2 for g_lock.tdb
lock order:  1:<none> 2:<none> 3:<none>
smbldap_search_ext: base => [dc=test,dc=ift,dc=com], filter => [(&(uid=nas_smb006)(objectclass=sambaSamAccount))], scope => [2]
ldapsam_getsampwnam: Unable to locate user [nas_smb006] count=0
Finding user nas_smb006
Trying _Get_Pwnam(), username as lowercase is nas_smb006
Get_Pwnam_internals did find user [nas_smb006]!
pdb_set_username: setting username nas_smb006, was
pdb_set_full_name: setting full name , was
pdb_set_domain: setting domain TEST, was
Home server: test
pdb_set_profile_path: setting profile path \\test\nas_smb006\profile, was
Home server: test
pdb_set_homedir: setting home dir \\test\nas_smb006, was
pdb_set_dir_drive: setting dir drive , was NULL
pdb_set_logon_script: setting logon script , was
smbldap_search_domain_info: Searching for:[(&(objectClass=sambaDomain)(sambaDomainName=TEST))]
smbldap_search_ext: base => [dc=test,dc=ift,dc=com], filter => [(&(objectClass=sambaDomain)(sambaDomainName=TEST))], scope => [2]
attribute sambaNextGroupRid does not exist
smbldap_make_mod: deleting attribute |sambaNextRid| values |1012|
smbldap_make_mod: adding attribute |sambaNextRid| value |1013|
smbldap_modify: dn => [sambaDomainName=test,dc=test,dc=ift,dc=com]
pdb_set_user_sid: setting user sid S-1-5-21-4106897981-1158876546-2369908411-1013
pdb_set_username: setting username nas_smb006, was nas_smb006
smbldap_search_ext: base => [dc=test,dc=ift,dc=com], filter => [(&(uid=nas_smb006)(objectclass=sambaSamAccount))], scope => [2]
smbldap_search_ext: base => [dc=test,dc=ift,dc=com], filter => [(&(sambaSID=S-1-5-21-4106897981-1158876546-2369908411-1013)(objectclass=sambaSamAccount))], scope => [2]
smbldap_search_ext: base => [dc=test,dc=ift,dc=com], filter => [(uid=nas_smb006)], scope => [2]
smbldap_search_ext: base => [dc=test,dc=ift,dc=com], filter => [(&(sambaSID=S-1-5-21-4106897981-1158876546-2369908411-1013)(|(objectClass=sambaIdmapEntry)(objectClass=sambaSidEntry)))], scope => [2]
ldapsam_add_sam_account: Adding new user
smbldap_make_mod: adding attribute |uid| value |nas_smb006|
init_ldap_from_sam: Setting entry for user: nas_smb006
smbldap_make_mod: adding attribute |sambaSID| value |S-1-5-21-4106897981-1158876546-2369908411-1013|
smbldap_make_mod: adding attribute |sambaAcctFlags| value |[DU         ]|
smbldap_add: dn => [uid=nas_smb006,cn=Users,dc=test,dc=ift,dc=com]
ldapsam_add_sam_account: added: uid == nas_smb006 in the LDAP database
smbldap_search_ext: base => [dc=test,dc=ift,dc=com], filter => [(&(uid=nas_smb006)(objectclass=sambaSamAccount))], scope => [2]
init_sam_from_ldap: Entry found for user: nas_smb006
pdb_set_username: setting username nas_smb006, was
pdb_set_domain: setting domain TEST, was
pdb_set_nt_username: setting nt username nas_smb006, was
pdb_set_user_sid_from_string: setting user sid S-1-5-21-4106897981-1158876546-2369908411-1013
pdb_set_user_sid: setting user sid S-1-5-21-4106897981-1158876546-2369908411-1013
attribute sambaPwdLastSet does not exist
attribute sambaLogonTime does not exist
attribute sambaLogoffTime does not exist
attribute sambaKickoffTime does not exist
attribute sambaPwdCanChange does not exist
attribute displayName does not exist
attribute cn does not exist
attribute sambaHomeDrive does not exist
pdb_set_dir_drive: setting dir drive , was NULL
attribute sambaHomePath does not exist
Home server: test
pdb_set_homedir: setting home dir \\test\nas_smb006, was
attribute sambaLogonScript does not exist
pdb_set_logon_script: setting logon script , was
attribute sambaProfilePath does not exist
Home server: test
pdb_set_profile_path: setting profile path \\test\nas_smb006\profile, was
attribute description does not exist
attribute sambaUserWorkstations does not exist
attribute sambaMungedDial does not exist
attribute sambaLMPassword does not exist
attribute sambaNTPassword does not exist
Opening cache file at /var/lib/samba/gencache.tdb
Opening cache file at /var/lib/samba/gencache_notrans.tdb
attribute sambaBadPasswordCount does not exist
attribute sambaBadPasswordTime does not exist
attribute sambaLogonHours does not exist
Opening cache file at /var/lib/samba/login_cache.tdb
Looking up login cache for user nas_smb006
No cache entry found
No cache entry, bad count = 0, bad time = 0
Finding user nas_smb006
Trying _Get_Pwnam(), username as lowercase is nas_smb006
Get_Pwnam_internals did find user [nas_smb006]!
gid_to_sid: winbind failed to find a sid for gid 1003
smbldap_search_ext: base => [dc=test,dc=ift,dc=com], filter => [(&(objectClass=sambaGroupMapping)(gidNumber=1003))], scope => [2]
ldapsam_getgroup: Did not find group, filter was (&(objectClass=sambaGroupMapping)(gidNumber=1003))
LEGACY: gid 1003 -> sid S-1-22-2-1003
smbldap_search_ext: base => [dc=test,dc=ift,dc=com], filter => [(&(objectClass=sambaGroupMapping)(gidNumber=1003))], scope => [2]
ldapsam_getgroup: Did not find group, filter was (&(objectClass=sambaGroupMapping)(gidNumber=1003))
Forcing Primary Group to 'Domain Users' for nas_smb006
pdb_set_username: setting username nas_smb006, was
pdb_set_domain: setting domain TEST, was
pdb_set_nt_username: setting nt username nas_smb006, was
pdb_set_full_name: setting full name , was
Home server: test
pdb_set_homedir: setting home dir \\test\nas_smb006, was
pdb_set_dir_drive: setting dir drive , was NULL
pdb_set_logon_script: setting logon script , was
Home server: test
pdb_set_profile_path: setting profile path \\test\nas_smb006\profile, was
pdb_set_workstations: setting workstations , was
pdb_set_user_sid: setting user sid S-1-5-21-4106897981-1158876546-2369908411-1013
pdb_set_user_sid_from_rid:
        setting user sid S-1-5-21-4106897981-1158876546-2369908411-1013 from rid 1013
pdb_set_group_sid: setting group sid S-1-5-21-4106897981-1158876546-2369908411-513
ldapsam_update_sam_account: user nas_smb006 to be modified has dn: uid=nas_smb006,cn=users,dc=test,dc=ift,dc=com
init_ldap_from_sam: Setting entry for user: nas_smb006
smbldap_make_mod: deleting attribute |sambaAcctFlags| values |[DU         ]|
smbldap_make_mod: adding attribute |sambaAcctFlags| value |[NDU        ]|
smbldap_modify: dn => [uid=nas_smb006,cn=users,dc=test,dc=ift,dc=com]
ldapsam_update_sam_account: successfully modified uid = nas_smb006 in the LDAP database
Added user nas_smb006.
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}