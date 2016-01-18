# Echo client program
import socket
import sys


def send(host, port):
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.connect((host, port))
	s.sendall("attack")
	s.close()

def sendCommand(host, port):
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.connect((host, port))
	while True:
			cmd = raw_input("Enter cmd:")
			s.sendall(cmd)
			data = s.recv(1024)
			print "recv:", data
	s.close()
	return data


def main(host, port):
	sendCommand(host, port)

if __name__ == "__main__":
	if sys.argv[1] == "send":
		host = sys.argv[2]
		port = int(sys.argv[3])
		send(host, port)
	else:
		host = sys.argv[1]
		port = int(sys.argv[2])
		main(host, port)	
