a:4:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:508:"
class Solution(object):
    def matrixReshape(self, nums, r, c):
        """
        :type nums: List[List[int]]
        :type r: int
        :type c: int
        :rtype: List[List[int]]
        """
        if len(nums) == 0:
            return nums
        nr,nc = len(nums), len(nums[0])
        if nr * nc != r * c:
            return nums
        new_nums = [[0] * c for i in xrange(r)]
        for i in xrange(nr * nc):
            new_nums[i / c][i % c] = nums[i / nc][i % nc]
        return new_nums
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:575:"
class Solution(object):
    def matrixReshape(self, nums, r, c):
        """
        :type nums: List[List[int]]
        :type r: int
        :type c: int
        :rtype: List[List[int]]
        """
        if len(nums) == 0:
            return nums
        nr,nc = len(nums), len(nums[0])
        if nr * nc != r * c:
            return nums
        nnums = [[0] * c for i in xrange(r)]
        
        cnt = 0
        for i in xrange(nr):
            for j in xrange(nc):
                nnums[cnt / c][cnt % c] = nums[i][j]
                cnt += 1
        return nnums
";i:1;N;i:2;N;}i:2;i:529;}i:3;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:529;}}