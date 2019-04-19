a:11:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Reference";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:68:"
1. TCP : window size value
https://my.oschina.net/mawx/blog/297925
";i:1;N;i:2;N;}i:2;i:30;}i:4;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:83:"
Q: Can be speedup by increasing buffer size?
Ans:

Q: where is io of rsync?
Ans:

";i:1;N;i:2;N;}i:2;i:113;}i:5;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:206;}i:6;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Flow";i:1;i:1;i:2;i:206;}i:2;i:206;}i:7;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:206;}i:8;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:893:"
match_sums --> matched --> send_token --> simple_send_token --> write_buf --> writefd

for (j = last_match + CHUNK_SIZE; j < len; j += CHUNK_SIZE)
{
    matched(f, s, buf, j, -2);
    
    // -2 token means to send data only and no token
}


static void writefd(int fd, const char *buf, size_t len)
{
	if (fd == sock_f_out)
		stats.total_written += len;

	if (fd == write_batch_monitor_out)
		writefd_unbuffered(batch_fd, buf, len);

	if (!iobuf_out || fd != iobuf_f_out) {
		writefd_unbuffered(fd, buf, len);
		return;
	}

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
}

// iobuf_out_cnt 是在儲存data , 當buffer size等於 IO_BUFFER_SIZE時, 就會進行一次flush的動作.

";i:1;N;i:2;N;}i:2;i:230;}i:9;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1131;}i:10;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1131;}}