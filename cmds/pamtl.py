#!/bin/python
import sys
import os


def ver():
	cmd = "ls /usr/share/doc/ | grep ^'pam'"
	os.system(cmd)

def main():
	func = getattr(sys.modules[__name__], sys.argv[1])
	func()

if __name__ == "__main__":
	main()
