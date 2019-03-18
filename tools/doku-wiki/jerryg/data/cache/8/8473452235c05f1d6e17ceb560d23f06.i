a:30:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Summary";i:1;i:1;i:2;i:2;}i:2;i:2;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:269:"
1. Why -v (verbose) options is useless for rsync daemon mode?
Ans :
1. The -v option is useless because the default setting of "max verbosity" is 1. (int /etc/rsyncd.conf)
2. Change the number of "max verbosity", then we can control verbose level of server by client.
";i:1;N;i:2;N;}i:2;i:29;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:309;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"Rsyncd Performance";i:1;i:1;i:2;i:309;}i:2;i:309;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:309;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:342;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Compare with ftp";i:1;i:2;i:2;i:342;}i:2;i:342;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:342;}i:10;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:5147:"
ftp:
[root@nas_852612_a src]# time python pftp.py

real    1m3.404s
user    0m3.298s
sys     0m7.866s

% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 54.76    4.537973          26    175004           sendto
 25.75    2.134117          13    165200           read
  5.66    0.468815          23     20005           recvfrom
  4.29    0.355493          71      5001           connect
  4.18    0.346338          34     10140           close
  1.32    0.109400          11     10192           fstat
  1.28    0.106264          19      5610       474 open
  1.08    0.089352          18      5058           munmap
  0.77    0.063540          13      5001           socket
  0.76    0.062755          12      5143           mmap
  0.06    0.005372          27       200       162 stat
  0.05    0.003783          56        68           rt_sigaction
  0.02    0.001437          22        64           mprotect
  0.01    0.001008          27        38           brk
  0.01    0.000487          14        36           lseek
  0.00    0.000361          36        10           getdents
  0.00    0.000217          36         6         2 readlink
  0.00    0.000209         105         2         2 access
  0.00    0.000152          30         5         1 ioctl
  0.00    0.000104         104         1           futex
  0.00    0.000097          16         6           lstat
  0.00    0.000075          75         1           geteuid
  0.00    0.000061          61         1           rt_sigprocmask
  0.00    0.000057          57         1           set_robust_list
  0.00    0.000056          56         1           getrlimit
  0.00    0.000042          42         1           set_tid_address
  0.00    0.000031          31         1           arch_prctl
  0.00    0.000011          11         1           execve
  0.00    0.000000           0         3           write
  0.00    0.000000           0         1           getcwd
  0.00    0.000000           0         3           gettimeofday
  0.00    0.000000           0         1           getuid
  0.00    0.000000           0         1           getgid
  0.00    0.000000           0         1           getegid
  0.00    0.000000           0         2         2 statfs
  0.00    0.000000           0         3           openat
------ ----------- ----------- --------- --------- ----------------
100.00    8.287607                406812       643 total


rsync:
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 31.35    0.224479          34      6693         3 select
 30.05    0.215182          32      6692         4 read
 29.72    0.212819          21     10068      5003 lstat
  3.90    0.027943         167       167           write
  1.22    0.008764          67       130        52 open
  0.67    0.004782          98        49           rename
  0.58    0.004119          40       103           close
  0.53    0.003798          78        49           chmod
  0.45    0.003187          64        50           utimensat
  0.38    0.002700          54        50           fchmod
  0.19    0.001360          29        47           mmap
  0.14    0.001024          39        26           munmap
  0.11    0.000816          51        16           sendto
  0.09    0.000636          24        26           fstat
  0.08    0.000562          62         9         5 wait4
  0.07    0.000511          43        12           mprotect
  0.07    0.000477          34        14        10 connect
  0.05    0.000371          21        18           fcntl
  0.05    0.000343          25        14           socket
  0.05    0.000324          41         8           poll
  0.04    0.000260          22        12           gettimeofday
  0.03    0.000193          24         8         2 stat
  0.03    0.000186          93         2           accept
  0.02    0.000177          44         4           getdents
  0.02    0.000165          41         4         2 rt_sigreturn
  0.02    0.000134          34         4           recvfrom
  0.02    0.000118          30         4           getpeername
  0.01    0.000102          26         4           ioctl
  0.01    0.000097          97         1           unlink
  0.01    0.000082          41         2           socketpair
  0.01    0.000080          40         2           openat
  0.01    0.000071           7        10           rt_sigaction
  0.00    0.000028          14         2           chdir
  0.00    0.000025          13         2         1 kill
  0.00    0.000022          11         2           setsockopt
  0.00    0.000019           5         4           geteuid
  0.00    0.000017           9         2           setgroups
  0.00    0.000013           7         2           setuid
  0.00    0.000013           7         2           setgid
  0.00    0.000011           6         2           setresuid
  0.00    0.000010           3         4           clone
