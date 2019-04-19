a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:179:"
def bin_combination(n):
    for i in xrange(pow(2,n)):
        cb = ""
        for j in xrange(n):
            cb += "%u"%(i / pow(2,j) % 2)
        print cb

bin_combination(3)
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}