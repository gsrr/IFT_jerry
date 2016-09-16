import os
import sys

def child(d):
	print('\nA new child ',  os.getpid())
	print d
	print "child:", id(d)
	os._exit(0)

def parent():
	d = {'aaa' : 123}
	while True:
		newpid = os.fork()
		if newpid == 0:
			d['bbb'] = 234
			child(d)
		else:
			pids = (os.getpid(), newpid)
			print("parent: %d, child: %d\n" % pids)
		reply = raw_input("q for quit / c for new fork")
		print "parent:", id(d)
		print d
		if reply == 'c':
			continue
		else:
			break
parent()
