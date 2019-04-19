a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:346:"
# return the upper index, for example : 
if h == 2 , and heaters = [1,4]
then it will return idx = 1

def bin_search_house(h, heaters):
    s = 0 
    e = len(heaters) - 1
    find = False
    while s <= e:
        m = (s + e) / 2
        if h >= heaters[m]:
            s = m + 1
        elif h < heaters[m]:
            e = m - 1
    return s
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}