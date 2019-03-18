a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"FAQ";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:980:"
# brute force --> permutations of a list
>>> from itertools import permutations
>>>
>>> list(permutations('ABC', 2))
[('A', 'B'), ('A', 'C'), ('B', 'A'), ('B', 'C'), ('C', 'A'), ('C', 'B')]
>>>
>>> list(permutations('ABC'))
[('A', 'B', 'C'), ('A', 'C', 'B'), ('B', 'A', 'C'), ('B', 'C', 'A'), ('C', 'A', 'B'), ('C', 'B', 'A')]
>>>


# brute force --> combinations of a list
>>> from itertools import combinations
>>>
>>> list(combinations('ABC', 2))
[('A', 'B'), ('A', 'C'), ('B', 'C')]

Q4 : Convert 1 to 0 and vice versa
Ans:
!n
1-n
n^1
n==0
n!=1
n<1

Q3 : Convert binary string to integer
Ans:
>>> int('11111111', 2)
255

Q2 : transpose of matrix
Ans:
>>> [list(x) for x in zip(*lis)]
[[1, 4, 7], [2, 5, 8], [3, 6, 9]]
#or
>>> map(list, zip(*lis))
[[1, 4, 7], [2, 5, 8], [3, 6, 9]]

Q1 : convert ascii chars in a string to ascii hex.
Ans:
>>> mystring = "Hello World"
>>> print ''.join(r'\x{0:x}'.format(ord(c)) for c in mystring)
\x48\x65\x6c\x6c\x6f\x20\x57\x6f\x72\x6c\x64
";i:1;N;i:2;N;}i:2;i:24;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1012;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1012;}}