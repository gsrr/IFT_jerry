import socket
import ssl

host = ''
port = 4434
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock = ssl.wrap_socket(sock, 
            keyfile="./key.pem",
            certfile='./cert.pem',
            server_side=True,
            ssl_version=ssl.PROTOCOL_TLSv1,
            cert_reqs=ssl.CERT_NONE,
            )
sock.bind((host, port))
sock.listen(5)
client,addr = sock.accept()
print addr
print client.recv()
