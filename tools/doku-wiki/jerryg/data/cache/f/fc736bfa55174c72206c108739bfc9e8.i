a:73:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:0;}i:3;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:0;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:4;}i:5;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:23:"tool:python:time_module";i:1;s:20:"Usage of time module";}i:2;i:5;}i:6;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:53;}i:7;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:53;}i:8;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:53;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"unix domain socket";i:1;i:1;i:2;i:54;}i:2;i:54;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:54;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1967:"
# server.py
import socket
import sys
import os

server_address = './uds_socket'

try:
    os.unlink(server_address)
except OSError:
    if os.path.exists(server_address):
        raise

# Create a UDS socket
sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
print >>sys.stderr, 'starting up on %s' % server_address
sock.bind(server_address)
sock.listen(1)

while True:
    print >>sys.stderr, 'waiting for a connection'
    connection, client_address = sock.accept()
    try:
        print >>sys.stderr, 'connection from', client_address

        while True:
            data = connection.recv(16)
            print >>sys.stderr, 'received "%s"' % data
            if data:
                print >>sys.stderr, 'sending data back to the client'
                connection.sendall(data)
            else:
                print >>sys.stderr, 'no more data from', client_address
                break
    finally:
        connection.close()
        
# client.py
import socket
import sys

# Create a UDS socket
sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)

# Connect the socket to the port where the server is listening
server_address = './uds_socket'
print >>sys.stderr, 'connecting to %s' % server_address
try:
    sock.connect(server_address)
except socket.error, msg:
    print >>sys.stderr, msg
    sys.exit(1)
try:

    # Send data
    message = 'This is the message.  It will be repeated.'
    print >>sys.stderr, 'sending "%s"' % message
    sock.sendall(message)

    amount_received = 0
    amount_expected = len(message)

    while amount_received < amount_expected:
        data = sock.recv(16)
        amount_received += len(data)
        print >>sys.stderr, 'received "%s"' % data
except Exception as ex:
        print type(ex), ex.args

finally:
    print >>sys.stderr, 'closing socket'
    sock.close()
    
# socket file is not exist
[root@gsnas_a unix]# python client.py
connecting to ./uds_socket
[Errno 2] No such file or directory
";i:1;N;i:2;N;}i:2;i:92;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2069;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"socket exception";i:1;i:1;i:2;i:2069;}i:2;i:2069;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2069;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:913:"
#client code
import socket
import traceback
import sys

try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_address = ('localhost', 10000)
        sock.connect(server_address)
except Exception as ex:
        print type(ex), ex.args

# Server is not open
[root@gsnas_a ~]# python client.py
<class 'socket.error'> (111, 'Connection refused') 

# Server close socket
[root@gsnas_a ~]# python client.py
<class 'socket.error'> (104, 'Connection reset by peer')


# raise exception
import socket
import traceback
import sys
import time

try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_address = ('localhost', 10000)
        raise Exception,(1,"error"), sys.exc_info()[2]
        sock.connect(server_address)
        sock.close()
except Exception as ex:
        print type(ex), ex.args, ex.errno
        print traceback.format_tb(sys.exc_info()[2])
";i:1;N;i:2;N;}i:2;i:2105;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3028;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"struct.pack";i:1;i:1;i:2;i:3028;}i:2;i:3028;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:3028;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:478:"
# pack string (char array)
>>> s1 = struct.pack("I9sI", 12, "Eononestr", 11)
>>> s1
'\x0c\x00\x00\x00Eononestr\x00\x00\x00\x0b\x00\x00\x00'
>>> struct.unpack("I9sI", s1)
(12, 'Eononestr', 11)

>>> struct.unpack("I8sI",s2)
(12, 'Eononest', 11)
>>> s2 = struct.pack("I", 12) + "Eononest" + struct.pack("I", 11)
>>> s2
'\x0c\x00\x00\x00Eononest\x0b\x00\x00\x00'
>>> struct.unpack("I8sI",s2)
(12, 'Eononest', 11)
(The packet should be padded if the char array is not divided by 2)
";i:1;N;i:2;N;}i:2;i:3059;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3546;}i:21;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"debug with gdb";i:1;i:1;i:2;i:3546;}i:2;i:3546;}i:22;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:3546;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3546;}i:24;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:41:"https://docs.python.org/devguide/gdb.html";i:1;N;}i:2;i:3575;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:3620;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3626;}i:27;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2500:"
# Reference
[gdb python online document]
https://sourceware.org/gdb/onlinedocs/gdb/Breakpoints-In-Python.html#Breakpoints-In-Python

[DebuggingWithGdb]
https://wiki.python.org/moin/DebuggingWithGdb

[Extended gdb using python]
https://sourceware.org/gdb/onlinedocs/gdb/Python.html

