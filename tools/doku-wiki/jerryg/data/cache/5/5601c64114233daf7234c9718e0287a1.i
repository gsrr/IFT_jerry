a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1034:"
#!/bin/python

import sys

M = 10**9+7

def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def inverse(x, p):
    g, x, y = egcd(x, p)
    if g != 1:
        raise Exception('modular inverse does not exist')
    else:
        return x % p


def f(n1, n2):
    k = min(n1, n2)
    c1 = 1
    c2 = 1
    res = 1
    for kk in xrange(1, k+1):
        c1 = (c1 * (n1 - kk + 1) * inverse(kk, M)) % M
        c2 = (c2 * (n2 - kk + 1) * inverse(kk, M)) % M
        res = (res + c1 * c2) % M
    return res

def countSubs(s):
    na, nb, nc, nd = 0, 0, 0, 0
    for c in s:
        if c == 'a': na += 1
        elif c == 'b': nb += 1
        elif c == 'c': nc += 1
        else: nd += 1

    res = (f(na,nb) * f(nc,nd) - 1) % M
    return res
    
            
# Return the number of non-empty perfect subsequences mod 1000000007
q = int(raw_input().strip())
for a0 in xrange(q):
    s = raw_input().strip()
    result = countSubs(s)
    print(result)
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}