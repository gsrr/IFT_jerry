import socket
import ssl
from argparse import *
import sys

def parser_init():
    parser = ArgumentParser(
        add_help=True, 
    )
    parser.add_argument('-op')
    return parser.parse_args(sys.argv[1:]).__dict__

def ssl_client_cert():
    HOST, PORT = '127.0.0.1', 4434
    # CREATE SOCKET
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(10)

    # WRAP SOCKET
    cert = ssl.get_server_certificate((HOST,PORT))
    with open("tmp.cert", "w") as fw:
        fw.write(cert)

    ssl_sock = ssl.wrap_socket(sock, ca_certs="tmp.cert", cert_reqs=ssl.CERT_REQUIRED)
    ssl_sock.connect((HOST, PORT))
    print repr(ssl_sock.getpeername())
    print ssl_sock.cipher()
    # CONNECT AND PRINT REPLY
    print ssl_sock.getpeercert()
    ssl_sock.send("test cmd")
    ssl_sock.close()

def ssl_client_nocert():
    HOST, PORT = '127.0.0.1', 4434
    # CREATE SOCKET
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(10)

    # WRAP SOCKET
    ssl_sock = ssl.wrap_socket(sock, cert_reqs=ssl.CERT_NONE)
    ssl_sock.connect((HOST, PORT))
    print repr(ssl_sock.getpeername())
    print ssl_sock.cipher()
    # CONNECT AND PRINT REPLY
    print ssl_sock.getpeercert()
    ssl_sock.send("test cmd")
    ssl_sock.close()

def main():
    func = getattr(sys.modules[__name__], "ssl_client_" + parser_init()['op'])
    func()

if __name__ == "__main__":
    main()
