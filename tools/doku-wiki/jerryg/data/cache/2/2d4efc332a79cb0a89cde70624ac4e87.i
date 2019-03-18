a:44:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"Ex1";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:10:"listo_open";i:1;a:0:{}i:2;i:18;}i:4;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:18;}i:5;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:18;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Int ";}i:2;i:22;}i:7;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:27;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"> types.c_int(1000)";}i:2;i:29;}i:9;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:48;}i:10;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:48;}i:11;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:48;}i:12;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:48;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:" Pointer to a integer ";}i:2;i:52;}i:14;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:74;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"> num = ctypes.c_int(10) ";}i:2;i:76;}i:16;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:101;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"> pn = ctypes.pointer(num)";}i:2;i:103;}i:18;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:129;}i:19;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:129;}i:20;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:129;}i:21;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:129;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:" Pointer to a string ";}i:2;i:133;}i:23;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:154;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"> ctypes.c_char_p(";}i:2;i:156;}i:25;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:174;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"Hello World";}i:2;i:175;}i:27;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:186;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:")";}i:2;i:187;}i:29;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:188;}i:30;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:188;}i:31;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:188;}i:32;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:188;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:" Pointer to a integer array ";}i:2;i:192;}i:34;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:220;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"> arr = (ctypes.c_int * 10)() ";}i:2;i:222;}i:36;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:252;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:53:"> gs = ctypes.cast(arr, ctypes.POINTER(ctypes.c_int))";}i:2;i:254;}i:38;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:307;}i:39;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:307;}i:40;a:3:{i:0;s:11:"listo_close";i:1;a:0:{}i:2;i:307;}i:41;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:665:"

import sys
import pwd
import ctypes

def get_uid_groups(uid):
    libc = ctypes.CDLL("libc.so.6")
    pw = pwd.getpwuid(uid)
    user = ctypes.c_char_p(pw.pw_name)
    gid = ctypes.c_int(pw.pw_gid)
    num = ctypes.c_int(10)
    arr = (ctypes.c_int * 10)()
    pn = ctypes.pointer(num)
    gs = ctypes.cast(arr, ctypes.POINTER(ctypes.c_int))

    while True:
        ngroup = libc.getgrouplist(user, gid, gs, pn)
        if ngroup == -1:
            num = c_int(num.value * 2)
            pn = ctypes.pointer(num)
        elif ngroup >= 0:
            return (ngroup, gs)


def main():
    print get_uid_groups(100001)

if __name__ == "__main__":
    main()
    
";i:1;N;i:2;N;}i:2;i:313;}i:42;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:986;}i:43;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:986;}}