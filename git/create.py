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

class GIT_CREATE:
	def __init__(self):
		pass

	def lp(self): #local Repository
		cmds = [
			'mkdir test',
			'cd test;git init',
			'echo "initial" > initial.txt',
			'git add .',
			'git commit -m \'initial\'',
			'cd ../',
			'git clone --bare test test.git',
		]
		for cmd in cmds:
			os.system(cmd)

	def dispatch(self, name):
		func = getattr(self, name)
		func()

def main():
	gc = GIT_CREATE()
	gc.dispatch(sys.argv[1])


if __name__ == "__main__":
	main()
