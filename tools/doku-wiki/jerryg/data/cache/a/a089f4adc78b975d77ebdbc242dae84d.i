a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:402:"
# add entry offline
slapadd -v -l /tmp/root.ldif

[root.ldif]
dn: sambaDomainName=aaa,dc=aaa,dc=com
sambaSID: S-1-5-21-444432415-1257635583-3944642206
sambaNextUserRid: 1000
objectClass: sambaDomain

# export 
slapcat -n 2 > ldap.ldif

# import
rm -rf  /cfpool/ldapserver/*
cp /etc/openldap/DB_CONFIG.example /cfpool/ldapserver/DB_CONFIG
slapadd -v -l ldap.ldif
chown -R ldap:ldap /cfpool/ldapserver/
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}