import sys
import os


def main():
	clicmd = " ".join(sys.argv[1:])
	cmd = 'echo -e "%s\nexit\n" | python /usr/local/NAS/misc/Cmd/NASCmd.py'%clicmd
	os.system(cmd)

if __name__ == "__main__":
	main()
