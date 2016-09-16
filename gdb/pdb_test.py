import os
import signal
import sys
import time    

def handle_pdb(sig, frame):
		import pdb
		pdb.Pdb().set_trace(frame)    

def loop():
		while True:
				x = 'foo'
				print x
				time.sleep(1)

if __name__ == '__main__':
		signal.signal(signal.SIGUSR1, handle_pdb)
		print(os.getpid())
		loop()