------ ----------- ----------- --------- --------- ----------------
100.00    0.716020                 24320      5082 total
";i:1;N;i:2;N;}i:2;i:377;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:3572:"
Q1 : strace 的時間意思?
Ans : 
1. strace裡面所記錄的秒數是 : CPU time spent running in the kernel



====================================================================

方向大概有幾個, system call的部分:
io read/write, rsyncd flow

3000機器(CPU比較好):
Each sample counts as 0.01 seconds.
  %   cumulative   self              self     total
 time   seconds   seconds    calls   s/call   s/call  name
 98.56      2.73     2.73    50024     0.00     0.00  md5_process
  1.08      2.76     0.03   641060     0.00     0.00  writefd_unbuffered
  0.36      2.77     0.01                             mdfour
  0.00      2.77     0.00   641210     0.00     0.00  msg_flush
  0.00      2.77     0.00   320535     0.00     0.00  mplex_write

[root@nas_8716691_a Volume_1]# time rsync -a rsrc/ admin@172.27.114.98::dst  (with checksum)

real    0m4.249s
user    0m0.202s
sys     0m1.340s


[root@nas_8716691_a Volume_1]# time rsync -a rsrc/ admin@172.27.114.98::dst 

real    0m6.822s
user    0m3.560s
sys     0m1.270s

=======================================================================

因為rsync每備份一段data, 都會更新該file的check_sum (md5).
所以從gprof所得到的資料判斷, check sum佔了主要時間因素.
time   seconds   seconds    calls   s/call   s/call  name
 97.38      3.71     3.71    50028     0.00     0.00  md5_process
  0.79      3.74     0.03   641125     0.00     0.00  writefd_unbuffered
  0.26      3.75     0.01   641274     0.00     0.00  msg_flush
  0.26      3.76     0.01   320567     0.00     0.00  mplex_write
  0.26      3.77     0.01   146267     0.00     0.00  writefd

將server side與client side的checksum機制關掉:
/*sum_update(data, i);*/

重新測試的結果如下:
(GS --> GS, client與server都關掉)
[root@nas_852612_a Volume_2]# time rsync -a dst/ admin@87.87.87.10::dst

real    0m10.163s
user    0m0.595s
sys     0m4.796s

[root@nas_852612_a Volume_2]# time rsync -a dst/ admin@87.87.87.10::dst

real    0m9.778s
user    0m0.651s
sys     0m4.564s

(Windows --> GS, Server無checksum , client有)
C:\cwRsync\bin>timer
14:07:27.31 - 14:07:12.36 = 14.95

C:\cwRsync\bin>timer
14:07:49.53 - 14:07:34.84 = 14.69

C:\cwRsync\bin>timer
14:08:12.45 - 14:07:57.07 = 15.38

% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 45.82    3.216396           5    651123         3 select
 44.15    3.098948           5    646114         1 read
  5.48    0.384756          38     10065           write
  1.25    0.087886           9     10018      5003 open
  0.87    0.060944          12      5002           rename
  0.80    0.056339           6     10007      5002 lstat
  0.50    0.035446           7      5026           close


