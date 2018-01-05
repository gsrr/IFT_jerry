a:60:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"command line window";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:156:"
# help menu for command line window
help c_ctrl-f

# error indent while pasting code fragment from website
--> cause by auto-indent
set paste
set nopaste

";i:1;N;i:2;N;}i:2;i:41;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:206;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"Show all character";i:1;i:1;i:2;i:206;}i:2;i:206;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:206;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:21:"
set list
set nolist
";i:1;N;i:2;N;}i:2;i:244;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:275;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Vim 的纵向编辑模式";i:1;i:1;i:2;i:275;}i:2;i:275;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:275;}i:11;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:275;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"第一步：修改";}i:2;i:315;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:339;}i:14;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:426:"
将 IP 数列中第二段所有数字“1” 修改为“5”：
将游标定位第一个行 IP 地址第二段的“1”
ctrl-v 进入纵向编辑模式
G 移动游标到最后一行，可视块覆盖所要修改的列
r 进入修改模式
5 输入数字“5”
ESC 退出纵向编辑模式，同时所有被选中的数字都被改成了“5”，并回到命令模式
结果如下：
 10.5.5.214 
 10.5.5.212 
 10.5.5.210
";i:1;N;i:2;N;}i:2;i:339;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:339;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"第二步：前添加";}i:2;i:774;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:801;}i:18;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:462:"
在所有行之前添加“ping – c 4 ”：
将游标定位到第一行第一列
ctrl-v 进入纵向编辑模式
G 移动游标到最后一行第一列，可视块覆盖了第一列
I 进入行首插入模式
ping -c 4 输入所要求字符“ping – c 4 ”
ESC 退出纵向编辑模式的同时所有选中的字符前都添加了“ping – c 4 ”，回到命令模式
结果如下：
 ping -c 4 10.5.5.214 
 ping -c 4 10.5.5.212 
 ping -c 4 10.5.5.210
";i:1;N;i:2;N;}i:2;i:801;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:801;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"第三步：后添加";}i:2;i:1272;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1299;}i:22;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:507:"
在所有行之后添加“>> result0”：
将游标定位到第一行最后一列
ctrl-v 进入纵向编辑模式
G 移动游标到最后一行最后一列，VISUAL 　 BLOCK 　覆盖了最后一列
A 进入行尾插入模式
>> result	输入所要求字符“>> result0”
ESC 退出纵向编辑模式的同时所有选中的字符后都添加了“ >> result0”，回到命令模式
结果如下：
 ping -c 4 10.5.5.214 >> result0 
 ping -c 4 10.5.5.212 >> result0 
 ping -c 4 10.5.5.210 >> result0
";i:1;N;i:2;N;}i:2;i:1299;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1815;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:2:"^M";i:1;i:1;i:2;i:1815;}i:2;i:1815;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1815;}i:26;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1832;}i:27;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1832;}i:28;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1832;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:" ^M 要用 ctrl-V ctrl-M 打出來. 並不是 ^ 加上 M .";}i:2;i:1836;}i:30;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1894;}i:31;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1894;}i:32;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1894;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1895;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"Replace string1 to string2";i:1;i:1;i:2;i:1895;}i:2;i:1895;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1895;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1895;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"%s/string1/string2/g";}i:2;i:1937;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1957;}i:39;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1957;}i:40;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1957;}i:41;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1957;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:" %:scope is full file ";}i:2;i:1961;}i:43;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1983;}i:44;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1983;}i:45;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1983;}i:46;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1983;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:" Ordered List Itemno % ";}i:2;i:1987;}i:48;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:2010;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"> scope is current line";}i:2;i:2012;}i:50;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2035;}i:51;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2035;}i:52;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2035;}i:53;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2035;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:" Ordered List Itemg:replace all matched words in this scope.";}i:2;i:2039;}i:55;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2099;}i:56;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2099;}i:57;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2099;}i:58;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2100;}i:59;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2100;}}