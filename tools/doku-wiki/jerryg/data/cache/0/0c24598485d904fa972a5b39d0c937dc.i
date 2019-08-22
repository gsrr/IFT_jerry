a:47:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190614";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:25;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:34:"1. ahci --> dumpstack in scsi_done";i:1;i:2;i:2;i:25;}i:2;i:25;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:25;}i:6;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:771:"
[  643.592190]  <IRQ>
[  643.592196]  dump_stack+0x46/0x5e
[  643.592203]  ? scsi_device_from_queue+0x60/0x60
[  643.592208]  scsi_done+0x9/0x20
[  643.592215]  ata_scsi_qc_complete+0x156/0x4d0
[  643.592224]  ? ahci_qc_fill_rtf+0x41/0x80
[  643.592230]  ata_qc_complete_multiple+0x86/0xd0
[  643.592236]  ahci_handle_port_interrupt+0x99/0x510
[  643.592243]  ahci_handle_port_intr+0x68/0xb0
[  643.592250]  ahci_single_level_irq_intr+0x36/0x50
[  643.592256]  __handle_irq_event_percpu+0x5a/0xc0
[  643.592262]  handle_irq_event_percpu+0x1b/0x50
[  643.592267]  handle_irq_event+0x22/0x40
[  643.592273]  handle_edge_irq+0x64/0x180
[  643.592280]  handle_irq+0x14/0x20
[  643.592285]  do_IRQ+0x3c/0xc0
[  643.592290]  common_interrupt+0x7f/0x7f
[  643.592293]  </IRQ>

";i:1;N;i:2;N;}i:2;i:77;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:858;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:61:"2. marvell --> time compare between scsi_done and irq-handler";i:1;i:2;i:2;i:858;}i:2;i:858;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:858;}i:10;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:656:"
[  744.578829]  dump_stack+0x46/0x5e
[  744.578830]  scsi_done+0x9/0x20
[  744.578835]  hba_req_callback+0x17/0x30 [mv14xx]
[  744.578840]  io_chip_complete_requests+0xaf/0x160 [mv14xx]
[  744.578842]  ? irq_finalize_oneshot+0xe0/0xe0
[  744.578847]  Core_QueueInterruptHandler+0xd6/0x140 [mv14xx]
[  744.578851]  mv_msix_intr_handler+0x20/0x30 [mv14xx]
[  744.578852]  irq_thread_fn+0x14/0x30
[  744.578854]  irq_thread+0x131/0x190
[  744.578856]  ? wake_threads_waitq+0x30/0x30
[  744.578857]  ? irq_thread_check_affinity+0x50/0x50
[  744.578858]  kthread+0x10a/0x140
[  744.578860]  ? __kthread_parkme+0x70/0x70
[  744.578861]  ret_from_fork+0x35/0x40
";i:1;N;i:2;N;}i:2;i:938;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1604;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"3. build command for da_util";i:1;i:2;i:2;i:1604;}i:2;i:1604;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1604;}i:14;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:412:"
x86_64-QNAP-linux-gnu-gcc -Wall -O2 -I/root/Jerry_qts_4.5.0/NasX86/NasLib/include -I/root/Jerry_qts_4.5.0/NasX86/NasLib/uLinux -I/root/Jerry_qts_4.5.0/NasX86/NasLib/hal da_util.c -o da_util -L/root/Jerry_qts_4.5.0/NasX86/Model/TS-X71/build/RootFS/usr/lib -L/root/Jerry_qts_4.5.0/NasX86/Model/TS-X71/build/RootFS/usr/lib -L/root/Jerry_qts_4.5.0/NasX86/Model/TS-X71/build/RootFS/lib -luLinux_Storage -luLinux_hal
";i:1;N;i:2;N;}i:2;i:1651;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1364:"
在記錄latency event遇到一些問題, 會常常發生timeout, 原因看起來是因為我之前是在scsi_softirq_done裡面去判斷,
這裡是屬於中斷的下半部(以ahci來講), 所以時間上會拉比較長.
原本是想說改放到scsi_done, 以ahci來看, 這裡是屬於中斷上半部.
但Marvell controller的作法又不同.
所以如果真的要做到精準的話, 應該還是要實作在SATA drive裡面.
不過在這之前, 有一些地方我想要先確認一下:
1. ahci controller確定scsi_done是在中斷上半部裡面嗎?
(在scsi_done裡面dump_stack)
--> 說起來, dump_stack可以透過systemtap做到嗎?
2. marvell controller的scsi_done與其interrupt handler的時間差異大嗎?

