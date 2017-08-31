a:10:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"FAQ";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1538:"
Q1 : file path在一般的mount point 下與在fuse的mount point下有什麼不一樣?
Ans:
路徑會不一樣, 我們可以分成
xfs_path : /Pool-1/Volume1/.share/files/file1
fuse_path : /Pool-1/Volume1/share/file1

Q2 : rsync在備份檔案前會先比對兩邊的hash content , 若不一樣的話, 在備份檔案時會有什麼不一樣?
Ans:
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

";i:1;N;i:2;N;}i:2;i:25;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1573;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"flow of source code";i:1;i:1;i:2;i:1573;}i:2;i:1573;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1573;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1712:"
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
";i:1;N;i:2;N;}i:2;i:1613;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3333;}i:9;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3333;}}