#!/bin/bash






case $1 in
	'ift')
		rm -rf /root/smb.tar.gz
		rm -rf install
		rsync -a root@172.27.112.143:/root/rpmbuild/BUILD/samba-4.1.12/smb.tar.gz /root/smb.tar.gz
		tar -zxvf /root/smb.tar.gz
		cp -R install/usr /
		;;  
	'smb')
		yum install samba4
		yum install samba-winbind.x86_64
		yum install samba-winbind-clients.x86_64
		yum install samba-client 
		;;
esac