# install package
yum install gdb python-debuginfo
or
yum install gdb
yum install yum-utils
debuginfo-install glibc
debuginfo-install python

# gdb
source python-gdb.py
(https://raw.githubusercontent.com/WiserTogether/python27/master/python-gdb.py)

source py-fields.py
(https://gist.github.com/kouk/5c2e725bef8b54aae6e0)

[MAX_OUTPUT_LEN]
1. in python-pdb.py
2. 增加output 的長度

Q4 : 可以用gdb改變程式的fd路徑嗎?
Ans :

Q3 : 如何設定break point?
Ans : 
1. break PyEval_EvalFrameEx if (strcmp((((PyStringObject *)(f->f_code->co_name))->ob_sval), "foo") == 0)
2. (參考 my-gdb.py)
(gdb) py-bk Hello
Breakpoint 1 at 0x7fd390fefb00: file Python/ceval.c, line 759.
(gdb) c
Continuing.
stop

Breakpoint 1, PyEval_EvalFrameEx (
    f=f@entry=Frame 0x7fd3913c33e0, for file test.py, line 3, in Hello (name='Jerry', dic={'test': 2, 'key': 1}),
    throwflag=throwflag@entry=0) at Python/ceval.c:759
759     Python/ceval.c: No such file or directory.
(gdb)

Q2 : 如何印出python的變數內容?
Ans :

Q1 : py-bt print出來的訊息會被truncated, 要如何印出完整的訊息?
for example:
#9 Frame 0x7f759788e578, for file /usr/local/NAS/misc/HAAgent/HAServer.py, line 2913, in main (sys=<module at remote 0x7f75ab374bb0>, server=<HAServer(setInfoLock={'NFSInfo': <thread.lock at remote 0x7f75970f5710>, 'WEBDAVInfo': <thread.lock at remote 0x7f75970f57d0>, 'FTPInfo': <thread.lock at remote 0x7f75970f5750>, 'ServiceInfo': <thread.lock at remote 0x7f75970f5870>, 'MonitorInfo': <thread.lock at remote 0x7f75970f58d0>, 'DiskInfo': <thread.lock at remote 0x7f75970f5bf0>, 'ShareInfo': <thread.lock at remote 0x7f75970f5e70>, 'MDInfo': <thread.lock at remote 0x7f7594064270>, 'AvInfo': <thread.lock at remote 0x7f75940640d0>, 'SystemInfo': <thread.lock at remote 0x7f75970f5cf0>, 'LVMInfo': <thread.lock at remote 0x7f7594064430>, 'UserInfo': <thread.lock at remote 0x7f7594064390>, 'RSYNCDInfo': <thread.lock at remote 0x7f75970f5810>, 'AFPInfo': <thread.lock at remote 0x7f75970f5d50>, 'PasswdManageInfo': <thread.lock at remote 0x7f75970f5a50>, 'NetworkInfo': <thread.lock at remote 0x7f75940642d0>, 'CIFSInfo': <th...(truncated)

Ans:
需修改python-gdb裡面的參數:
MAX_OUTPUT_LEN=1024

";i:1;N;i:2;N;}i:2;i:3626;}i:28;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6135;}i:29;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"trace module";i:1;i:1;i:2;i:6135;}i:2;i:6135;}i:30;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6135;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6135;}i:32;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:27:"https://pymotw.com/2/trace/";i:1;N;}i:2;i:6162;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:6193;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6199;}i:35;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:95:"
# For a simple list of the functions called
python -m trace --listfuncs trace_example/main.py
";i:1;N;i:2;N;}i:2;i:6199;}i:36;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6303;}i:37;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"object analysis";i:1;i:1;i:2;i:6303;}i:2;i:6303;}i:38;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6303;}i:39;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6331;}i:40;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6331;}i:41;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6331;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:" vars(object) , but not all objects have a ";}i:2;i:6335;}i:43;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:6378;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"dict";}i:2;i:6380;}i:45;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:6384;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:" member";}i:2;i:6386;}i:47;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6393;}i:48;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6393;}i:49;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6393;}i:50;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6393;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" dir(object)";}i:2;i:6397;}i:52;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6409;}i:53;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6409;}i:54;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6409;}i:55;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6409;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" getattr()";}i:2;i:6413;}i:57;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6423;}i:58;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6423;}i:59;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6423;}i:60;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6423;}i:61;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:" type()";}i:2;i:6427;}i:62;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6434;}i:63;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6434;}i:64;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6434;}i:65;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6434;}i:66;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6438;}i:67;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6439;}i:68;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6439;}i:69;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:6439;}i:70;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:93:"
def dump(obj):
  for attr in dir(obj):
    print "obj.%s = %s" % (attr, getattr(obj, attr))
";i:1;N;i:2;N;}i:2;i:6445;}i:71;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6546;}i:72;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6546;}}