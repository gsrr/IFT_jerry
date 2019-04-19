a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:347:"
# BEGIN and END
任何在BEGIN之后列出的操作（在{}内）将在Unix awk开始扫描输入之前执行，
而END之后列出的操作将在扫描完全部的输入之后执行。
因此，通常使用BEGIN来显示变量和预置（初始化）变量，使用END来输出最终结果。

ps | grpe yas3 | awk '{sum += $8} END {print sum}'
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}