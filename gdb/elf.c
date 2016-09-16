#include <unistd.h>

int main()
{
        write(1, 0x0000000000400001, 3);
        return 0;
}
