#include <stdio.h>
#include <string.h>
#include "iftldap.h"

int main()
{
    char name[] = "test001@test.ift.com";
    char base[] = "dc=test,dc=ift,dc=com";
    char cn[256] = {0};
    ldapname2cn(base, name, cn);
    printf("cn=%s\n",cn);

    char cn2[] = "test002";
    char name2[256] = {0};
    cn2ldapname(base, cn2, name2);
    printf("ldapname=%s\n", name2);
    return;
}
