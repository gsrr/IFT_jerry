a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:411:"
class Solution(object):
    def subarraySum(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        dic = {0 : 1}
        s = 0
        ret = 0
        for i in xrange(len(nums)):
            s += nums[i]
            d = s - k
            ret += dic.get(d, 0)
            dic[s] = dic.get(s,0) + 1
        return ret    
        
                
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}