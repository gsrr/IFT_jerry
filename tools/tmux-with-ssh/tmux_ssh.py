import os
import commands

ppid = os.getppid()
cmd = "ps -ef | grep %s"%str(ppid)
out = commands.getoutput(cmd).splitlines()
ip = ""
for line in out:
    line = line.strip()
    if "tmux" in line:
       ip = line.split()[-1].strip()

os.system("ssh %s"%ip)
