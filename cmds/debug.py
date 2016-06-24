import sys
import os


class SYSDEBUG:
	def __init__(self):
		pass
	
	def memory(self):
		os.system("free -m")

	def fd(self):
		pid = input("Enter pid number:")
		cmd = "ls -l /proc/%s/fd"%pid
		os.system(cmd)

	def dispatch(self, name):
		func = getattr(self, name)
		func()

def main():
	dbg = SYSDEBUG()
	dbg.dispatch(sys.argv[1])

if __name__ == "__main__":
	main()
