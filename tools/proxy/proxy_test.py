import socket
import sys
import threading
import signal

def handler(signum, frame):
    print 'Signal handler called with signal', signum
    raise IOError("Couldn't open device!")
    

class Proxy:
    def __init__(self, host, dest):
        self.left = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.left.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.conn = None
        self.right = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.host = host
        self.dest = dest
    
    def start(self):
        self.left.bind((self.host, 8888))
        self.left.listen(10)
        self.conn, addr = self.left.accept()
        print 'Connected with ' + addr[0] + ':' + str(addr[1])
        self.right.connect((self.dest, 23))
        self.right.settimeout(1.0)
        print "connected to ptt"
        
    def handle(self):
        while True:
            print "recv from left"
            send_data = self.conn.recv(1024)
            print "left:", send_data.encode("hex"), "size:", len(send_data)
            self.right.send(send_data)
            print "recv from right"
            try:
                recv_data = self.right.recv(8192)
                #print "right:", recv_data
                self.conn.send(recv_data)
            except:
                pass
        
    def close(self):
        self.left.close()
        self.right.close()
        
def main():
    p = Proxy("0.0.0.0", "ptt.cc")
    p.start()
    p.handle()

if __name__ == "__main__":
    signal.signal(signal.SIGINT , handler)
    main()
