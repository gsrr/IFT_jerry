a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:793:"
Q2 : Check command for SSD trim?
Ans:
[~] # cat /sys/block/sdc/queue/discard_granularity
4096
(discard_granularity 非 0 表示支持。)

Q1 : What is SSD trim?
Ans:
由於固態硬碟的寫入資料模式，是先抹除舊資料後再寫入新資料，不像傳統式磁碟可以直接進行資料的覆寫，這種特性導致SSD會有越用越慢的狀況，為解決這個問題，微軟在Windows 7的作業系統中，內建了一套專為SSD開發的TRIM指令，使SSD在進行刪除檔案時，只是先將其磁區位置標記為刪除，等到系統閒置時，再完成清理空間的工作，以避免掉速情形。

title=Bug 226215 - [Samsung MZILT960HAHQ][TVS-EC1680U-SAS] SSD的資訊顯示不支援 SSD Trim功能
model=TS-ALL
description=SSD Trim功能顯示not support

";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}