================================================================
Q11 : rsync效能 in 一般的share folder (not cache mode)
Ans : 

@echo off
echo %time% < nul
rsync -a /cygdrive/c/cwRsync/src/ admin@87.87.87.10::dst
echo %time% < nul

Windows to GS (10G to 10G)
rsync -a /cygdrive/c/cwRsync/src/ admin@87.87.87.10::dst
(with rename)
16:03:25.17 to 16:03:42.91 --> 18.8s --> 265.95 files/s

rsync -a --inplace /cygdrive/c/cwRsync/src/ admin@87.87.87.10::dst
16:06:45.43 to 16:07:07.57 --> 22s --> 227 files/s

GS to GS (local side, 10G)
[root@nas_852612_a Volume_2]# time rsync -a src/ admin@87.87.87.10::dst
(with rename)
real    0m16.427s --> 304.37 files/s

[root@nas_8822956_a Volume_1]# time rsync -a --inplace src/ admin@87.87.87.10::dst
real   0m25.834s --> 193.57 files/s

";i:1;N;i:2;N;}i:2;i:5539;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9121;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:44:"perf - delta algorithm & w/o delta algorithm";i:1;i:1;i:2;i:9121;}i:2;i:9121;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:9121;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:3199:"
Q10 : rsync delta algorithm 與沒有delta algorithm的比較?
Ans :
[root@nas_8739457_a Volume_2]# time rsync -aW --progress src/file50M admin@172.27.112.254::aaa
sending incremental file list
file50M
     1049600 100%  323.24MB/s    0:00:00 (xfer#1, to-check=0/1)

sent 1049799 bytes  received 27 bytes  2099652.00 bytes/sec
total size is 1049600  speedup is 1.00

real    0m0.166s
user    0m0.006s
sys     0m0.000s


[root@nas_8739457_a Volume_2]# cat src/file1K >> src/file50M
[root@nas_8739457_a Volume_2]# time rsync -a --progress src/file50M admin@172.27.112.254::aaa
sending incremental file list
file50M
     1050624 100%  166.83MB/s    0:00:00 (xfer#1, to-check=0/1)

sent 4171 bytes  received 6177 bytes  20696.00 bytes/sec
total size is 1050624  speedup is 101.53

real    0m0.216s
user    0m0.007s
sys     0m0.001s
(len: 1024)

[root@nas_8739457_a Volume_2]# time rsync -aW --progress src/file100M admin@172.27.112.254::aaa
sending incremental file list
file100M
   105906176 100%   90.47MB/s    0:00:01 (xfer#1, to-check=0/1)

sent 105919173 bytes  received 27 bytes  42367680.00 bytes/sec
total size is 105906176  speedup is 1.00

real    0m1.277s
user    0m0.305s
sys     0m0.112s
[root@nas_8739457_a Volume_2]# cat src/file1M >> src/file100M
[root@nas_8739457_a Volume_2]# time rsync -a --progress src/file100M admin@172.27.112.254::aaa
sending incremental file list
file100M
   106954752 100%  167.75MB/s    0:00:00 (xfer#1, to-check=0/1)

sent 51145 bytes  received 72092 bytes  82158.00 bytes/sec
total size is 106954752  speedup is 867.88

real    0m1.120s
user    0m0.590s
sys     0m0.021s
(len: 10336)

[root@nas_8739457_a Volume_2]# time rsync -aW --progress src/file1G admin@172.27.112.254::aaa
sending incremental file list
file1G
  1049624576 100%   82.89MB/s    0:00:12 (xfer#1, to-check=0/1)

sent 1049752771 bytes  received 27 bytes  77759466.52 bytes/sec
total size is 1049624576  speedup is 1.00

real    0m12.350s
user    0m3.056s
sys     0m0.874s
[root@nas_8739457_a Volume_2]# cat src/file1M >> src/file1G
[root@nas_8739457_a Volume_2]# time rsync -a --progress src/file1G admin@172.27.112.254::aaa
sending incremental file list
file1G
  1050673152 100%  108.45MB/s    0:00:09 (xfer#1, to-check=0/1)

sent 174239 bytes  received 226855 bytes  25877.03 bytes/sec
total size is 1050673152  speedup is 2619.52

real    0m14.790s
user    0m5.933s
sys     0m0.300s
(len: 32408)

[root@nas_8739457_a Volume_2]# time rsync -a --progress src/file10G admin@172.27.112.254::aaa
sending incremental file list
file10G
  9520762880 100%   46.11MB/s    0:03:16 (xfer#1, to-check=0/1)

sent 463301 bytes  received 780595 bytes  5046.23 bytes/sec
total size is 9520762880  speedup is 7653.99

real    4m6.483s
user    0m53.511s
sys     0m3.011s

(len:97576)

[root@nas_8739457_a Volume_2]# cat src/file1M >> src/file10G
[root@nas_8739457_a Volume_2]# time rsync -aW --progress src/file10G admin@172.27.112.254::aaa
sending incremental file list
file10G
  9521811456 100%   65.57MB/s    0:02:18 (xfer#1, to-check=0/1)

sent 9522973857 bytes  received 27 bytes  68265045.76 bytes/sec
total size is 9521811456  speedup is 1.00

real    2m18.769s
user    0m28.206s
sys     0m7.860s

";i:1;N;i:2;N;}i:2;i:9184;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12394;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Rsync mechanism";i:1;i:1;i:2;i:12394;}i:2;i:12394;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:12394;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:8380:"
Q15 : 從server端看起來, 每次讀data之前都會先讀一個size, 但client在送的時候, 也是這樣送的嗎?
Ans : 
是的, 會先傳一個size再傳後面的data
248			write_int(f, n1);
249			write_buf(f, map_ptr(buf, offset+len, n1), n1);

Q14 : rsync 在client送資料時, 看起來是read 32k, 但每次送4k出去, 所以32k共送了8次, 但在Server端的行為是?
Ans : 
Server端看起來會先讀一個buffer size, 再讀後面的data.
if (residue == 0) {
	int32 i = read_int(f);
	if (i <= 0)
		return i;
	residue = i;
}

*data = buf;
n = MIN(CHUNK_SIZE,residue);
residue -= n;
read_buf(f,buf,n);


Q13 : rsync pipeline explaination
Ans : 
The above sections describe the process for constructing a copy of one
file on a remote system.  If we have a several files to copy, we can
gain a considerable latency advantage by pipelining the process.

This involves $\beta$ initiating two independent processes. One of the
processes generates and sends the checksums to $\alpha$ while the
other receives the difference information from $\alpha$ and
reconstructs the files. 

If the communications link is buffered then these two processes can
proceed independently and the link should be kept fully utilised in
both directions for most of the time.


Q12 : rsync在送資料時, 看起來每次只會送4k, is that true?
Ans :
while (len) {
		int n = MIN((int)len, IO_BUFFER_SIZE - iobuf_out_cnt);
		if (n > 0) {
			memcpy(iobuf_out+iobuf_out_cnt, buf, n);
			buf += n;
			len -= n;
			iobuf_out_cnt += n;
		}

		if (iobuf_out_cnt == IO_BUFFER_SIZE)
			io_flush(NORMAL_FLUSH);
}
這裡的IO_BUFFER_SIZE為:
#define IO_BUFFER_SIZE (4092) --> 4k

len為chunk_size:
#define CHUNK_SIZE (32*1024)
每次會從檔案讀取32k, 但write每次只有4k
write(3, "\265PH0\301\233\344]\217~\0\253\357\3766N\352\340V[\rn\274{;\303_EI\267\0064"..., 4092) = 4092




Q11 : 在write_unbuffered裡面會先進行select後, 再進行read, 這個select的目的是?
Ans :
從網路查到:

使用select函數的過程一般是：
先調用宏FD_ZERO將指定的fd_set清零，然後調用宏FD_SET將需要測試的fd加入fd_set，接著調用函數select測試fd_set中的所有fd，
最後用宏FD_ISSET檢查某個fd在函數select調用後，相應位是否仍然爲1。

也就是說, 這一段code的目的主要是在檢查該fd是否確認可寫.
因為:
因为select会修改其中间三个参数，即将没有准备好的socketfd剔除，FD_ISSET的作用就是判断该socketfd是否准备好了。
当然如果你只有一个socket的话，不用也行了。



Q10 : 為什麼rsync有兩支process在做事? 另外一支的作用是?
Ans : 
第一支是generator,  第二支是receiver, generator看起來是在進行flow 控制, receiver則是在進行檔案接收,
receiver在接收成功後會傳送MSG_SUCCESS給generator:
send_msg_int(MSG_SUCCESS, ndx);

或進行REDO動作:
send_msg_int(MSG_REDO, ndx);
(receiver主要的動作都在receive_files()裡面)

而generator主要是在read_msg_fd裡面等待receiver的訊息來決定後面的流程.



First --> 
#0  0x00007f7ef864b783 in __select_nocancel () from /lib64/libc.so.6
#1  0x00007f7ef8f837fe in read_timeout ()
#2  0x00007f7ef8f850f8 in readfd_unbuffered ()
#3  0x00007f7ef8f85163 in readfd ()
#4  0x00007f7ef8f82676 in read_msg_fd ()
#5  0x00007f7ef8f6cdbd in generate_files ()
#6  0x00007f7ef8f7806c in do_recv ()
#7  0x00007f7ef8f7866f in start_server ()
#8  0x00007f7ef8f95c82 in rsync_module ()
#9  0x00007f7ef8f9685f in start_daemon ()
#10 0x00007f7ef8f8b399 in start_accept_loop ()
#11 0x00007f7ef8f970ff in daemon_main ()
#12 0x00007f7ef8f5df3a in main ()


Second --> 
#0  0x00007f7ef864b783 in __select_nocancel () from /lib64/libc.so.6
#1  0x00007f7ef8f837fe in read_timeout ()
#2  0x00007f7ef8f84bfd in readfd_unbuffered.part.6 ()
#3  0x00007f7ef8f85163 in readfd ()
#4  0x00007f7ef8f88c01 in recv_token ()
#5  0x00007f7ef8f6d6eb in receive_data ()
#6  0x00007f7ef8f6ea95 in recv_files ()
#7  0x00007f7ef8f77f69 in do_recv ()
#8  0x00007f7ef8f7866f in start_server ()
#9  0x00007f7ef8f95c82 in rsync_module ()
#10 0x00007f7ef8f9685f in start_daemon ()
#11 0x00007f7ef8f8b399 in start_accept_loop ()
#12 0x00007f7ef8f970ff in daemon_main ()
#13 0x00007f7ef8f5df3a in main ()

Q9 : 為什麼rsync target相對於cp會比較慢?
Ans : 
因為cp只有open/ read / write, 但rsync多了getattr / setattr/ chmod/ rename這些動作.

Q8 : 當source拿到target的sums 資料後, 就會利用這個資料建立checksum的hash table, 那這個hash table裡面是長什麼樣子呢?
Ans :
hash_table裡面長怎樣還不確定, 但是整個流程大概是這樣--> 若file存在, client會先跟server要求該檔案的所有checksum, 
然後拿那個checksum在自己這邊建立hash_table, 接下來在自己的檔案從offset=0開始算checksum , 若有match的話,就送一個token給target, 叫target該段從自己的local file讀取, 否則就offset++, 再算下一段checksum, 若offset累積超過 s->blength+CHUNK_SIZE時, 就送到server.
Q8.1 :  但這裡有一個問題, 若offset一直到100才match, 那0~100的data要怎麼送過去Server?
Ans :
看起來, 若backup沒有到CHUNK_SIZE的話, 那當hash match的話就會一併將前面的offset與match到的token(會乘上-1)送過去.
在simple_send_token裡面, 會先判斷n是否大於0再送matched token. (n > 0代表offset跟last_match之間有data需要送過去.)

static void simple_send_token(int f, int32 token, struct map_struct *buf,
			      OFF_T offset, int32 n)
{
	if (n > 0) {
		int32 len = 0;
		while (len < n) {
			int32 n1 = MIN(CHUNK_SIZE, n-len);
			write_int(f, n1);
			write_buf(f, map_ptr(buf, offset+len, n1), n1);
			len += n1;
		}
	}
	/* a -2 token means to send data only and no token */
	if (token != -2)
		write_int(f, -(token+1));
}


Q8.2 : offset累積超過 s->blength+CHUNK_SIZE時,  就送出去給server, 為什麼要多加s->blength?
Ans : 
因為offset是從0 開始, 每次算checksum都是offset + s->blength - offset這個區間範圍, 所以當offset等於s.blength+CHUNK_SIZE, 就送出offset - s.blength, 剛好是一個CHUNK_SIZE.

Q7 : 那如果target端的檔案不存在, 那這個sum structure會回傳什麼?
Ans : 
相關資料都會是 0 , for example:
$9 = {flength = 140737347598600, sums = 0x0, count = 0, blength = 0, remainder = 0, s2length = 0}

-----------------------------
在receive_sums會從target端回傳一個checksum info structure, 其中包含一些資訊:
1. blength --> int, 表示每一個區段的大小
2. count --> int, 表示區段總數.
3. sums --> arr, 存放每一個區段的checksum.

-----------------------------
Q6 : 從Server的receive_data來看, 若match的話, receive_token會得到一個負值?
Ans : 
這是從Client端送過來的, 若match的話, client會送出token為 -1 * (token + 1):
write_int(f, -(token+1));
在Server如果看到是 <0 的話, 就代表該區段為match

Q5 : 那如果是target資料整個腰斬一半呢? 會變成Source要offset很久才找得到嗎?
Ans :
會, 因為offset從0開始比對, 所以會到很後面才找到.

Q4 : 這樣如果是Source端的一開始被插了一小段資料, 那不就會完全比對不到,且還多花時間進行比對?
Ans : 
這種狀況不會, 因為Source端會offset + 1來算checksum, 等過了那一小段資料後, checksum就可以在hash_table 裡面找到.

Q3 : 但資料有可能是target的一開始資料被位移一小段, 這時會怎麼比對?
Ans : 
Client的offset會從0開始, 逐漸加1來算checksum並進行比對.

Q2 : rsync 在檔案存在時的比對流程為?
Ans :
1. Server端計算該檔案的checksum (每1024個區間算一個)
2. Server將checksum資料送回給Client.
(client --> receive_sums(f_in))
3. Client建立 hash_table.
(client --> match_sums -->build_hash_table)
  - hash_table 裡面會存 target的check_sum
4. Client開始比對Server端送回的Checksum資料.
  -(client --> hash_search)
  - 透過hash_table比對出看是在哪一個位置.
5. 比對完後, 將match hits的資料送回給Server.
6. Server先觀看match hit的資料, 若有hit的地方就從自己的local file進行讀取, 若沒有hit就從Client端接收data.

Q1 : rsync 一開始的比對機制是?
Ans :
1. "quick  check" algorithm --> looks for files that have changed in size or  in  last-modified  time.
2. delta-transfer algorithm

";i:1;N;i:2;N;}i:2;i:12430;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:20820;}i:21;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"FAQ";i:1;i:1;i:2;i:20820;}i:2;i:20820;}i:22;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:20820;}i:23;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:4242:"
Q7 : rsync的hash與compare機制到底是?
Ans : 
1. wf_writeBufSize
2. wf_writeBufCnt
3. rsync會在sum structure裡面紀錄match hit的數目, 從recv_token會得到0, 代表有match, 這時就會從local file來讀取資料.


Q6 : 若要備份ACL時, 會發生Invalid argument.
異常:
getxattr("2.txt", "system.posix_acl_access", "\x02\x00\x00\x00\x01\x00\x06\x00\xff\xff\xff\xff\x04\x00\x05\x00\xff\xff\xff\xff\x08\x00\x05\x00d\x00\x00\x00\x10\x00\x06\x00\xff\xff\xff\xff \x00\x04\x00\xff\xff\xff\xff", 132) = 44
setxattr("2.txt", "system.posix_acl_access", "\x02\x00\x00\x00\x01\x00\x06\x00\xff\xff\xff\xff\x02\x00\x07\x00\xa2\x86\x01\x00\x02\x00\x07\x00\xa2\x86\x01\x00\x04\x00\x05\x00\xff\xff\xff\xff\x10\x00\x06\x00\xff\xff\xff\xff \x00\x04\x00\xff\xff\xff\xff", 52, 0) = -1 EINVAL (Invalid argument)

正常:
getxattr("1.txt", "system.posix_acl_access", "\x02\x00\x00\x00\x01\x00\x06\x00\xff\xff\xff\xff\x04\x00\x05\x00\xff\xff\xff\xff\x08\x00\x05\x00d\x00\x00\x00\x10\x00\x04\x00\xff\xff\xff\xff \x00\x04\x00\xff\xff\xff\xff", 132) = 44
setxattr("1.txt", "system.posix_acl_access", "\x02\x00\x00\x00\x01\x00\x06\x00\xff\xff\xff\xff\x02\x00\x07\x00\xa2\x86\x01\x00\x04\x00\x05\x00\xff\xff\xff\xff\x08\x00\x05\x00d\x00\x00\x00\x10\x00\x07\x00\xff\xff\xff\xff \x00\x04\x00\xff\xff\xff\xff", 52, 0) = 0

這是因為rsync 沒有加--numeric-ids的機制, 所以他會自動進行name mapping, 
而在進行name mapping時, 因為source file的user為100001(test)與100002(jason)
而target file的user為100001(aa)與100002(test)
這時在target設定acl時, 100001(test)會進行轉換, 變成100002, 而jason因為找不到對應的user,所以還是會維持100002.
導致ACL設定時發生錯誤.

只要執行以下command就可以了:
rsync -aA --numeric-ids root@172.27.113.26:/root/target/ /root/target/ 


[root@nas_8739447_a cache]# getfacl 3.txt
# file: 3.txt
# owner: root
# group: root
user::rw-
group::r-x                      #effective:r--
group:users:r-x                 #effective:r--
mask::r--
other::r--

[root@nas_8739447_a cache]# setfacl -m 'u:jason:rwx' 3.txt
[root@nas_8739447_a cache]# getfacl 3.txt
# file: 3.txt
# owner: root
# group: root
user::rw-
user:jason:rwx
group::r-x
group:users:r-x
mask::rwx
other::r--

# 由sync cloud cache下載後?
[root@nas_8739447_a cache]# getfacl 3.txt
# file: 3.txt
# owner: root
# group: root
user::rw-
user:test:rwx                   #effective:rw-
user:jason:rwx                  #effective:rw-
group::r-x                      #effective:r--
mask::rw-
other::r--

Q5 : 目前看起來, rsync會先比對hash code, 後面再進行檔案傳送, 可是為什麼檔案一樣(只有mtime不同), 這樣還會做上傳動作?
Ans :

Q1 : file path在一般的mount point 下與在fuse的mount point下有什麼不一樣?
Ans :
路徑會不一樣, 我們可以分成
xfs_path : /Pool-1/Volume1/.share/files/file1
fuse_path : /Pool-1/Volume1/share/file1

Q2 : rsync在備份檔案前會先比對兩邊的hash content , 若不一樣的話, 在備份檔案時會有什麼不一樣?
Ans :
1. 若比對檔案的結果為相同時, rsync就不會將source的檔案備份過去.
2. 若比較檔案的結果為不同時, rsync會將source的檔案整個在備份過去一次.

Q3 : 現在整個流程大概如何? (read / write)
Ans:
流程上應該是: (因為在cache mode時, file有可能存在, 有可能不存在.)
read : 詢問fuse上的file是否存在 --> (Download file (不存在)) --> read file
write : 詢問fuse上的file是否存在 --> (Download file (不存在)) --> compare file --> write file

Q4 : Performance
Ans:
[root@nas_8716691_a Volume_1]# rsync -a --progress normal/ admin@127.0.0.1::aaa
Password:
sending incremental file list
./
file10G_1
 10485760000 100%  125.73MB/s    0:01:19 (xfer#1, to-check=0/2)

sent 10487040096 bytes  received 30 bytes  127115637.89 bytes/sec
total size is 10485760000  speedup is 1.00
[root@nas_8716691_a Volume_1]# rsync -a --progress normal/ admin@127.0.0.1::bbb
Password:
sending incremental file list
./
file10G_1
 10485760000 100%  180.36MB/s    0:00:55 (xfer#1, to-check=0/2)

sent 10487040096 bytes  received 30 bytes  179265643.18 bytes/sec
total size is 10485760000  speedup is 1.00

Q5 : what is sum_struct?
Ans:

";i:1;N;i:2;N;}i:2;i:20844;}i:24;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:25096;}i:25;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"flow of source code";i:1;i:1;i:2;i:25096;}i:2;i:25096;}i:26;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:25096;}i:27;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1712:"
# rsync client (for read)
# rsync server-ssh (for write)
# rsync daemon (for writie)


[# rsync daemon (for writie)]
file : io.c
rsync_module --> chroot(module_chdir) 
module_dir : /Pool-1/Volume_1/aliyun_rsync/aaa

recv_files --> receive_data(fname) -> write_file
recv_files --> read_ndx_and_attrs --> writefd_unbuffered --> write (cnt = write(fd, buf + total, n);)

ndx : index of file list
在recv_files裡面有 fd2 = open_tmpfile(fnametmp, fname, file);
(fd1為read fd, fd2為write fd)

其中 n = len - total
totoal 為write總量.

finish_transfer function : transfer完成後, 進行rename動作

[# rsync server-ssh (for write)]
do_server_recv --> get_local_name --> change_dir (dir=dir@entry=0x5555557d4680 "/root/test", set_path_only=set_path_only@entry=0)

receive_data(fname) --> 從fnametmp rename到 fname

# rsync client (for read)
start_client --> client_run --> send_files --> match_sums --> matched --> send_token --> 
simple_send_token --> map_ptr (slide the read window in the file)

-----------------------------------------------
在send_files裡會open file name --> fd = do_open(fname, O_RDONLY, 0);
-----------------------------------------------
struct map_struct {
	OFF_T file_size;	/* File size (from stat)		*/
	OFF_T p_offset;		/* Window start				*/
	OFF_T p_fd_offset;	/* offset of cursor in fd ala lseek	*/
	char *p;		/* Window pointer			*/
	int32 p_size;		/* Largest window size we allocated	*/
	int32 p_len;		/* Latest (rounded) window size		*/
	int32 def_window_size;	/* Default window size			*/
	int fd;			/* File Descriptor			*/
	int status;		/* first errno from read errors		*/
};
-----------------------------------------------
readfd_unbuffered --> read_timeout --> read
";i:1;N;i:2;N;}i:2;i:25136;}i:28;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:26856;}i:29;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:26856;}}