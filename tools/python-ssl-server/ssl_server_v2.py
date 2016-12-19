import sys
import socket, ssl

def deal_with_client(connstream):
    data = connstream.read()
    print data

bindsocket = socket.socket()
bindsocket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
bindsocket.bind(('', 4434))
bindsocket.listen(5)
while True:
    newsocket, fromaddr = bindsocket.accept()
    print newsocket, fromaddr
    if len(sys.argv) < 1:
        connstream = ssl.wrap_socket(newsocket, keyfile="./key.pem", certfile='./cert.pem',server_side=True)
    else:
        connstream = ssl.wrap_socket(newsocket, keyfile="./newkey.pem", certfile='./cert.pem',server_side=True)
    try:
        deal_with_client(connstream)
    finally:
        connstream.shutdown(socket.SHUT_RDWR)
        connstream.close()


