a:83:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"[Note]";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13;}i:4;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:106:"
[Get_Pwnam_alloc]
[pdb_getsampwnam]
struct pdb_methods *pdb = pdb_get_methods();
[make_pdb_method_name]

";i:1;N;i:2;N;}i:2;i:13;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"[ldap user - stack]";}i:2;i:128;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:153;}i:8;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:4552:"
#0  ldapsam_getsampwnam (my_methods=0x7fd737a96ce0, user=0x7fd737a8de70, sname=0x7fd737ac6870 "test001@test.ift.com") at ../source3/passdb/pdb_ldap.c:1472
#1  0x00007fd734d24fbd in pdb_getsampwnam (sam_acct=sam_acct@entry=0x7fd737a8de70, username=0x7fd737ac6870 "test001@test.ift.com")
    at ../source3/passdb/pdb_interface.c:334
#2  0x00007fd7348ed576 in check_sam_security (challenge=challenge@entry=0x7fd737ab98d0, mem_ctx=mem_ctx@entry=0x7fd737ab3380,
    user_info=user_info@entry=0x7fd737ac6710, server_info=server_info@entry=0x7ffdded3f0b8) at ../source3/auth/check_samsec.c:395
#3  0x00007fd7348e1bb1 in auth_samstrict_auth (auth_context=0x7fd737ab98d0, my_private_data=<optimized out>, mem_ctx=0x7fd737ab3380,
    user_info=0x7fd737ac6710, server_info=<optimized out>) at ../source3/auth/auth_sam.c:102
#4  0x00007fd7348e5f2a in auth_check_ntlm_password (mem_ctx=mem_ctx@entry=0x7fd737ab9f90, auth_context=auth_context@entry=0x7fd737ab98d0,
    user_info=0x7fd737ac6710, pserver_info=pserver_info@entry=0x7ffdded3f168) at ../source3/auth/auth.c:225
#5  0x00007fd7348e78e7 in auth3_check_password (auth4_context=<optimized out>, mem_ctx=0x7fd737ab9f90, user_info=0x7fd737abba50,
    server_returned_info=0x7fd737ab9f90, session_key=0x7fd737ab3240, lm_session_key=0x7fd737ab3250) at ../source3/auth/auth_ntlmssp.c:179
#6  0x00007fd72ef2dedd in ntlmssp_server_check_password (lm_session_key=0x7fd737ab3250, user_session_key=0x7fd737ab3240, mem_ctx=0x7fd737ab3240,
    gensec_ntlmssp=0x7fd737ab9f90, gensec_security=0x7fd737aba330) at ../auth/ntlmssp/ntlmssp_server.c:729
#7  gensec_ntlmssp_server_auth (gensec_security=0x7fd737aba330, out_mem_ctx=<optimized out>, in=..., out=<optimized out>)
    at ../auth/ntlmssp/ntlmssp_server.c:1014
#8  0x00007fd72ef29713 in gensec_ntlmssp_update (gensec_security=0x7fd737aba330, out_mem_ctx=0x7fd737aaaf10, ev=<optimized out>, input=...,
    out=0x7ffdded3f450) at ../auth/ntlmssp/ntlmssp.c:176
#9  0x00007fd72ef311c0 in gensec_update_ev (gensec_security=0x7fd737aba330, out_mem_ctx=out_mem_ctx@entry=0x7fd737aaaf10, ev=ev@entry=0x7fd737a8e4e0,
    in=..., out=out@entry=0x7ffdded3f450) at ../auth/gensec/gensec.c:303
#10 0x00007fd72ef2617e in gensec_spnego_update (gensec_security=gensec_security@entry=0x7fd737ab30c0, out_mem_ctx=out_mem_ctx@entry=0x7fd737aaaf10,
    ev=ev@entry=0x7fd737a8e4e0, in=..., out=out@entry=0x7fd737aaaf70) at ../auth/gensec/spnego.c:963
