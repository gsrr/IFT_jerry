a:7:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"convert fd to real path";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:791:"
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>


char* fd2fpath(int fd)
{
        struct stat sb;
        char *linkname;
        ssize_t r;
        char fdpath[256] = {0};

        sprintf(fdpath, "/proc/%d/fd/%d",getpid(), fd);
        printf("fdpath:%s\n", fdpath);
        if (lstat(fdpath, &sb) == -1) {
        }

        linkname = malloc(sb.st_size + 1);
        r = readlink(fdpath, linkname, sb.st_size + 1);
        if (r == -1) {
                /* path convert fail*/
        }
        linkname[r] = '\0';
        return linkname;
}

void test_fd2fpath()
{
        int fd = open("/tmp/2.txt", O_RDONLY);
        char *fpath = fd2fpath(fd);
        printf("fpath:%s\n", fpath);
        free(fpath);
}

";i:1;N;i:2;N;}i:2;i:44;}i:4;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:978:"
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int
main(int argc, char *argv[])
{
    struct stat sb;
    char *linkname;
    ssize_t r;

    if (argc != 2) {
        fprintf(stderr, "Usage: %s <pathname>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    if (lstat(argv[1], &sb) == -1) {
        perror("lstat");
        exit(EXIT_FAILURE);
    }

    linkname = malloc(sb.st_size + 1);
    if (linkname == NULL) {
        fprintf(stderr, "insufficient memory\n");
        exit(EXIT_FAILURE);
    }

    r = readlink(argv[1], linkname, sb.st_size + 1);

    if (r == -1) {
        perror("lstat");
        exit(EXIT_FAILURE);
    }

    if (r > sb.st_size) {
        fprintf(stderr, "symlink increased in size "
                        "between lstat() and readlink()\n");
        exit(EXIT_FAILURE);
    }

    linkname[r] = '\0';

    printf("'%s' points to '%s'\n", argv[1], linkname);

    exit(EXIT_SUCCESS);
}
";i:1;N;i:2;N;}i:2;i:850;}i:5;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1836;}i:6;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1836;}}