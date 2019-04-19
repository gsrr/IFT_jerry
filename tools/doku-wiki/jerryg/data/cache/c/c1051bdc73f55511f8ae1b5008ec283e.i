a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:335:"
def _ans(n, ret):
    if n == 0:
        print ret

    for i in xrange(n, 0, -1):
        if i > ret[-1]:
            continue
        ret.append(i)
        _ans(n - i, ret)
        ret.pop()

def ans(n, ret):
    for i in xrange(n - 1, 0 , -1):
        ret.append(i)
        _ans(n - i, ret)
        ret.pop()

ret = []
ans(8, ret)
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}