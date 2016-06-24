#!/usr/bin/python

import os
import sys
from .lib import ssh



def sshExecute(cmd):
	print os.getcwd()
	print ssh.test()
		

class LDAP:
	def __init__(self, args=None):
		self.cmds = {
			'status' : "systemctl status nslcd",
			'restart' : "systemctl restart nslcd",
			'pam_log' : "tail -f /var/log/pam.log",
		}
	
	def build(self):
		# rpmbuild reference : http://www.rpm.org/max-rpm-snapshot/ch-rpm-b-command.html
		cmds = [
			'rm -rf /root/nslcd.tar',
			'rpmbuild -bc --short-circuit /root/rpmbuild/SPECS/nss-pam-ldapd.spec',
			'rpmbuild -bi --short-circuit /root/rpmbuild/SPECS/nss-pam-ldapd.spec',
			'tar -cvf nslcd.tar /root/rpmbuild/BUILDROOT/nss-pam-ldapd-0.8.13-8.el7.centos.x86_64/*',
			'mv nslcd.tar /root/nslcd.tar',
		]
		for cmd in cmds:
			sshExecute(cmd)

	def status(self):
		os.system(self.cmds['status'])
	
	def restart(self):
		os.system(self.cmds['restart'])
	
	def pam_log(self):
		os.system(self.cmds['pam_log'])

	def test(self):
		print "test"

def others(obj, args):
	func = getattr(obj, args[1])
	func()

def pam_log(obj, args):
	obj.pam_log()

def restart(obj, args):
	obj.restart()

def status(obj, args):
	obj.status()

def main(args):
	try:
		obj = LDAP()
		func = getattr(sys.modules[__name__], args[1])
		func(obj, args)
	except:
		others(obj, args)

if __name__ == "__main__":
	main(sys.argv)
