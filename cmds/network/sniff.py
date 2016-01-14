import os
import sys
import socket
import struct

def lin_sniffing(host):
	sock = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_ICMP)	
	sock.bind((host, 0))
	sock.setsockopt(socket.IPPROTO_IP, socket.IP_HDRINCL, 1)
	while True:
		data = sock.recvfrom(65535)
		print "data:", data
		raw_buffer = data[0]
		ip_raw = raw_buffer[0:20]
		ip_header = struct.unpack("!BBHHHBBH4s4s", ip_raw)
		print "ip_header:", type(ip_header), ip_header
		print "s_addr:", socket.inet_ntoa(ip_header[8])

def main(host):
	print "os name:",os.name
	if os.name == "nt":
		win_sniffing(host)
	else:
		lin_sniffing(host)

if __name__ == "__main__":
	main(sys.argv[1])
