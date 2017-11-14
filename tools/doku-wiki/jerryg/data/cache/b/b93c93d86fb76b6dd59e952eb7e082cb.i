a:32:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"Core dump file analysis";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:38;}i:4;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:38;}i:5;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:38;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:" example : gdb /usr/bin/smbd path/to/the/core";}i:2;i:42;}i:7;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:87;}i:8;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:87;}i:9;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:87;}i:10;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2140:"
# gdb print value of whole array
(gdb) p *array@len

(gdb) p/x *blob.data@468
$21 = {0x4, 0x0, 0x4, 0x0, 0x0, 0x0, 0x2, 0x0, 0x4, 0x0, 0x2, 0x0, 0x1, 0x0, 0x26, 0x89, 0x39, 0xba, 0xdd, 0x76, 0x94, 0xf7, 0x30, 0x1e, 0x1e, 0x56, 0x8c,
  0x14, 0x60, 0x73, 0xc5, 0x74, 0xd4, 0x11, 0x98, 0xb6, 0x23, 0xc6, 0xaa, 0xad, 0x6c, 0xa4, 0x58, 0xb3, 0x55, 0x65, 0x0 <repeats 32 times>, 0x70, 0x6f,
  0x73, 0x69, 0x78, 0x5f, 0x61, 0x63, 0x6c, 0x0, 0x4, 0xaa, 0xf7, 0x3d, 0xda, 0x4e, 0xd3, 0x1, 0x76, 0xc4, 0xcc, 0xf8, 0xf8, 0x5b, 0x2a, 0x55, 0x86, 0xae,
  0x49, 0x5b, 0xa1, 0x19, 0x27, 0x1d, 0x60, 0x8f, 0xfe, 0x81, 0x9d, 0x95, 0xa9, 0x6c, 0x18, 0x24, 0x35, 0x40, 0x33, 0x2c, 0xbc, 0x1, 0x0 <repeats 32 times>,
  0x1, 0x0, 0x4, 0x9c, 0xb4, 0x0, 0x0, 0x0, 0xd0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xe0, 0x0, 0x0, 0x0, 0x1, 0x5, 0x0, 0x0, 0x0, 0x0, 0x0, 0x5, 0x15, 0x0,
  0x0, 0x0, 0x9a, 0x51, 0xc0, 0xfd, 0x13, 0xe, 0x69, 0xd1, 0xe9, 0x71, 0xd2, 0xbc, 0xe8, 0x3, 0x0, 0x0, 0x1, 0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x16, 0x2, 0x0,
  0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x0, 0xf4, 0x0, 0x9, 0x0, 0x0, 0x0, 0x0, 0x3, 0x24, 0x0, 0xff, 0x1, 0x1f, 0x0, 0x1, 0x5, 0x0, 0x0...}

Ref : https://sourceware.org/gdb/onlinedocs/gdb/Arrays.html

# gdb print hex value
p/x var

# jump to another frame
frame #n


Some generic help:

gdb start GDB, with no debugging les

gdb program begin debugging program

gdb program core debug coredump core produced by program

gdb --help describe command line options

1- First of all find the directory where the corefile is generated.

2- Then use ls -ltr command in the directory to find the latest generated corefile.

3- To load the corefile use

gdb binary path_of_corefile

This will load the corefile.

4- Then you can get the information using bt command. For detailed backtrace use bt full.

5- To print the variables use print variable-name or p variable-name

6- To get any help on gdb use help option or use apropos search-topic

7- Use frame frame-number to go to desired frame number.

8- Use up n and down n commands to select frame n frames up and select frame n frames down respectively.

9- To stop gdb use quit or q.
";i:1;N;i:2;N;}i:2;i:93;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2242;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"x command";i:1;i:1;i:2;i:2242;}i:2;i:2242;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2242;}i:14;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:2265;}i:15;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2265;}i:16;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2265;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:76:" Displays the memory contents at a given address using the specified format.";}i:2;i:2269;}i:18;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2345;}i:19;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2345;}i:20;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2345;}i:21;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2345;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:2349;}i:23;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2350;}i:24;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2350;}i:25;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2350;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2350;}i:27;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:44:"http://visualgdb.com/gdbreference/commands/x";i:1;N;}i:2;i:2351;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:2399;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2399;}i:30;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2399;}i:31;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2399;}}