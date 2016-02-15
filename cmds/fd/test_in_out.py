import sys
import os
import time
import traceback


pid = os.getpid()
cmd = "ls -l /proc/%d/fd/"%pid
print cmd

def std_in():
	while True:
		try:
			sys.stdin = open("/root/file.read", "r")
			str_in = raw_input("Enter text:")
			print str_in
			os.remove("/root/file.read")
			time.sleep(1)
		except:
			time.sleep(5)

def std_out():
	while True:
		try:
			sys.stdout = open("/root/file.read", "r")
			print >> sys.stderr, sys.stdout.readlines()
			os.remove("/root/file.read")
			time.sleep(1)
		except:
			print traceback.format_exc()
		finally:
			time.sleep(5)

def std_in_out():
	while True:
		try:
			os.system("ls -l >> /root/file.read")
			sys.stdin = open("/root/file.read", "r")
			print sys.stdin.read()
			os.remove("/root/file.read")
			time.sleep(1)
		except:
			print traceback.format_exc()
		finally:
			time.sleep(5)
	

std_in_out()