#11 0x00007fd72ef27580 in gensec_spnego_update_wrapper (gensec_security=0x7fd737ab30c0, out_mem_ctx=0x7fd737abad60, ev=0x7fd737a8e4e0, in=...,
    out=0x7fd737abad78) at ../auth/gensec/spnego.c:1473
#12 0x00007fd72ef308ac in gensec_update_async_trigger (ctx=0x7fd737a8e4e0, im=<optimized out>, private_data=<optimized out>) at ../auth/gensec/gensec.c:458
#13 0x00007fd7330c7c34 in tevent_common_loop_immediate (ev=ev@entry=0x7fd737a8e4e0) at ../tevent_immediate.c:135
#14 0x00007fd7346a02fc in run_events_poll (ev=0x7fd737a8e4e0, pollrtn=0, pfds=0x0, num_pfds=0) at ../source3/lib/events.c:192
#15 0x00007fd7346a05e4 in s3_event_loop_once (ev=0x7fd737a8e4e0, location=<optimized out>) at ../source3/lib/events.c:303
#16 0x00007fd7330c740d in _tevent_loop_once (ev=ev@entry=0x7fd737a8e4e0, location=location@entry=0x7fd73687ab40 "../source3/smbd/process.c:4117")
    at ../tevent.c:533
#17 0x00007fd7330c75ab in tevent_common_loop_wait (ev=0x7fd737a8e4e0, location=0x7fd73687ab40 "../source3/smbd/process.c:4117") at ../tevent.c:637
#18 0x00007fd7367306d1 in smbd_process (ev_ctx=ev_ctx@entry=0x7fd737a8e4e0, msg_ctx=msg_ctx@entry=0x7fd737a8e5d0, sock_fd=sock_fd@entry=38,
    interactive=interactive@entry=false) at ../source3/smbd/process.c:4117
#19 0x00007fd73721b304 in smbd_accept_connection (ev=0x7fd737a8e4e0, fde=<optimized out>, flags=<optimized out>, private_data=<optimized out>)
    at ../source3/smbd/server.c:762
#20 0x00007fd7346a042c in run_events_poll (ev=0x7fd737a8e4e0, pollrtn=<optimized out>, pfds=0x7fd737a8e7a0, num_pfds=6) at ../source3/lib/events.c:257
#21 0x00007fd7346a0680 in s3_event_loop_once (ev=0x7fd737a8e4e0, location=<optimized out>) at ../source3/lib/events.c:326
#22 0x00007fd7330c740d in _tevent_loop_once (ev=ev@entry=0x7fd737a8e4e0, location=location@entry=0x7fd73721e776 "../source3/smbd/server.c:1127")
    at ../tevent.c:533
#23 0x00007fd7330c75ab in tevent_common_loop_wait (ev=0x7fd737a8e4e0, location=0x7fd73721e776 "../source3/smbd/server.c:1127") at ../tevent.c:637
#24 0x00007fd737216ad4 in smbd_parent_loop (parent=<optimized out>, ev_ctx=0x7fd737a8e4e0) at ../source3/smbd/server.c:1127
";i:1;N;i:2;N;}i:2;i:153;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:153;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"[local user - stack]";}i:2;i:4714;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4740;}i:12;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:4523:"
#0  tdbsam_getsampwnam (my_methods=0x7fbbe64b1510, user=0x7fbbe64d9cc0, sname=0x7fbbe64d74c0 "abcd001") at ../source3/passdb/pdb_tdb.c:569
#1  0x00007fbbe1e09fbd in pdb_getsampwnam (sam_acct=sam_acct@entry=0x7fbbe64d9cc0, username=0x7fbbe64d74c0 "abcd001")
    at ../source3/passdb/pdb_interface.c:334
#2  0x00007fbbe19d2576 in check_sam_security (challenge=challenge@entry=0x7fbbe64d30d0, mem_ctx=mem_ctx@entry=0x7fbbe64ae4e0,
    user_info=user_info@entry=0x7fbbe64d7370, server_info=server_info@entry=0x7ffe9f7c5ce8) at ../source3/auth/check_samsec.c:395
