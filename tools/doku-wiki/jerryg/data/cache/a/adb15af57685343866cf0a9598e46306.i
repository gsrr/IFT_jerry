a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:8:"graphviz";i:1;a:6:{s:5:"width";s:3:"800";s:6:"height";s:3:"400";s:6:"layout";s:3:"dot";s:5:"align";s:5:"right";s:7:"version";s:10:"2016-02-03";s:3:"md5";s:32:"b3882ce594b1523db0c3f67eb8946f06";}i:2;i:5;i:3;s:2011:"<graphviz dot right 800x400>
digraph ATN {
rankdir=LR;
user[fontsize=11, label="user", shape=circle, fixedsize=false];
userhome[fontsize=11, label="userhome", shape=circle, fixedsize=false];
importedUserhome[fontsize=11, label="importedUserHome", shape=circle, fixedsize=false];
share[fontsize=11, label="share", shape=circle, fixedsize=false];
join_ad[fontsize=11, label="join_ad", shape=circle, fixedsize=false];
join_ldap[fontsize=11, label="join_ldap", shape=circle, fixedsize=false];
dns_set[fontsize=11, label="dns_set", shape=circle, fixedsize=false];
local_user[fontsize=11,label="local user", shape=circle, fixedsize=false, peripheries=1];
domain_user[fontsize=11,label="domain user", shape=circle, fixedsize=false, peripheries=1];
create_localuser[fontsize=11,label="create_localuser", shape=circle, fixedsize=false, peripheries=1];
edit_localuser[fontsize=11,label="edit_localuser", shape=circle, fixedsize=false, peripheries=1];
display_user[fontsize=11,label="display_user", shape=circle, fixedsize=false, peripheries=1];
local_user -> user[fontname="Times-Italic", label="&epsilon;"];
domain_user -> user[fontname="Times-Italic", label="&epsilon;"];
create_localuser -> local_user [fontname="Times-Italic", label="&epsilon;"];
edit_localuser -> local_user [fontname="Times-Italic", label="&epsilon;"];
display_user -> local_user [fontname="Times-Italic", label="&epsilon;"];
domain_user -> join_ad[fontname="Times-Italic", label="&epsilon;"];
domain_user -> join_ldap[fontname="Times-Italic", label="&epsilon;"];
join_ad -> dns_set[fontname="Times-Italic", label="&epsilon;"];
userhome -> create_localuser [fontname="Times-Italic", label="set"];
userhome -> edit_localuser [fontname="Times-Italic", label="display"];
userhome -> share [fontname="Times-Italic", label=""];
importedUserhome -> share [fontname="Times-Italic", label=""];
importedUserhome  -> join_ad[fontname="Times-Italic", label="&epsilon;"];
importedUserhome -> join_ldap[fontname="Times-Italic", label="&epsilon;"];
}
</graphviz>";}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:2012;}i:4;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2012;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2012;}}