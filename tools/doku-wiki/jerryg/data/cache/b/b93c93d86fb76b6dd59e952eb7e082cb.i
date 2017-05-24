a:32:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"Core dump file analysis";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:38;}i:4;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:38;}i:5;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:38;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:" example : gdb /usr/bin/smbd path/to/the/core";}i:2;i:42;}i:7;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:87;}i:8;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:87;}i:9;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:87;}i:10;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:930:"
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

gdb binary path of corefile

This will load the corefile.

4- Then you can get the information using bt command. For detailed backtrace use bt full.

5- To print the variables use print variable-name or p variable-name

6- To get any help on gdb use help option or use apropos search-topic

7- Use frame frame-number to go to desired frame number.

8- Use up n and down n commands to select frame n frames up and select frame n frames down respectively.

9- To stop gdb use quit or q.
";i:1;N;i:2;N;}i:2;i:93;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1032;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"x command";i:1;i:1;i:2;i:1032;}i:2;i:1032;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1032;}i:14;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1055;}i:15;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1055;}i:16;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1055;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:76:" Displays the memory contents at a given address using the specified format.";}i:2;i:1059;}i:18;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1135;}i:19;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1135;}i:20;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1135;}i:21;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1135;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1139;}i:23;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1140;}i:24;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1140;}i:25;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1140;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1140;}i:27;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:44:"http://visualgdb.com/gdbreference/commands/x";i:1;N;}i:2;i:1141;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1189;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1189;}i:30;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1189;}i:31;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1189;}}