#3  0x00007fbbe19c6bb1 in auth_samstrict_auth (auth_context=0x7fbbe64d30d0, my_private_data=<optimized out>, mem_ctx=0x7fbbe64ae4e0,
    user_info=0x7fbbe64d7370, server_info=<optimized out>) at ../source3/auth/auth_sam.c:102
#4  0x00007fbbe19caf2a in auth_check_ntlm_password (mem_ctx=mem_ctx@entry=0x7fbbe64d37a0, auth_context=auth_context@entry=0x7fbbe64d30d0,
    user_info=0x7fbbe64d7370, pserver_info=pserver_info@entry=0x7ffe9f7c5d98) at ../source3/auth/auth.c:225
#5  0x00007fbbe19cc8e7 in auth3_check_password (auth4_context=<optimized out>, mem_ctx=0x7fbbe64d37a0, user_info=0x7fbbe64d6fb0,
    server_returned_info=0x7fbbe64d37a0, session_key=0x7fbbe64d1e00, lm_session_key=0x7fbbe64d1e10) at ../source3/auth/auth_ntlmssp.c:179
#6  0x00007fbbdc012edd in ntlmssp_server_check_password (lm_session_key=0x7fbbe64d1e10, user_session_key=0x7fbbe64d1e00, mem_ctx=0x7fbbe64d1e00,
    gensec_ntlmssp=0x7fbbe64d37a0, gensec_security=0x7fbbe64d3c40) at ../auth/ntlmssp/ntlmssp_server.c:729
#7  gensec_ntlmssp_server_auth (gensec_security=0x7fbbe64d3c40, out_mem_ctx=<optimized out>, in=..., out=<optimized out>)
    at ../auth/ntlmssp/ntlmssp_server.c:1014
#8  0x00007fbbdc00e713 in gensec_ntlmssp_update (gensec_security=0x7fbbe64d3c40, out_mem_ctx=0x7fbbe64d1550, ev=<optimized out>, input=...,
    out=0x7ffe9f7c6080) at ../auth/ntlmssp/ntlmssp.c:176
#9  0x00007fbbdc0161c0 in gensec_update_ev (gensec_security=0x7fbbe64d3c40, out_mem_ctx=out_mem_ctx@entry=0x7fbbe64d1550, ev=ev@entry=0x7fbbe64a9470,
    in=..., out=out@entry=0x7ffe9f7c6080) at ../auth/gensec/gensec.c:303
#10 0x00007fbbdc00b17e in gensec_spnego_update (gensec_security=gensec_security@entry=0x7fbbe64d1470, out_mem_ctx=out_mem_ctx@entry=0x7fbbe64d1550,
    ev=ev@entry=0x7fbbe64a9470, in=..., out=out@entry=0x7fbbe64d15b0) at ../auth/gensec/spnego.c:963
#11 0x00007fbbdc00c580 in gensec_spnego_update_wrapper (gensec_security=0x7fbbe64d1470, out_mem_ctx=0x7fbbe64d6ac0, ev=0x7fbbe64a9470, in=...,
    out=0x7fbbe64d6ad8) at ../auth/gensec/spnego.c:1473
#12 0x00007fbbdc0158ac in gensec_update_async_trigger (ctx=0x7fbbe64a9470, im=<optimized out>, private_data=<optimized out>) at ../auth/gensec/gensec.c:458
#13 0x00007fbbe01acc34 in tevent_common_loop_immediate (ev=ev@entry=0x7fbbe64a9470) at ../tevent_immediate.c:135
#14 0x00007fbbe17852fc in run_events_poll (ev=0x7fbbe64a9470, pollrtn=0, pfds=0x0, num_pfds=0) at ../source3/lib/events.c:192
#15 0x00007fbbe17855e4 in s3_event_loop_once (ev=0x7fbbe64a9470, location=<optimized out>) at ../source3/lib/events.c:303
#16 0x00007fbbe01ac40d in _tevent_loop_once (ev=ev@entry=0x7fbbe64a9470, location=location@entry=0x7fbbe395fb40 "../source3/smbd/process.c:4117")
    at ../tevent.c:533
