import sys
import time

sys.stdin = open("./file.read", "r")
while True:
		print sys.stdin.readlines()
		time.sleep(1)

