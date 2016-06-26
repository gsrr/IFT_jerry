import sys
import os
import getopt

# RSS : 
'''
	This is the amount of shared memory plus unshared memory used by each process.
'''

# VMS : 
'''
	The total accessible address space of a process.
	(Including the mallocs that have been allocated but not written to)
'''
def execmd(desc, cmd):
	raw_input("Press enter to continue")
	os.system("clear")
	print "Description:", desc
	print "Execute command:", cmd
	os.system(cmd)

class Memory:
	def __init__(self):
		pass
	
	def system(self):
		desc = "System usage:"
		execmd(desc, "free -m") # m mean MB

		desc = "System usage: Memory satus for all process"
		execmd(desc, "ps aux --sort -rss")
	
	def process(self, pid):
		desc = "Process usage : VMS(Virtual Memory Size) and RSS(Resident Set Size)"
		execmd(desc, "cat /proc/%s/status | grep -e 'VmSize' -e 'VmRSS'"%pid)

		desc = "Process usage (memory mapping) : "
		execmd(desc, "pmap -x %s"%pid)
		
class SYSDEBUG:
	def __init__(self, paras):
		self.mem = Memory()
		self.pid = input("Enter pid number:") if paras.get("pid") == None else paras['pid']
	
	def memory(self):
		self.mem.system()
		self.mem.process(self.pid)

	def fd(self):
		pid = input("Enter pid number:")
		cmd = "ls -l /proc/%s/fd"%pid
		os.system(cmd)

	def dispatch(self, name):
		func = getattr(self, name)
		func()

def usage():
	print "p : pid"

def main():
	try:
		opts, args = getopt.getopt(sys.argv[2:], "p:")
	except getopt.GetoptError as err:
		print str(err)
		usage()
		sys.exit(2)
	
	paras = {
		'pid' : None,
	}
	for o,a in opts:
		if o == '-p':
			paras['pid'] = a

	dbg = SYSDEBUG(paras)
	dbg.dispatch(sys.argv[1])

if __name__ == "__main__":
	main()
