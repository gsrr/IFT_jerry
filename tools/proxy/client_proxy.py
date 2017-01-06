import socket
import sys
import threading
import signal
import os
import time
import traceback

def create_client_socket(host):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect(("localhost", 8889))
    return sock
    
class ProxyClient:
    def __init__(self, host):
        self.sock = create_client_socket(host)
    
    def send(self, cmd):
        self.sock.send(cmd)

def main():
    p = ProxyClient("localhost")
    p.send(sys.argv[1])

if __name__ == "__main__":
    main()
