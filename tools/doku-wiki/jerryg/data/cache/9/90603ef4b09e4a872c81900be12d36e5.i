a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Network";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1967:"
# Reference:
http://www.binarytides.com/linux-commands-monitor-network/

# sar -n DEV 1
09:13:23 AM     IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
09:13:24 AM   iftnic4      0.00      0.00      0.00      0.00      0.00      0.00      0.00
09:13:24 AM   iftnic3     47.89      0.00      7.23      0.00      0.00      0.00      0.00
09:13:24 AM   iftnic0      5.63      5.63      0.71      0.68      0.00      0.00      0.00
09:13:24 AM        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
09:13:24 AM     mgmt0     52.11      4.23      7.76      1.38      0.00      0.00      0.00
09:13:24 AM   docker0      0.00      0.00      0.00      0.00      0.00      0.00      0.00

IFACE: 代表網路的界面。
rxpck/s: 每秒所接收到的封包個數。
txpck/s: 每秒所傳送的封包個數。
rxkB/s: 每秒接收的資料量(KB)。
txkB/s: 每秒傳送的資料量(KB)。
rxcmp/s: 每秒接收到經壓縮的封包數量。
txcmp/s: 每秒所傳送的經壓縮的封包數量。
rxmcst/s: 每秒接收到的multicast封包數量。

# nethogs
    PID USER        PROGRAM                          DEV         SENT        RECEIVED                                                                                       
    14006 root     /usr/local/jre1.7.0_80/bin/java   iftnic      2.433       3.933 KB/sec                                                                       
    21740 root     /usr/bin/python                   iftnic     26.698       1.744 KB/sec                                                                                     
    7103  root     python                            iftnic      0.193       0.202 KB/sec                                                                                             
    13395 root     sshd: root@pts/11                 iftnic      0.208       0.047 KB/sec                                                                              

";i:1;N;i:2;N;}i:2;i:28;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2004;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2004;}}