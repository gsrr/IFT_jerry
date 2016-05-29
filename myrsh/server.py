import socket
import sys

ip = sys.argv[1]
port = int(sys.argv[2])

print "(ip, port) = (%s,%d)"%(ip, port)
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
sock.bind((ip, port))
data, address = sock.recvfrom(4096)
if data:
	print data
	sock.sendto(data,address)



