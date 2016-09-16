import sys
import subprocess
import inspect

def caller():
	stack = inspect.stack()
	module = inspect.getmodule(stack[1][0])
	print module.__name__, stack[1][1]

def isPortUsed(port):
	cmd = "fuser %s/tcp"%port
	cmds = ['fuser', "%s/tcp"%port]
	proc = subprocess.Popen(cmds, stdout = subprocess.PIPE)
	output = proc.stdout.readlines()
	if len(output) == 0:
		return False
	return True


def test_isPortUsed():
	print isPortUsed("22")
	print isPortUsed("8888")

def test_caller():
	caller()

if __name__ == "__main__":
	for fname in dir(sys.modules[__name__]):
		if fname.startswith("test_"):
			func = getattr(sys.modules[__name__], fname)
			func()
