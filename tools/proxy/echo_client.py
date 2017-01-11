import socket
import sys
import time
import struct
import binascii
import os
import datetime
from argparse import *
import ssl
import datetime

SSL_ENABLE = False


class Client:
    def __init__(self, port, udp = False):
        self.host = "localhost"
        self.port = port
        if udp == False:
            self.init_tcp_socket()
        else:
            self.init_udp_socket()
            self.send = self.udp_send

    def init_tcp_socket(self):
        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.s.connect(("localhost", self.port))
        
    def init_udp_socket(self):
        self.s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        
    def set_broadcase(self):
        self.s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

    def dispatch(self, cmd):
        func = getattr(self, cmd)
        ret = func()
        return ret

    def udp_send(self, cmd):
        self.s.sendto(cmd, (self.host, self.port))
        data = self.s.recvfrom(1024)
        print data

    def send(self, cmd):
        self.s.send(cmd)
        print self.s.recv(1024)

def parser_init():
    parser = ArgumentParser(
        add_help=False, 
    )
    parser.add_argument(
        '-p', 
        default=None, 
        dest='port', 
    )
    parser.add_argument(
        '-c', 
        default=None, 
        dest='command', 
    )
    parser.add_argument(
        '--udp', 
        action='store_true',
        dest='udp', 
    )
    parser.add_argument(
        '-b', 
        action='store_true',
        dest='broadcast', 
    )
    parser.add_argument(
        '--test', 
        action='store_true',
        dest='unitest', 
    )
    return parser

def main():
    t = datetime.datetime.now()
    parser = parser_init()
    paras = parser.parse_args(sys.argv[1:]).__dict__
    if paras['udp']:
        cli = Client(int(paras['port']), paras['udp'])
        if paras['broadcast']:
            cli.set_broadcase()
    else:
        cli = Client(int(paras['port']), paras['udp'])
        cli.send(paras['command'])
    print datetime.datetime.now() - t

if __name__ == "__main__":
    main()


