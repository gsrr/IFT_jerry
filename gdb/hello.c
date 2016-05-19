
/*
 *
 */
#include <stdio.h>

void test(char *msg)
{
        printf("%s",msg);
}

void print(char* msg)
{
        test(msg);
}

int main()
{
        print("This is Hello World\n");
        return 0;
}

