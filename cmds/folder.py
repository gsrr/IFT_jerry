import os
import commands
import sys

class Folder:
	def __init__(self, path):
		self.path = path
	
	def listSubFolder(self):
		dirs = os.listdir(self.path)
		for d in dirs:
			subPath = "%s/%s"%(self.path.rstrip("/"), d)
			cmd = "du -sch %s | grep -v total"%(subPath)
			out = commands.getoutput(cmd)
			print out,
			if os.path.islink(subPath):
				print "islink"
			else:
				print
			




if __name__ == "__main__":
	f = Folder(sys.argv[1])
	f.listSubFolder()