另外還有disk_data的header需要實作, 在處理這個之前, 我想先要知道da_util的build參數為何?


1. SAS drive multipath study.
2. ULINK project - SATA drive statistic data collection(template 16, 201, 202)
3. ULINK project - SAS drive statistic data collection (template 301 ~ template 332)

1. Speedup  function implementation
    1.1 Scripts for updating image (kernel, driver, hal, and hal_util)
    1.2 Deploy a personal develop environment to co-work with QTS-NAS.
2. Need to familiar with SCSI / SAS spec and some kernel mechanism.(ex: tasklet, workqeue and lock mechanism.)
3. Understanding the debug skills in QTS.
";i:1;N;i:2;N;}i:2;i:2081;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3455;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190611";i:1;i:1;i:2;i:3455;}i:2;i:3455;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:3455;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3479;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:35:"1. Booting issue : QTS cannot boot.";i:1;i:2;i:2;i:3479;}i:2;i:3479;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3479;}i:22;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:202:"
  * 大概已經確認清楚了, 雖然hal event有些疑問的地方, 但整體運作上並沒有看到太大的問題.
  * 最後的結果反倒是我的code寫錯了, 導致infinite loop的產生.

";i:1;N;i:2;N;}i:2;i:3533;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3745;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:38:"2. SAS template implementation (24-50)";i:1;i:2;i:2;i:3745;}i:2;i:3745;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3745;}i:26;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:6757:"

Q11: What is "DEFECT LIST FORMAT"?
Ans:
這是在決定defect list應該要使用哪一種"address descriptor format type".
But... what is "address descriptor format type"?
這應該是在敘述每個區塊的block address描述方法.
這邊應該就填000就可以了, 因為回傳的資料也有描述是使用哪一種format.
(如果要更準確的話, 應該可以比較ulink所給的範例.)

Q10: What is GLIST?
Ans:
稱為grown defect list(成長缺陷表),
使用者在使用硬碟過程中，有可能會發現一些新的defect sector。按“三包”規定，只要出現一個defect sector，商家就應該為用戶換或修。現在大容量的硬碟出現一個defect sector概率實在很大，這樣的話硬碟商家就要為售後服務忙碌不已了。於是，硬碟廠商設計了一個自動修復機制，叫做Automatic Reallcation。有大多數型號的硬碟都有這樣的功能：在對硬碟的讀寫過程中，如果發現一個defect sector，則自動分配一個備用磁區替換該磁區，並將該磁區及其替換情況記錄在G-list中。這樣一來，少量的defect sector對用戶的使用沒有太大的影響。    

所以可以想到PLIST是primary defect list, 就是在製造過程已經存在的defect sector.
而GLIST就是在使用過程才產生的defect sector.

Q9 : 甚麼是"read defect data" command?
Ans:
從解釋看起來, 這個command是請求device server關於PLIST 以及GLIST的資料.
從ulink的spec, 只需要GLIST的資料, 那甚麼是GLIST? --> Q10
看起來
REQ_PLIST --> 0
REQ_GLISt --> 1
那甚麼是"DEFECT LIST FORMAT"? -->Q11
"The DEFECT LIST FORMAT field specifies the address descriptor forma type (see 6.2) that the device server
should use for the defect list. A device server unable to return the requested address descriptor format shall
return the address descriptors in their default format and indicate that format type in the DEFECT LIST FORMAT
field in the READ DEFECT DATA parameter data header (see 5.17.2 and 5.18.2)."

那最後就是"Address Descriptor Index", 這個在解釋上有點看不懂.
另外想到的是, 若是壞掉的sector很多, 那回傳的buffer不就會將memory塞爆了?
--> 所以看起來好像要分批索取資料, 有點麻煩. 這個Address Descriptor Index看起來就是為了這個用途.
但裡面提到"size of address descriptor" --> 不確定這個是甚麼意思?




目前大概已經快將SAS template完成了, 剩下read defect data(12)這個command.
這個command看起來比較不好理解, 所以要整理一下.

Q8 : type of parameter value是甚麼意思?
Ans:
大概就是根據設定, 回傳不同的parameter value. 由spec看來, 大概有4種:
1. threshold value
2. cumulative value
3. default threshold value.
4. default cumulative value.

Q7 : What is log parameter?
Ans:
基本上透過log select 或log sense command搭配page code, 我們可以跟device要到一份log page.
而這個log page裡面會有多個log parameter.
舉例來說, 我們想要跟device索取Read error counter這個page,
而這個page裡面會有多個parameter, 像是"Total errors corrected", "Total bytes processed", ...etc.

