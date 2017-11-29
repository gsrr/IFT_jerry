a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:749:"
# Reference:
1. https://stackoverflow.com/questions/9097201/how-to-get-current-process-name-in-linux

在Linux中, 若要從程式得到自己的program name, 有幾種方式:
1. read data from /proc/self/cmdline

2. read data from /proc/self/status

3. from <errno.h>
#define _GNU_SOURCE
#include <errno.h>

extern char *program_invocation_name;
extern char *program_invocation_short_name;

--> program_invocation_name contains the name that was used to invoke the calling program.
(example : /usr/bin/nmbd)
--> program_invocation_short_name contains the basename component of name that was used to invoke the calling program.
(example : nmbd)

4. __progname 
extern char *__progname;
printf("\n%s", __progname);

5. argv[0] in main function.




";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}