a:75:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:0;}i:3;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:0;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:4;}i:5;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:23:"tool:python:time_module";i:1;s:20:"Usage of time module";}i:2;i:5;}i:6;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:53;}i:7;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:53;}i:8;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:53;}i:9;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:53;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:57;}i:11;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:18:"tool:python:string";i:1;s:6:"string";}i:2;i:58;}i:12;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:87;}i:13;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:87;}i:14;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:87;}i:15;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"get reference count from gdb";i:1;i:1;i:2;i:90;}i:2;i:90;}i:16;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:90;}i:17;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1988:"
The reference count of each and every object is stored in the PyObject itself, in a variable called ob_refcnt.

typedef struct _object {
    _PyObject_HEAD_EXTRA
    Py_ssize_t ob_refcnt;          # Reference count
    struct _typeobject *ob_type;
} PyObject;

(gdb) info locals
sp = 0x7fe6c054c1e8
stack_pointer = <optimized out>
next_instr = <optimized out>
opcode = <optimized out>
oparg = <optimized out>
why = WHY_NOT
err = 0
x = <optimized out>
v = <optimized out>
w = <optimized out>
u = <optimized out>
t = <optimized out>
stream = 0x0
fastlocals = 0x7fe6c054c1c8
freevars = <optimized out>
retval = <optimized out>
tstate = <optimized out>
co = <optimized out>
instr_ub = -1
instr_lb = 0
instr_prev = -1
first_instr = <optimized out>
names = <optimized out>
consts = <optimized out>
(gdb) print fastlocals
$6 = (PyObject **) 0x7fe6c054c1c8
(gdb) print *fastlocals
$7 = <HAServer(setInfoLock={'NFSInfo': <thread.lock at remote 0x7fe6c0996730>, 'WEBDAVInfo': <thread.lock at remote 0x7fe6c09967f0>, 'FTPInfo': <thread.lock at remote 0x7fe6c09968f0>, 'ServiceInfo': <thread.lock at remote 0x7fe6c09968d0>, 'MonitorInfo': <thread.lock at remote 0x7fe6c0996970>, 'DiskInfo': <thread.lock at remote 0x7fe6c0996dd0>, 'ShareInfo': <thread.lock at remote 0x7fe6c06c1230>, 'MDInfo': <thread.lock at remote 0x7fe6c06c15b0>, 'AvInfo': <thread.lock at remote 0x7fe6c06c1410>, 'SystemInfo': <thread.lock at remote 0x7fe6c0996c30>, 'LVMInfo': <thread.lock at remote 0x7fe6c0996cf0>, 'UserInfo': <thread.lock at remote 0x7fe6c0996d30>, 'RSYNCDInfo': <thread.lock at remote 0x7fe6c0996870>, 'AFPInfo': <thread.lock at remote 0x7fe6c0996c50>, 'PasswdManageInfo': <thread.lock at remote 0x7fe6c0996d90>, 'NetworkInfo': <thread.lock at remote 0x7fe6c0996f10>, 'CIFSInfo': <thread.lock at remote 0x7fe6c06c1210>}, g_bgjobList=[], infoLocal={'NFSInfo': <NFSInfo(updateTime=<datetime.datetime at remote 0x7fe6c767c78...(truncated)
(gdb) print *(*fastlocals)
$8 = {ob_refcnt = 26, ob_type = 0x241feb0}
";i:1;N;i:2;N;}i:2;i:138;}i:18;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2136;}i:19;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"id and di";i:1;i:1;i:2;i:2136;}i:2;i:2136;}i:20;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2136;}i:21;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2250:"
import _ctypes

def di(obj_id):
    """ Inverse of id() function. """
    return _ctypes.PyObj_FromPtr(obj_id)

if __name__ == '__main__':
    a = 42
    b = 'answer'
    print(di(id(a)))  # -> 42
    print(di(id(b)))  # -> answer
    
<file>
====== unix domain socket ======
<file>
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
";i:1;N;i:2;N;}i:2;i:2165;}i:22;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4425;}i:23;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"socket exception";i:1;i:1;i:2;i:4425;}i:2;i:4425;}i:24;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4425;}i:25;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:913:"
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
";i:1;N;i:2;N;}i:2;i:4461;}i:26;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5384;}i:27;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"struct.pack";i:1;i:1;i:2;i:5384;}i:2;i:5384;}i:28;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:5384;}i:29;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:478:"
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
";i:1;N;i:2;N;}i:2;i:5415;}i:30;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5903;}i:31;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"trace module";i:1;i:1;i:2;i:5903;}i:2;i:5903;}i:32;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:5903;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5903;}i:34;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:27:"https://pymotw.com/2/trace/";i:1;N;}i:2;i:5930;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:5961;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5967;}i:37;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:95:"
# For a simple list of the functions called
python -m trace --listfuncs trace_example/main.py
";i:1;N;i:2;N;}i:2;i:5967;}i:38;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6071;}i:39;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"object analysis";i:1;i:1;i:2;i:6071;}i:2;i:6071;}i:40;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6071;}i:41;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6099;}i:42;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6099;}i:43;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6099;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:" vars(object) , but not all objects have a ";}i:2;i:6103;}i:45;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:6146;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"dict";}i:2;i:6148;}i:47;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:6152;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:" member";}i:2;i:6154;}i:49;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6161;}i:50;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6161;}i:51;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6161;}i:52;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6161;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" dir(object)";}i:2;i:6165;}i:54;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6177;}i:55;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6177;}i:56;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6177;}i:57;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6177;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" getattr()";}i:2;i:6181;}i:59;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6191;}i:60;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6191;}i:61;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6191;}i:62;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6191;}i:63;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:" type()";}i:2;i:6195;}i:64;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6202;}i:65;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6202;}i:66;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6202;}i:67;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6202;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6206;}i:69;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6207;}i:70;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6207;}i:71;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:6207;}i:72;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:93:"
def dump(obj):
  for attr in dir(obj):
    print "obj.%s = %s" % (attr, getattr(obj, attr))
";i:1;N;i:2;N;}i:2;i:6213;}i:73;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6314;}i:74;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6314;}}