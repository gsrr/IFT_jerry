a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"What is MMIO";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:449:"
* 內存和I/O設備共享同一個地址空間, 所以當CPU訪問某個內存地址時，它可能是物理內存，也可以是某個I/O設備的內存。
* 因此，每個I/O設備監視CPU的地址總線，一旦CPU訪問分配給它的地址，它就做出響應，將數據總線連接到需要訪問的設備硬件寄存器。
為了容納I/O設備，CPU必須預留給I/O一個地址區域，該地址區域不能給物理內存使用。

";i:1;N;i:2;N;}i:2;i:33;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:490;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:490;}}