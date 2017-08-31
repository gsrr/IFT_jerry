a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:512:"
class Solution(object):
    def minDistance(self, A, B):
        memo = {}
        def dp(i, j):
            #min steps to make A[i:] and B[j:] the same
            if i == len(A) or j == len(B):
                return len(A) - i + len(B) - j
            if (i,j ) not in memo:
                if A[i] == B[j]:
                    ans= dp(i+1,j+1)
                else:
                    ans= 1 + min(dp(i+1, j), dp(i, j+1))
                memo[i,j]= ans
            return memo[i,j]
        return dp(0, 0)
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}