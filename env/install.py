import os

def readFile(path):
	data = []
	with open(path, "r") as fr:
		lines = fr.readlines()
		for line in lines:
			line = line.strip()
			if line.startswith("#"):
				continue
			if line == "":
				continue
			data.append(line)
	
	return data

def install(cmds):
	for cmd in cmds:
		os.system(cmd)

def main():
	cmds = readFile("packages")
	install(cmds)

if __name__ == "__main__":
	main()

