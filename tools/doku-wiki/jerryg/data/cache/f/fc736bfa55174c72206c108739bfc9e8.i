a:65:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:0;}i:3;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:0;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:4;}i:5;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:23:"tool:python:time_module";i:1;s:20:"Usage of time module";}i:2;i:5;}i:6;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:53;}i:7;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:53;}i:8;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:53;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"struct.pack";i:1;i:1;i:2;i:55;}i:2;i:55;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:55;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:478:"
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
";i:1;N;i:2;N;}i:2;i:86;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:573;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"debug with gdb";i:1;i:1;i:2;i:573;}i:2;i:573;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:573;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:573;}i:16;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:41:"https://docs.python.org/devguide/gdb.html";i:1;N;}i:2;i:602;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:647;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:653;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:512:"
# Reference
[DebuggingWithGdb]
https://wiki.python.org/moin/DebuggingWithGdb

[Extended gdb using python]
https://sourceware.org/gdb/onlinedocs/gdb/Python.html

# install package
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
";i:1;N;i:2;N;}i:2;i:653;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1174;}i:21;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"trace module";i:1;i:1;i:2;i:1174;}i:2;i:1174;}i:22;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1174;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1174;}i:24;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:27:"https://pymotw.com/2/trace/";i:1;N;}i:2;i:1201;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1232;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1238;}i:27;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:95:"
# For a simple list of the functions called
python -m trace --listfuncs trace_example/main.py
";i:1;N;i:2;N;}i:2;i:1238;}i:28;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1342;}i:29;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"object analysis";i:1;i:1;i:2;i:1342;}i:2;i:1342;}i:30;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1342;}i:31;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1370;}i:32;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1370;}i:33;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1370;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:" vars(object) , but not all objects have a ";}i:2;i:1374;}i:35;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:1417;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"dict";}i:2;i:1419;}i:37;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:1423;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:" member";}i:2;i:1425;}i:39;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1432;}i:40;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1432;}i:41;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1432;}i:42;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1432;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" dir(object)";}i:2;i:1436;}i:44;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1448;}i:45;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1448;}i:46;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1448;}i:47;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1448;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" getattr()";}i:2;i:1452;}i:49;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1462;}i:50;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1462;}i:51;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1462;}i:52;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1462;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:" type()";}i:2;i:1466;}i:54;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1473;}i:55;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1473;}i:56;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1473;}i:57;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1473;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1477;}i:59;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1478;}i:60;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1478;}i:61;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1478;}i:62;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:93:"
def dump(obj):
  for attr in dir(obj):
    print "obj.%s = %s" % (attr, getattr(obj, attr))
";i:1;N;i:2;N;}i:2;i:1484;}i:63;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1585;}i:64;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1585;}}