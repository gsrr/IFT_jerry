a:4:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:394:"
def checkInclusion(self, s1, s2):
    A = [ord(x) - ord('a') for x in s1]
    B = [ord(x) - ord('a') for x in s2]
    
    target = [0] * 26
    for x in A:
        target[x] += 1
    
    window = [0] * 26
    for i, x in enumerate(B):
        window[x] += 1
        if i >= len(A):
            window[B[i - len(A)]] -= 1
        if window == target:
            return True
    return False
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:781:"
def remove_pre_elem(slide_win, c):
    slide_win[c] -= 1
    if slide_win[c] == 0:
        del slide_win[c]

def add_post_elem(slide_win, c):
    slide_win[c] = slide_win.get(c, 0) + 1
    
def findAnagrams(s, p):
        """
        :type s: str
        :type p: str
        :rtype: List[int]
        """
        ret = []
        if len(s) < len(p):
            return ret
            
        ws = len(p)
        dic_wp = collections.Counter(p)
        dic_ws = collections.Counter(s[:ws])
        if dic_wp == dic_ws:
            ret.append(0)
            
        for i in xrange(1, len(s) - ws + 1):
            remove_pre_elem(dic_ws, s[i-1])
            add_post_elem(dic_ws, s[i + ws - 1])
            if dic_ws == dic_wp:
                ret.append(i)
        return ret
";i:1;N;i:2;N;}i:2;i:414;}i:3;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:414;}}