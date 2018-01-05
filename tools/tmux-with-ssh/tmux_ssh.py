import os
import commands


'''
# result of (ps -ef | grep $ppid)
root      8885     1  0 04:29 ?        00:00:00 tmux new -s 172.27.120.7 ssh root@172.27.120.7
root      8886  8885  0 04:29 pts/1    00:00:00 ssh root@172.27.120.7
root      8892  8885  3 04:29 pts/3    00:00:00 python /root/.tmux/python/tmux_ssh.py
root      8894  8892  0 04:29 pts/3    00:00:00 sh -c { ps -ef | grep 8885; } 2>&1
root      8896  8894  0 04:29 pts/3    00:00:00 grep 8885
'''
ppid = os.getppid()
cmd = "ps -ef | grep %s"%str(ppid)
out = commands.getoutput(cmd).splitlines()
ip = ""
for line in out:
    line = line.strip()
    if "tmux new" in line:
       ip = line.split()[-1].strip()

os.system("ssh %s"%ip)
