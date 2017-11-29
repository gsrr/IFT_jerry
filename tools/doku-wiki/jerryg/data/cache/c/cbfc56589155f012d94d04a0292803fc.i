a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:341:"
# input data to stdin - os.system
os.system('echo -e "%s\n%s\n" | smbpasswd -a %s'%(password, password, username))


# input data to stdin by subprocess
p = Popen('/usr/bin/smbpasswd -c /etc/samba/smb.conf.default -a %s'%username, shell = True, stdout=PIPE, stdin=PIPE, stder    r=PIPE)
p.communicate(input='%s\n%s\n'%(password, password))
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}