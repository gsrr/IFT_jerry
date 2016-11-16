import socket;
import sys


def usage():
    return "Format: python port_check.py <ip> <port>"

def execute():
    ip = sys.argv[1]
    port = int(sys.argv[2])
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    result = sock.connect_ex((ip, port))
    if result == 0:
        print "Port is open"
    else:
        print "Port is not open"

def main():
    if len(sys.argv) < 3:
        print usage()
    else:
        execute()

if __name__ == "__main__":
    main()
