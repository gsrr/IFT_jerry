a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:578:"
-- open and possibly create a file


int open(const char *pathname, int flags, mode_t mode);
-- flags : access mode for that file.
-- mode : The mode argument specifies the file mode bits be applied when a new file is created.
1. mode will be ignored if the file is not created.


The open file description records the file offset and the file status flags
-- Q1 : how to get offset from fd?
-- Q2 : how to get flags from fd?

1. O_CREAT

if file is not exist:
    create the file.
else:
    if O_EXCL exist:
        print "fail"
    else:
        print "successful"
        

";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}