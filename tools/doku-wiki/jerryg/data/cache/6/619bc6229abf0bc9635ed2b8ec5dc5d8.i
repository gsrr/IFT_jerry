a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"FAQ";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:194:"
Q1 : convert ascii chars in a string to ascii hex.
Ans:
>>> mystring = "Hello World"
>>> print ''.join(r'\x{0:x}'.format(ord(c)) for c in mystring)
\x48\x65\x6c\x6c\x6f\x20\x57\x6f\x72\x6c\x64
";i:1;N;i:2;N;}i:2;i:24;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:226;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:226;}}