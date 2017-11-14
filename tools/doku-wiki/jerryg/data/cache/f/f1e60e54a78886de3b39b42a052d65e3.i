a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1702:"
Q2 : compare with system() function
Ans :
System : 
1. Calls out to sh to handle your command line.
2. It waits for the child process to exit.
3. It is a potential security hazard if you pass it a string from an untrusted source.
4. It is slower than a direct fork/exec.

Fork with Exec:
1. The fork system call will duplicate a process with different pid.
2. The exec system call will execute another process to replace the original process.(with the same pid)
3. We could duplicate its functionality as system() using some combination fork(), exec(), and wait().

Q1 : 
fork出來的child若結束後, 會產生zombie (defunc process)

Ans:
因為fork 出來的child, 在結束後會發出SIGCHILD通知parent, 如果parent沒有接收或是忽略的話, child就會被迫等待.(無法結束而成為zombie)

這部分在parent有幾種處理方法:
1. 處理signal SIGCHILD:
def handler(signum, frame):
    print 'Signal handler called with signal', signum
    os.waitpid(0, os.WNOHANG)
    
signal.signal(signal.SIGALRM, handler)
'''
0 :: the request is for the status of any child in the process group of the current process
-1 :: the request pertains to any child of the current process.
os.WNOHAN :: 如果没有任何已经结束的子进程则马上返回，不予以等
待。
'''

2. 忽略signal SIGCHILD:
signal.signal(signal.SIGALRM, signal.SIG_INT)

但前面兩個方法都會影響到其他的地方, 像有些呼叫commands.getoutout的話就會受到影響.
所以要捕捉特定的child.
3. 
for child in childs:
    try:
        os.waitpid(child, os.WNOHANG)
    except:
        childs.remove(child) #child 不存在會發出exception.
'''
os.waitpid()會回傳tuple (pid,0)
'''
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}