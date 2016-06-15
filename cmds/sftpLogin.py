import sys
import os
import time
import pty

def meetword(fd, cmd):
	data = os.read(fd, 100) 
	while True:
		lines = data.split("\n")
		if len(lines) > 1:
			for line in lines[:-1]:
				print line
		curline = lines[-1]
		if cmd[0] in curline:
			print curline,
			os.write(fd,"%s\n"%cmd[1])
			break	
		data = curline + os.read(fd, 100)

def child(pid, fd):
	sys.stdout.flush()
	try:
		os.execlp("sftp","","test@127.0.0.1")
	except:
		print "Cannot spawn execlp..."

def parent(cpid, fd):
	cmds = [
		('password','test'),
		('sftp','pwd'),
		('sftp', 'quit')
	]
	for cmd in cmds:
		meetword(fd, cmd)
	
def my_pty_fork():
		try:
			( child_pid, fd ) = pty.fork()    # OK
			if child_pid == 0:
				child(child_pid, fd)
			else:
				parent(child_pid, fd)
		except OSError as e:
			print str(e)

if __name__ == "__main__":
	my_pty_fork()
