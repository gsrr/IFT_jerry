a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:733:"
'''
f - failure function (by definition, this is the length of the longest prefix of the string which is a suffix also)
'''
[code #1]
def prefix_function(s):
    f = [0] * len(s)
    c = 0
    for i in xrange(1, len(f)):
        if s[i] == s[c]:
            c += 1
        else:
            if c > 0:
                c = f[c - 1] 
        f[i] = c
    return f

[code #2]
 def ComputePrefixFunction(self, needle):
        Pi = [0 for i in range(len(needle))]
        m = len(needle)
        Pi[0] = 0
        k = 0
        for q in range(1, m):
            while k > 0 and needle[k] != needle[q]:
                k = Pi[k - 1]
            if needle[k] == needle[q]:
                k = k + 1
            Pi[q] = k
        return Pi
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}