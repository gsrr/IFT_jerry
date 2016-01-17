import socket
import sys
import os

HOST = ''   # Symbolic name meaning all available interfaces
PORT = int(sys.argv[1]) # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print 'Socket created'

try:
	s.bind((HOST, PORT))
except socket.error , msg:
	print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
	sys.exit()

print 'Socket bind complete'

s.listen(10)
print 'Socket now listening'

#wait to accept a connection - blocking call
conn, addr = s.accept()

print 'Connected with ' + addr[0] + ':' + str(addr[1])

while True:
		data = conn.recv(4)
		print "recv:", data
		if data == "ls":
			os.system(data)
			conn.sendall("Execute:%s"%data)
		else:
			conn.sendall("no such command")
conn.close()
s.close()
