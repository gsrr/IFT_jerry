'''
    Raw sockets on Linux
     
    Silver Moon (m00n.silv3r@gmail.com)
'''
 
# some imports
import socket, sys
import struct
from struct import *
import threading 
import time


# checksum functions needed for calculation checksum
def checksum(msg):
    s = 0
     
    # loop taking 2 characters at a time
    for i in range(0, len(msg), 2):
        w = ord(msg[i]) + (ord(msg[i+1]) << 8 )
        s = s + w
     
    s = (s>>16) + (s & 0xffff);
    s = s + (s >> 16);
     
    #complement and mask to 4 byte short
    s = ~s & 0xffff
     
    return s
 

def ipHeader(source_ip, dest_ip):
        # ip header fields
        ip_ihl = 5
        ip_ver = 4
        ip_tos = 0
        ip_tot_len = 0  # kernel will fill the correct total length
        ip_id = 54321   #Id of this packet
        ip_frag_off = 0
        ip_ttl = 255
        ip_proto = socket.IPPROTO_TCP
        ip_check = 0    # kernel will fill the correct checksum
        ip_saddr = socket.inet_aton ( source_ip )   #Spoof the source ip address if you want to
        ip_daddr = socket.inet_aton ( dest_ip )
 
        ip_ihl_ver = (ip_ver << 4) + ip_ihl
         
        # the ! in the pack format string means network order
        ip_header = pack('!BBHHHBBH4s4s' , ip_ihl_ver, ip_tos, ip_tot_len, ip_id, ip_frag_off, ip_ttl, ip_proto, ip_check, ip_saddr, ip_daddr)
        return ip_header


#create a raw socket
try:
    s = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_RAW)
except socket.error , msg:
    print 'Socket could not be created. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
    sys.exit()
 
cnt = 0
while True:
	cnt += 1
	sni_seq = 0
	sni_ack = 0
	sni_f_syn = 1
	sni_f_ack = 0
	sni_s_port = 9999
	sni_t_port = int(sys.argv[1])
	if cnt %2 == 0:
		data = {}
		with open("tcp.cfg", "r") as fr:
			lines = fr.readlines()
			for line in lines:
				line = line.strip()
				keyValue = line.split("=")
				data[keyValue[0]] = keyValue[1]
		sni_seq = int(data['seq'])
		sni_ack = int(data['ack'])
		sni_s_port = int(sys.argv[1])
		sni_t_port = 9999
		sni_f_syn = 0
		sni_f_ack = 1
	
	print sni_seq, sni_ack
	time.sleep(3) 
	# tell kernel not to put in headers, since we are providing it, when using IPPROTO_RAW this is not necessary
	# s.setsockopt(socket.IPPROTO_IP, socket.IP_HDRINCL, 1)
		 
	# now start constructing the packet
	packet = '';
	 
	source_ip = '127.0.0.1'
	dest_ip = '127.0.0.1' # or socket.gethostbyname('www.google.com')
	ip_header = ipHeader(source_ip, dest_ip)
	# tcp header fields
	tcp_source = sni_s_port   # source port
	tcp_dest = sni_t_port# destination port
	tcp_seq = sni_seq
	tcp_ack_seq = sni_ack
	tcp_doff = 5    #4 bit field, size of tcp header, 5 * 4 = 20 bytes
	#tcp flags
	tcp_fin = 0
	tcp_syn = sni_f_syn
	tcp_rst = 0
	tcp_psh = 0
	tcp_ack = sni_f_ack
	tcp_urg = 0
	tcp_window = socket.htons (5840)    #   maximum allowed window size
	tcp_check = 0
	tcp_urg_ptr = 0
	 
	tcp_offset_res = (tcp_doff << 4) + 0
	tcp_flags = tcp_fin + (tcp_syn << 1) + (tcp_rst << 2) + (tcp_psh <<3) + (tcp_ack << 4) + (tcp_urg << 5)
	 
	# the ! in the pack format string means network order
	tcp_header = pack('!HHLLBBHHH' , tcp_source, tcp_dest, tcp_seq, tcp_ack_seq, tcp_offset_res, tcp_flags,  tcp_window, tcp_check, tcp_urg_ptr)
	 
	user_data = 'attack'
	 
	# pseudo header fields
	source_address = socket.inet_aton( source_ip )
	dest_address = socket.inet_aton(dest_ip)
	placeholder = 0
	protocol = socket.IPPROTO_TCP
	tcp_length = len(tcp_header) + len(user_data)
	 
	psh = pack('!4s4sBBH' , source_address , dest_address , placeholder , protocol , tcp_length);
	psh = psh + tcp_header + user_data;
	 
	tcp_check = checksum(psh)
	#print tcp_checksum
	 
	# make the tcp header again and fill the correct checksum - remember checksum is NOT in network byte order
	tcp_header = pack('!HHLLBBH' , tcp_source, tcp_dest, tcp_seq, tcp_ack_seq, tcp_offset_res, tcp_flags,  tcp_window) + pack('H' , tcp_check) + pack('!H' , tcp_urg_ptr)
	 
	# final full packet - syn packets dont have any data
	packet = ip_header + tcp_header + user_data
	 
	#Send the packet finally - the port specified has no effect
	s.sendto(packet, (dest_ip , 0 ))    # put this in a loop if you want to flood the target
