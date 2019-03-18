a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"Deadlock of subprocess.Popen";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:517:"
# Root cause
The parent process communicate with subprocess through pipe, 
and the pipe buffer will full if parent process doesn't read data from pipe.


# execution
python test.py

# test.py
import subprocess
import time

proc = subprocess.Popen("bash test.sh", shell = True, stdout = subprocess.PIPE)
while True:
        line = proc.stdout.readline()
        print line
        time.sleep(1)
        
# test.sh
cnt=0
while true
do
        sleep 0.1
        echo "$cnt, Hello World...."
        cnt=$((cnt+1))
done
";i:1;N;i:2;N;}i:2;i:49;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:574;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:574;}}