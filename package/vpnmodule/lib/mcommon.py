import subprocess

def cmdListCall(cmd):
	proc = subprocess.Popen(cmd, stdout=subprocess.PIPE)
	return proc.communicate()
