# Echo client program
import socket
import sys



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
	host = sys.argv[1]
	port = int(sys.argv[2])
	main(host, port)	
