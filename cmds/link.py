
import os
import sys


def pam(service):
	os.system("rm -rf /etc/pam.d/system-auth")
	os.system("ln -s /etc/pam.d/system-auth-%s /etc/pam.d/system-auth"%service)
	os.system("rm -rf /etc/pam.d/password-auth")
	os.system("ln -s /etc/pam.d/password-auth-%s /etc/pam.d/password-auth"%service)

def main():
	func = getattr(sys.modules[__name__], sys.argv[1])	
	func(sys.argv[2])

if __name__ == "__main__":
	main()
