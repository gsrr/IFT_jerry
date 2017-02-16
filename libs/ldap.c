#include <stdio.h>
#include <string.h>


void split2(char *name, char *s1, char *s2)
{
    char *str1 = strtok(name,"@");
    strncpy( str1, s1, sizeof(str1));
    char *str2 = strtok(NULL,"@");
    strncpy( str2, s2, sizeof(str2));
}

void base2domain(char *base, char *domain)
{
    char *pch;
    pch = strtok(base, ",");
    while(pch != NULL)
    {
        char *ppch;
        if(ppch = strstr(pch, "dc="))
        {
            strcat(domain, pch + 3);
            strcat(domain, ".");
        }
        pch = strtok(NULL, ",");
    }
    domain[strlen(domain) - 1] = '\0';
}

int base_diff_domain(char *base , char *domain)
{
    char real_domain[256] = {0};
    base2domain(base, real_domain);
    printf("(real, domain = (%s, %s))", real_domain, domain);
    return strcmp(domain, real_domain); 
}

int name_convert(char *base, char *name, char *cn)
{
    printf("%s, %s, %s\n", base, name, cn);
    char domain[256] = {0};
    split2(name, cn, domain);
    printf ("%s,%s\n",cn,domain);
    if (base_diff_domain(base, domain) != 0)
    {
        printf("compare error\n");
        return -1;
    }

    return;
}

int main()
{
    char name[] = "test001@test.ift.com";
    char base[] = "dc=test,dc=ift,dc=com";
    char cn[256] = {0};
    name_convert(base, name, cn);
    return;
}
