import socket
import sys

ip = sys.argv[1]
port = int(sys.argv[2])
serv = (ip, port)

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
msg = "Hello World"
sock.sendto(msg, serv)
data, address = sock.recvfrom(4096)
print data