#17 0x00007fbbe01ac5ab in tevent_common_loop_wait (ev=0x7fbbe64a9470, location=0x7fbbe395fb40 "../source3/smbd/process.c:4117") at ../tevent.c:637
#18 0x00007fbbe38156d1 in smbd_process (ev_ctx=ev_ctx@entry=0x7fbbe64a9470, msg_ctx=msg_ctx@entry=0x7fbbe64a9560, sock_fd=sock_fd@entry=39,
    interactive=interactive@entry=false) at ../source3/smbd/process.c:4117
#19 0x00007fbbe4300304 in smbd_accept_connection (ev=0x7fbbe64a9470, fde=<optimized out>, flags=<optimized out>, private_data=<optimized out>)
    at ../source3/smbd/server.c:762
#20 0x00007fbbe178542c in run_events_poll (ev=0x7fbbe64a9470, pollrtn=<optimized out>, pfds=0x7fbbe64a9740, num_pfds=6) at ../source3/lib/events.c:257
#21 0x00007fbbe1785680 in s3_event_loop_once (ev=0x7fbbe64a9470, location=<optimized out>) at ../source3/lib/events.c:326
#22 0x00007fbbe01ac40d in _tevent_loop_once (ev=ev@entry=0x7fbbe64a9470, location=location@entry=0x7fbbe4303776 "../source3/smbd/server.c:1127")
    at ../tevent.c:533
#23 0x00007fbbe01ac5ab in tevent_common_loop_wait (ev=0x7fbbe64a9470, location=0x7fbbe4303776 "../source3/smbd/server.c:1127") at ../tevent.c:637
#24 0x00007fbbe42fbad4 in smbd_parent_loop (parent=<optimized out>, ev_ctx=0x7fbbe64a9470) at ../source3/smbd/server.c:1127
";i:1;N;i:2;N;}i:2;i:4740;}i:13;a:3:{i:0;s:2:"hr";i:1;a:0:{}i:2;i:9271;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9271;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"[Installation]";}i:2;i:9339;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9353;}i:17;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9353;}i:18;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9353;}i:19;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9353;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:" yum install ldb-tools";}i:2;i:9357;}i:21;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9379;}i:22;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9379;}i:23;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9379;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9379;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"[problem need to solve]";}i:2;i:9381;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9404;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9404;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"add user problem - local user will be sync to ldap server";}i:2;i:9406;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9469;}i:30;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:71:"
use another smb.conf for smbpasswd. (no ldap information in smb.conf)
";i:1;N;i:2;N;}i:2;i:9469;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9469;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"rid problem";}i:2;i:9550;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9567;}i:34;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:190:"
ldap server can not use rid due to the follow parameter : idmap backend = ldap:ldap://172.27.112.241
ldap user rid is from 1001. (same as synloogy and qnap)
local user rid is from 1000001.
";i:1;N;i:2;N;}i:2;i:9567;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9567;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:78:"ldap user with domain information can not login smb service. (user@domain.com)";}i:2;i:9767;}i:37;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9851;}i:38;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:41:"
Need to modify the source code of samba
";i:1;N;i:2;N;}i:2;i:9851;}i:39;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9851;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"The ldap user will be created when creating a local user account.";}i:2;i:9901;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9972;}i:42;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:478:"
ldapsam_update_sam_account: user nas_smb003 to be modified has dn: uid=nas_smb003,cn=users,dc=test,dc=ift,dc=com
init_ldap_from_sam: Setting entry for user: nas_smb003
smbldap_make_mod: deleting attribute |sambaAcctFlags| values |[DU         ]|
smbldap_make_mod: adding attribute |sambaAcctFlags| value |[NDU        ]|
smbldap_modify: dn => [uid=nas_smb003,cn=users,dc=test,dc=ift,dc=com]
ldapsam_update_sam_account: successfully modified uid = nas_smb003 in the LDAP database
";i:1;N;i:2;N;}i:2;i:9972;}i:43;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9972;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"[LDB]";}i:2;i:10460;}i:45;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10465;}i:46;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:10465;}i:47;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10465;}i:48;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10465;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:87:" LDB basically sits on top of TDB and manipulates the data into an LDAP-like structure.";}i:2;i:10469;}i:50;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10556;}i:51;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10556;}i:52;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10556;}i:53;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10556;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:10560;}i:55;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10561;}i:56;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10561;}i:57;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:10561;}i:58;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10561;}i:59;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"[TDB]";}i:2;i:10562;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10567;}i:61;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:10567;}i:62;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10567;}i:63;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10567;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:" TDB is the Trivial DataBase. ";}i:2;i:10571;}i:65;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10601;}i:66;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10601;}i:67;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10601;}i:68;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10601;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:" This is a very simple key/value pair database . ";}i:2;i:10605;}i:70;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10654;}i:71;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10654;}i:72;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10654;}i:73;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10654;}i:74;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:" TDB stores data in binary format.";}i:2;i:10658;}i:75;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10692;}i:76;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10692;}i:77;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:10692;}i:78;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10692;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"where is samba domain_dn?";}i:2;i:10694;}i:80;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10725;}i:81;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1572:"
get_default_basedn, /ift-utils/samba-4.2.3/lib/ldb/pyldb.c

