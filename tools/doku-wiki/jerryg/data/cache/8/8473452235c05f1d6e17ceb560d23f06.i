a:14:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Rsync mechanism";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:7309:"
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

";i:1;N;i:2;N;}i:2;i:36;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7355;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"FAQ";i:1;i:1;i:2;i:7355;}i:2;i:7355;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:7355;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:4242:"
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

";i:1;N;i:2;N;}i:2;i:7379;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11631;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"flow of source code";i:1;i:1;i:2;i:11631;}i:2;i:11631;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:11631;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1712:"
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
";i:1;N;i:2;N;}i:2;i:11671;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:13391;}i:13;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:13391;}}