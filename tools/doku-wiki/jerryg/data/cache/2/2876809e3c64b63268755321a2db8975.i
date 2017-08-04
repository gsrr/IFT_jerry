a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:518:"
# itertools
def permutations(arr):
    # disadvantage : 暴力法, 速度慢, 需等到全部東西都回傳才可以進行處理
    import itertools
    return itertools.permutations(arr)

# euclidean distance
def euclidean(v1, v2):
    from scipy.spatial import distance
    return distance.euclidean(v1, v2)

def euclidean(v1, v2):
    return sqrt(sum( (x - y)**2 for x, y in zip(v1, v2)))
   
# basic algorithm
1. stack & queue
2. binary search tree
3. bfs & dfs
4. permutations
5. subset
6. binary combinations
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}