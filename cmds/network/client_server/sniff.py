import socket
import struct

SNI_PORT = 0
SNI_SEQ = 0
SNI_ACK = 0

def sniff(host, port):
    global SNI_PORT
    global SNI_SEQ
    global SNI_ACK
    sock = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_TCP)   
    sock.bind((host, 0))
    sock.setsockopt(socket.IPPROTO_IP, socket.IP_HDRINCL, 1)
    while True:
        packet = sock.recvfrom(65535)
        packet = packet[0]
        ip_header = packet[0:20]
        iph = struct.unpack("!BBHHHBBH4s4s", ip_header)
        
        ihl = iph[0] & 0xF
        ihl = (ihl * 32) / 8
        s_addr = socket.inet_ntoa(iph[8])
        d_addr = socket.inet_ntoa(iph[9])

        tcp_header = packet[ihl:ihl + 20]
        tcph = struct.unpack("!HHLLBBHHH", tcp_header)
        s_port = tcph[0]
        d_port = tcph[1]
        seq = tcph[2]
        ack = tcph[3]
        
        if d_port == port:
            SNI_PORT = s_port
            SNI_SEQ = seq
            SNI_ACK = ack
            print s_port, seq, ack
            with open("tcp.cfg", "w") as fw:
                fw.write("seq=%s\n"%seq)
                fw.write("ack=%s\n"%ack)

if __name__ == "__main__":
    sniff("127.0.0.1", 9999)
