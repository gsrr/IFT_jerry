import socket
import sys
import threading
import signal
import os
import time
import traceback

def create_server_socket(host, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    sock.bind((host,port))
    sock.listen(10)
    return sock

def create_client_socket():
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    return sock
    
def handler(signum, frame):
    print 'Signal handler called with signal', signum
    sys.exit(0)

class Proxy:
    def __init__(self):
        self.cmd_socket = create_server_socket("0.0.0.0", 8889)
        self.left = create_server_socket("0.0.0.0", 8888)
        self.auto_mode = False
    
    def action(self, act):
        key = {
            'up' : '1b5b41',
            'down' : '1b5b42',
        }[act]
        return key
    
    def do_enable_auto_mode(self):
        self.auto_mode = True

    def do_disable_auto_mode(self):
        self.auto_mode = False

    def _accept_cmd(self):
        while True:
            try:
                conn, addr = self.cmd_socket.accept()
                print '_accept_cmd Connected with ' + addr[0] + ':' + str(addr[1])
                cmd = conn.recv(1024)
                print cmd
                func = getattr(self, "do_" + cmd)
                func()
                conn.close()
            except:
                print traceback.format_exc()
                conn.close()
                break
    
    def _handle_client_ptt(self, client, server):
        cnt = 0
        while True:
            try:
                print "recv from left"
                if self.auto_mode:
                   time.sleep(1)
                   if cnt % 2 == 0:
                       send_data = "1b5b42".decode("hex")
                   else:
                       send_data = "1b5b41".decode("hex")
                   cnt += 1
                else:
                   send_data = client.recv(1024)
            
                print "left:", send_data.encode("hex"), "size:", len(send_data)
                server.send(send_data)
                print "recv from right"
                recv_data = server.recv(8192)
                print "right:", recv_data.encode("hex")
                client.send(recv_data)
            except:
                pass
                break
        
    def _handle_client(self, conn):
        right = create_client_socket()
        right.connect(("ptt.cc", 23))
        right.settimeout(0.5)
        print "connected to ptt"
        self._handle_client_ptt(conn, right)
        right.close()

    def accept(self):
        t1 = threading.Thread(target=self._accept_cmd)
        t1.setDaemon(True)
        t1.start()

        while True:
            conn = None
            try:
                conn, addr = self.left.accept()
                print 'Connected with ' + addr[0] + ':' + str(addr[1])
                t2 = threading.Thread(target=self._handle_client, args=(conn,))
                t2.start()
            except:
                print "here-accept"
                print traceback.format_exc()
                break

    def close(self):
        self.cmd_socket.close()
        self.left.close()
        print "close all"
        
def main():
    p = Proxy()
    p.accept()
    p.close()
    print "aaaa"

if __name__ == "__main__":
    signal.signal(signal.SIGINT , handler)
    main()
