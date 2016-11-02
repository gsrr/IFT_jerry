#include <string.h>

int main()
{
    char* p = NULL;
    strcpy(p, "copy string to null pointer and cause crash");
    return 0;
}
