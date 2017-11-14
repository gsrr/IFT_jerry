a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:346:"
# scan network
ex:
nmap -sP 172.27.112.0/24

MAC Address: 00:30:48:32:DF:58 (Supermicro Computer)                        
Nmap scan report for 172.27.112.245                                            
Host is up (0.0015s latency).

# scan the machine who open port 5566
nmap -vv -p 5566 172.27.112.0/24

# scan tcp port
nmap -sT 172.27.120.131
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}