a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:604:"
def issub(haystack, needle, i):
    for j in xrange(len(needle)):
        if haystack[i + j] != needle[j]:
            return False
    return True
    
class Solution(object):
    def strStr(self, haystack, needle):
        """
        :type haystack: str
        :type needle: str
        :rtype: int
        """
        if needle == "":
            return 0
        
        s = 0
        e = len(haystack) - len(needle) + 1
        while s < e:
            if haystack[s] == needle[0]:
                if issub(haystack, needle, s):
                    return s
            s += 1
        return -1
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}