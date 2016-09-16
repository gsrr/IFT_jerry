import socket
import sys
import time

ip = sys.argv[1]
port = int(sys.argv[2])
serv = (ip, port)

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
msg = "Hello World"
while True:
	sock.sendto(msg, serv)
	time.sleep(1)
data, address = sock.recvfrom(4096)
print data