Q6 : PPC (parameter pointer control)有甚麼作用?
Ans:
PPC 基本上只有0跟1, 但可以搭配parameter pointer一起使用.
如果PPC為0, 且parameter pointer為0, 代表device server應該要回傳該log page的所有log parameter.
(又有問題了, 甚麼是log parameter?)
那如果PPC為0, 且parameter pointer不為0, 那代表device server只要回傳比parameter pointer還大的parameter code即可.
那如果PPC為1呢? 那代表須回傳跟上次下log select (or log sense)command時不一樣的parameter code.
(當然這些parameter code需大於parameter pointer.)

Q5 : What is parameter pointer?
Ans :
從敘述看來, the parameter pointer允許application client可以請求某一個區段的parameter data.
(也就是說,  他可以定義要從specific parameter code 開始)
那如果parameter大於所有的parameter code時, 這時會回復"CHECK_CONDITION" status, 且sense key會設為"ILLEGAL REQUEST", sense code則會設為"INVALID FIELD IN CDB".

Q4 : log sense command裡面有幾個bit需如何設定? 像是PPC, SP, PC, Parameter pointer, control?
Ans :
control --> 都設0就好. (原因目前不明)
PPC --> 是parameter pointer control, 那甚麼是parameter pointer? --> Q5
--> 大概了解甚麼是parameter pointer了, 那parameter pointer control有甚麼作用? --> Q6
SP --> 稱為saving parameters, 只會有0跟1.
--> 若device 有implement saving log parameters, 那將會把所有log parameter存放在一個非揮發性的儲存空間.
--> 若device 沒有implement saving log parameters, 而將sp設為1的話, 那將會回傳status:"CHECK CONDITION", sense key:"ILLEGAL REQUEST", sense code : "INVALID FIELD IN CDB"
PC --> 稱為page control, 明確描述需要回傳哪一種type的parameter value.
(這裡不太懂, value就value, 還有分哪一種type的value? --> Q8)

The page control (PC) field specifies the type of parameter values to be selected (see 6.5 for the definition of the
page control field). The parameter values returned by a LOG SENSE command are determined as follows:
a) The specified parameter values at the last update (i.e., in response to a LOG SELECT or LOG SENSE
command or done automatically by the device server for cumulative values);
b) The saved values, if saved parameters are implemented and an update has not occurred since the last
logical unit reset; or
c) The default values, if saved values are not available or not implemented and an update has not occurred
since the last logical unit reset.



Q3 : 什麼是log sense command?
Ans:
1. 透過log sense command可以跟scsi target device 檢索統計資訊, 這些資訊是存在scsi target device之中.
2. log sense command 是log select command的補充.

看了scsi spec, 但那個spec, 老實講... 解釋都模模糊糊的, 目前vpd page已經大概完成了.
但在看log sense command時, 有一些bit的設定搞不太清楚, 不過還是要想辦法解決.
就把一個個的名詞釐清吧.

Q2 : sg_io_hdr_t是甚麼意思?
Ans :
hdr 就是header.
所以sg_io_hdr就是(scsi generic , io, header).
這個header定義了很多東西, 其中包含了scsi command.


Q1 : sg device指的是?
Ans :
sg stands for "scsi generic".

對我來說, 解bug跟implement function都差不多, 大概就把一些串不起來的點搞清楚,
整個流程, 邏輯通暢後, 答案就會浮現了.
所以我現在首先要處理的事情應該是:
1. 確認hal_sys_scsi.c 中有沒有我可以拿來用的. (這檔案看起來是從sg_utils抄出來的)
--> 不看了, 沒甚麼意義, 太多不必要的東西, 光看懂就要花費不少時間.


";i:1;N;i:2;N;}i:2;i:3802;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10568;}i:28;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:38:"3. filelock when read/write data file.";i:1;i:3;i:2;i:10568;}i:2;i:10568;}i:29;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:10568;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10568;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"4. Location for storing data file.";}i:2;i:10619;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10653;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10653;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:"5. 想把opengrok移到windows這邊來";}i:2;i:10655;}i:35;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:10694;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10697;}i:37;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10697;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:89:"6. 昨天看到一個問題,就是inquiry ready的command似乎都會發出latency event.";}i:2;i:10699;}i:39;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10788;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10788;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:95:"7. 另外需要找時間看一下為什麼開機時的latency會太長. (是device的關係 or ";}i:2;i:10790;}i:42;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:10885;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"?)";}i:2;i:10888;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10890;}i:45;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10890;}i:46;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:10890;}}