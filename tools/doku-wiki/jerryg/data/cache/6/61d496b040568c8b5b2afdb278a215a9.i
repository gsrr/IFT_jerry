a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:824:"
1. 將以下這個檔案放到HA的資料夾底下: 
  1.1 http://172.27.112.206/files/jtrace.py

2. 在HA裡面:
  2.1 import jtrace
  2.2 main function 加上 jtrace.jtrace_listen()

3. Enable jtrace module
  3.1 Enable -->  kill -SIGUSR1 $pid
  3.2 會在HA資料夾裡面產生trace.log
  3.3 example:
    [2017-09-26 10:39:12.948081]return::_note::None
    [2017-09-26 10:39:12.948639]call::__delete::{'self': <_MainThread(MainThread, stopped 140300591281984)>}
    [2017-09-26 10:39:12.949141]return::__delete::None
    [2017-09-26 10:39:12.949524]return::_exitfunc::None
    [2017-09-26 10:39:12.949938]call::_run_exitfuncs::{}
    [2017-09-26 10:39:12.950368]call::shutdown::{'handlerList': []}
    [2017-09-26 10:39:12.950829]return::shutdown::None
    [2017-09-26 10:39:12.951544]return::_run_exitfuncs::None​

";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}