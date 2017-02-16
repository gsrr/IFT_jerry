#include <stdio.h>
#include <string.h>


void split2(char *name, char *s1, char *s2)
{
    char *str1 = strtok(name,"@");
    sprintf(s1, "%s", str1);
    char *str2 = strtok(NULL,"@");
    sprintf(s2, "%s", str2);
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
    return strcmp(domain, real_domain); 
}

int ldapname2cn(char *base, char *ldapname, char *cn)
{
    printf("%s, %s, %s\n", base, ldapname, cn);
    char domain[256] = {0};
    split2(ldapname, cn, domain);
    printf ("%s,%s\n",cn,domain);
    if (base_diff_domain(base, domain) != 0)
    {
        printf("compare error\n");
        return -1;
    }
    return 0;
}

void cn2ldapname(char *base, char *cn, char *ldapname)
{
    char domain[256] = {0};
    base2domain(base, domain);
    sprintf(ldapname, "%s@%s", cn, domain);     
}

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