username@computername:~/Samba/samba-master$ tdbdump st/dc/private/secrets.ldb
{
   key(12) = "DN=@MODULES\00"
   data(45) = "g\19\01&\01\00\00\00@MODULES\00@LIST\00\01\00\00\00\0D\00\00\00samba_secrets\00"
}
{
   key(43) = "DN=FLATNAME=SAMBADOMAIN,CN=PRIMARY DOMAINS\00"
   data(702) = "g\19\01&\11\00\00\00flatname=SAMBADOMAIN,cn=Primary Domains\00msDS-KeyVersionNumber\00\01\00\00\00\01\00\00\001\00objectClass\00\03\00\00\00\03\00\00\00top\00\0D\00\00\00primaryDomain\00\0E\00\00\00kerberosSecret\00objectSid\00\01\00\00\00\18\00\00\00\01\04\00\00\00\00\00\05\15\00\00\00\013\BE\F5\DB\E8\C33\B4\9C\1E\ED\00privateKeytab\00\01\00\00\00\0E\00\00\00secrets.keytab\00realm\00\01\00\00\00\11\00\00\00SAMBA.EXAMPLE.COM\00saltPrincipal\00\01\00\00\000\00\00\00host/localdc.samba.example.com@SAMBA.EXAMPLE.COM\00samAccountName\00\01\00\00\00\08\00\00\00LOCALDC$\00secret\00\01\00\00\00\11\00\00\00machinelocDCpass1\00secureChannelType\00\01\00\00\00\01\00\00\006\00servicePrincipalName\00\02\00\00\00\0C\00\00\00HOST/localdc\00\1E\00\00\00HOST/localdc.samba.example.com\00objectGUID\00\01\00\00\00\10\00\00\00H\D9_\D5+\E3\C0G\B7\CF\F6\FB\B1m\EB\1E\00whenCreated\00\01\00\00\00\11\00\00\0020111005000140.0Z\00whenChanged\00\01\00\00\00\11\00\00\0020111005000140.0Z\00uSNCreated\00\01\00\00\00\01\00\00\007\00uSNChanged\00\01\00\00\00\01\00\00\007\00name\00\01\00\00\00\0B\00\00\00SAMBADOMAIN\00flatname\00\01\00\00\00\0B\00\00\00SAMBADOMAIN\00"
}
   
join AD (or LDAP), there is still no Primary Domains information.
";i:1;N;i:2;N;}i:2;i:10725;}i:82;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:10725;}}