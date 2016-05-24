
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
        printf("%s\n", "hello print");
        test(msg);
}

int main()
{
        print("This is Hello World2\n");
        return 0;
}

