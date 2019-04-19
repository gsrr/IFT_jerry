a:10:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Basic";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:365:"
# source code and help
1. https://www.gnu.org/software/global/
2. http://tieba.baidu.com/p/3543479318


# create tag files
gtags  
1. in source code working space
2. it will create three files:
  2.1 GTAGS：所有变量，函数定义的相关信息
  2.2 GRTAGS：所有变量，函数被引用的相关信息
  2.3 GPATH：源代码中每个文件的信息。

";i:1;N;i:2;N;}i:2;i:26;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:402;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"work with cscope";i:1;i:1;i:2;i:402;}i:2;i:402;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:402;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:645:"
# help
1. http://cscope.sourceforge.net/cscope_vim_tutorial.html
2. http://forum.ubuntu.org.cn/viewtopic.php?t=343460

# setting in vim
set csprg=gtags-cscope
cs add GTAGS

#cscope.vim
http://cscope.sourceforge.net/cscope_maps.vim

# command of cscope 
## find symbol
:cscope find symbol getent(== cs f s getent)

## Find functions calling this function
:cs find call getent(== cs f c getent) 

## Find file by name
:cs find file getent(== cs f f getent) 

# example 1 --> getent group
cs f s winbind_getgrent --> cs f g winbindd_request_response 
--> cs f g winbindd_send_request --> cs f g winbindd_get_response --> cs f g winbind_read_sock

";i:1;N;i:2;N;}i:2;i:438;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1092;}i:9;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1092;}}