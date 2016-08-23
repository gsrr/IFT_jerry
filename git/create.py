import sys
import os


#bare repository
#

#clone repository
'''
local file system:git clone /path/to/repo or git clone file://path/to/repo
http : git clone http://example.com/repo
ssh : git clone ssh://example.com/srv/git/repo or git clone example.com:/srv/git/repo
git protocol : git clone git://example.com/repo
bundle : git clone file.bndl (using git bundle and transfer data by usb drive)

(http://stackoverflow.com/questions/978052/how-can-i-make-my-local-repository-available-for-git-pull)
'''

def chdir(path):
	os.chdir(path)
	return 0

def init_nonbare(repos):
	cmds = [
		'git init',
		'echo "initial" > initial.txt',
		'git add .',
		'git commit -m \'initial\'',
	]
	cwd = os.getcwd()
	chdir(cwd + "/" + repos)
	for cmd in cmds:
		ret = os.system(cmd)
		if ret != 0:
			print "(ret, cmd) = (%d, %s)"%(ret, cmd)
	chdir(cwd)
	return 0
	
def init_bare(repos):
	return os.system('git clone --bare %s %s.git'%(repos, repos))
	

class GIT_CREATE:
	def __init__(self):
		pass

	def lp(self): #local Repository
		repos = raw_input("Please enter the name : ")
		cmds = [
			'mkdir %s'%repos,
			init_nonbare,
			init_bare,
		]
		for cmd in cmds:
			if type(cmd) == str:
				ret = os.system(cmd)
			else:
				ret = cmd(repos)
			print "(ret, cmd) = (%d, %s)"%(ret, cmd)

	def dispatch(self, name):
		func = getattr(self, name)
		func()

def main():
	gc = GIT_CREATE()
	gc.dispatch(sys.argv[1])


if __name__ == "__main__":
	main()
