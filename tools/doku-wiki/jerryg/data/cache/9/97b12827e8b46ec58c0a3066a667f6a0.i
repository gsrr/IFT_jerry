a:18:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"Task file in SATA";i:1;i:1;i:2;i:2;}i:2;i:2;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:154:"
* The task file is in the ATA device.
* 在Host端的command register與Control register通稱為shadow register.
--> 在device端則通稱為task file.
";i:1;N;i:2;N;}i:2;i:39;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:203;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"kernel message";i:1;i:1;i:2;i:203;}i:2;i:203;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:203;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:5936:"
# identify command
May  2 16:43:08 jerrie-pc kernel: [ 7399.269348] ata_scsi_dump_cdb: CDB (4:0,0,0) 85 08 0e 00 00 00 00 00 00
May  2 16:43:08 jerrie-pc kernel: [ 7399.270475] ata_scsi_dump_cdb: CDB (4:0,0,0) 00 00 00 00 00 00 00 00 00
--> 85h是ATA PASS-THROUGH, 也就是說, 這不是一個scsi command, 而是一個ata command.

# tur command:
root@jerrie-pc:~# sg_turs /dev/sdc
May  2 16:18:46 jerrie-pc kernel: [ 5937.155038] ata_scsi_dump_cdb: CDB (4:0,0,0) 00 00 00 00 00 00 00 00 00
May  2 16:18:46 jerrie-pc kernel: [ 5937.155280] ata_scsi_dump_cdb: CDB (4:0,0,0) 00 00 00 00 00 00 00 00 00

# 開SATA log後, 可以看到印出來的CDB command是以下的樣子:
May  2 15:29:15 jerrie-pc kernel: [ 2966.793327] ata_scsi_dump_cdb: CDB (4:0,0,0) 2a 00 00 3e 70 a0 00 0a 00
May  2 15:29:15 jerrie-pc kernel: [ 2966.799530] ata_scsi_dump_cdb: CDB (4:0,0,0) 2a 00 00 3e 7a a0 00 06 00
May  2 15:29:19 jerrie-pc kernel: [ 2970.663508] ata_scsi_dump_cdb: CDB (4:0,0,0) 35 00 00 00 00 00 00 00 00
May  2 15:29:19 jerrie-pc kernel: [ 2970.663676] ata_scsi_dump_cdb: CDB (4:0,0,0) 2a 00 1d 1c 30 90 00 00 04
May  2 15:29:19 jerrie-pc kernel: [ 2970.663847] ata_scsi_dump_cdb: CDB (4:0,0,0) 35 00 00 00 00 00 00 00 00

%ph --> Raw buffer as a hex string
%9ph --> 9 個hex string


===========================================

# 做io時, 將drive拔出的訊息是:
May  2 10:47:07 jerrie-pc kernel: [847568.065473] ata4: SATA link down (SStatus 0 SControl 300)
May  2 10:47:13 jerrie-pc kernel: [847573.544782] ata4: SATA link down (SStatus 0 SControl 300)
May  2 10:47:18 jerrie-pc kernel: [847578.920932] ata4: SATA link down (SStatus 0 SControl 300)
May  2 10:47:18 jerrie-pc kernel: [847578.920943] ata4.00: disabled
May  2 10:47:18 jerrie-pc kernel: [847578.920971] sd 4:0:0:0: rejecting I/O to offline device
May  2 10:47:18 jerrie-pc kernel: [847578.920982] sd 4:0:0:0: [sdc] killing request
May  2 10:47:18 jerrie-pc kernel: [847578.920989] sd 4:0:0:0: rejecting I/O to offline device
May  2 10:47:18 jerrie-pc kernel: [847578.921007] print_req_error: I/O error, dev sdc, sector 488386656
May  2 10:47:18 jerrie-pc kernel: [847578.921041] XFS (sdc): metadata I/O error in "xlog_iodone" at daddr 0x1d1c3060 len 64 error 5
May  2 10:47:18 jerrie-pc kernel: [847578.921055] XFS (sdc): xfs_do_force_shutdown(0x2) called from line 1250 of file fs/xfs/xfs_log.c.  Return address = 00000000944d806e
May  2 10:47:18 jerrie-pc kernel: [847578.921100] XFS (sdc): Log I/O Error Detected.  Shutting down filesystem
May  2 10:47:18 jerrie-pc kernel: [847578.921104] XFS (sdc): Please umount the filesystem and rectify the problem(s)
May  2 10:47:18 jerrie-pc kernel: [847578.921118] ata4.00: detaching (SCSI 4:0:0:0)
May  2 10:47:18 jerrie-pc kernel: [847578.921176] sd 4:0:0:0: [sdc] FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK
May  2 10:47:18 jerrie-pc kernel: [847578.921185] sd 4:0:0:0: [sdc] CDB: Write(10) 2a 00 00 00 00 b0 00 00 08 00
May  2 10:47:18 jerrie-pc kernel: [847578.921190] print_req_error: I/O error, dev sdc, sector 176
May  2 10:47:18 jerrie-pc kernel: [847578.921371] XFS (sdc): writeback error on sector 184
May  2 10:47:18 jerrie-pc kernel: [847578.924654] sd 4:0:0:0: [sdc] Synchronizing SCSI cache
May  2 10:47:18 jerrie-pc kernel: [847578.924682] sd 4:0:0:0: [sdc] Synchronize Cache(10) failed: Result: hostbyte=DID_BAD_TARGET driverbyte=DRIVER_OK
May  2 10:47:18 jerrie-pc kernel: [847578.924683] sd 4:0:0:0: [sdc] Stopping disk
May  2 10:47:18 jerrie-pc kernel: [847578.924686] sd 4:0:0:0: [sdc] Start/Stop Unit failed: Result: hostbyte=DID_BAD_TARGET driverbyte=DRIVER_OK

===================================================
從code看起來, 是scsi在處理request時, 會先檢查device是否online(scsi_device_online), 若沒有online就會發出以下error:
rejecting I/O to offline device

function:
scsi_device_online(sdev)


===================================================
從log看起來, 還有一行:
Start/Stop Unit failed: Result: hostbyte=DID_BAD_TARGET driverbyte=DRIVER_OK

這是由電源管理架構所觸發(sd_suspend_system), 呼叫到sd_start_stop_device這個function.
不過在sd_start_stop_device會呼叫到scsi_execute來下command, 這裡最後也是轉到request queue來處理嗎?
(最後跟sata device溝通的人應該都是ahci driver)


======================================================
另外一行:
ata4.00: detaching (SCSI 4:0:0:0)

這看起來是由ata_port_alloc所觸發, 裡面會設定ata_scsi_hotplug, 但有driver插拔時就會被觸發,
ata_scsi_hotplug --> ata_scsi_handle_link_detach --> ata_scsi_remove_dev


======================================================
--> ata4: SATA link down (SStatus 0 SControl 300)
由ata_std_postreset --> sata_print_link_status

struct ata_port_operations is defined for every low-level libata hardware driver, and it controls how the low-level driver interfaces with the ATA and SCSI layers.
******************************************************






# 當我拔出一顆drive時
May  2 10:43:28 jerrie-pc kernel: [847349.291244] ata4: SATA link down (SStatus 0 SControl 300)



May  2 10:43:34 jerrie-pc kernel: [847354.658558] ata4: SATA link down (SStatus 0 SControl 300)
May  2 10:43:39 jerrie-pc kernel: [847360.034725] ata4: SATA link down (SStatus 0 SControl 300)
May  2 10:43:39 jerrie-pc kernel: [847360.034738] ata4.00: disabled
May  2 10:43:39 jerrie-pc kernel: [847360.034780] ata4.00: detaching (SCSI 4:0:0:0)
May  2 10:43:39 jerrie-pc kernel: [847360.036888] sd 4:0:0:0: [sdc] Synchronizing SCSI cache
May  2 10:43:39 jerrie-pc kernel: [847360.036955] sd 4:0:0:0: [sdc] Synchronize Cache(10) failed: Result: hostbyte=DID_BAD_TARGET driverbyte=DRIVER_OK
May  2 10:43:39 jerrie-pc kernel: [847360.036956] sd 4:0:0:0: [sdc] Stopping disk
May  2 10:43:39 jerrie-pc kernel: [847360.036960] sd 4:0:0:0: [sdc] Start/Stop Unit failed: Result: hostbyte=DID_BAD_TARGET driverbyte=DRIVER_OK
";i:1;N;i:2;N;}i:2;i:239;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6186;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Insert drive";i:1;i:2;i:2;i:6186;}i:2;i:6186;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6186;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1568:"
# 當我插入drive時, kernel顯示的訊息為:
May  2 10:38:59 jerrie-pc kernel: [847079.735591] ata3: link is slow to respond, please be patient (ready=0)
May  2 10:39:00 jerrie-pc kernel: [847081.295647] ata3: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
May  2 10:39:00 jerrie-pc kernel: [847081.395421] ata3.00: ATA-8: WDC WD5003ABYZ-011FA0, 01.01S03, max UDMA/133
May  2 10:39:00 jerrie-pc kernel: [847081.395427] ata3.00: 976773168 sectors, multi 0: LBA48 NCQ (depth 32), AA
May  2 10:39:00 jerrie-pc kernel: [847081.396736] ata3.00: configured for UDMA/133
May  2 10:39:00 jerrie-pc kernel: [847081.396995] scsi 3:0:0:0: Direct-Access     ATA      WDC WD5003ABYZ-0 1S03 PQ: 0 ANSI: 5
May  2 10:39:00 jerrie-pc kernel: [847081.397155] sd 3:0:0:0: [sdb] 976773168 512-byte logical blocks: (500 GB/466 GiB)
May  2 10:39:00 jerrie-pc kernel: [847081.397157] sd 3:0:0:0: Attached scsi generic sg1 type 0
May  2 10:39:00 jerrie-pc kernel: [847081.397166] sd 3:0:0:0: [sdb] Write Protect is off
May  2 10:39:00 jerrie-pc kernel: [847081.397168] sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
May  2 10:39:00 jerrie-pc kernel: [847081.397185] sd 3:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
May  2 10:39:00 jerrie-pc kernel: [847081.427314]  sdb: sdb1 sdb2 sdb3 sdb4 sdb5
May  2 10:39:00 jerrie-pc kernel: [847081.427894] sd 3:0:0:0: [sdb] Attached SCSI disk


sata_link_hardreset --> ata_wait_ready --> 印出 link is slow to respond...
ata_std_postreset --> sata_print_link_status --> 印出 ata3: SATA link up 6.0 Gbps...

";i:1;N;i:2;N;}i:2;i:6216;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7794;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"Error Handle in SATA";i:1;i:2;i:2;i:7794;}i:2;i:7794;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:7794;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:6588:"
Q8 : ata command timeout的case會怎麼跑?
Ans:

Q7 : 我要怎麼產生error case?
Ans:

Q6 : 插入SATA drive時, 是怎麼判斷該drive已經ready, 可以運作? 是根據什麼樣的資訊將state轉為online?
Ans:

Q5 : 在scsi_softirq_done裡面會判斷error是否要進行retry, 這個retry是怎麼判斷的?
Ans:
* 在scsi_decide_disposition會根據scmd->result來決定後續要進行什麼處理, 若是CHECK_CONDITION就會呼叫scsi_check_sense來決定是否要進行retry.
* 或是DID_IMM_RETRY也會進行retry
* DID_SOFT_ERROR, DID_TRANSPORT_DISRUPTED, DID_PARITY, TASK_ABORTED 則會進行 "maybe_retry"

Q5-1 : 那一般的流程是會怎樣進行? 因為一開始好像有看到還需要發出一個sense command.
Ans:
* SAM_STAT_CHECK_CONDITION就是对应scsi协议中的CHECK CONDITION,这一状态表明有sense data被放置在相应的buffer里,于是scsi core那边就会去读sense buffer
* scsi sense buffer : 
** A SCSI sense buffer is the error reporting facility in SCSI. 
** It reports the error code and possibly also additional information that helps to locate the source of the problem.
原本我以為是在error後再送出sense command, 不過看起來不是這樣, 這個command應該是在底層的協議就發出去了, 而不是在driver這邊決定.
(driver在整個協議端就好像是tcp/ip的application層)
所以driver要做的事就是將這個sense data由sata格式轉為scsi格式, 再交由上層的error handler來進行處理.

Q5-2 : 那ADD_TO_MLQUEUE跟NEEDS_RETRY有什麼不同?
Ans:
* 會根據一些原因來設定為ADD_TO_MLQUEUE, 像是DID_REQUEUE或是BUSY.
* 但看起來在後面的處理機制是相同的.

Q4 : scsi_error_handle是在Scsi_Host alloc時被丟到thread來執行, 那整個error的handle的流程應該為何?
Ans:
6880 May  6 12:39:42 jerrie-pc kernel: [  116.264113]  ? ahci_do_softreset+0x240/0x240 [libahci]
6881 May  6 12:39:42 jerrie-pc kernel: [  116.264117]  ? ahci_stop_engine+0xe0/0xe0 [libahci]
6882 May  6 12:39:42 jerrie-pc kernel: [  116.264120]  ? ahci_do_hardreset+0x140/0x140 [libahci]
6883 May  6 12:39:42 jerrie-pc kernel: [  116.264123]  ? ahci_do_hardreset+0x140/0x140 [libahci]
6884 May  6 12:39:42 jerrie-pc kernel: [  116.264127]  ? ahci_stop_engine+0xe0/0xe0 [libahci]
6885 May  6 12:39:42 jerrie-pc kernel: [  116.264130]  ata_eh_recover+0x3e0/0x12e0
6886 May  6 12:39:42 jerrie-pc kernel: [  116.264133]  ? ahci_stop_engine+0xe0/0xe0 [libahci]
6887 May  6 12:39:42 jerrie-pc kernel: [  116.264136]  ? ahci_do_hardreset+0x140/0x140 [libahci]
6888 May  6 12:39:42 jerrie-pc kernel: [  116.264139]  ? ahci_do_softreset+0x240/0x240 [libahci]
6889 May  6 12:39:42 jerrie-pc kernel: [  116.264143]  ? ata_phys_link_offline+0x60/0x60
6890 May  6 12:39:42 jerrie-pc kernel: [  116.264147]  ? ata_phys_link_offline+0x60/0x60
6891 May  6 12:39:42 jerrie-pc kernel: [  116.264151]  sata_pmp_error_handler+0x6c5/0x9e0
6892 May  6 12:39:42 jerrie-pc kernel: [  116.264154]  ? ata_phys_link_offline+0x60/0x60
6893 May  6 12:39:42 jerrie-pc kernel: [  116.264157]  ? ahci_stop_engine+0xe0/0xe0 [libahci]
6894 May  6 12:39:42 jerrie-pc kernel: [  116.264160]  ? ahci_do_softreset+0x240/0x240 [libahci]
6895 May  6 12:39:42 jerrie-pc kernel: [  116.264163]  ? ahci_do_hardreset+0x140/0x140 [libahci]
6896 May  6 12:39:42 jerrie-pc kernel: [  116.264167]  ? lock_timer_base+0x6b/0x90
6897 May  6 12:39:42 jerrie-pc kernel: [  116.264172]  ? scsi_try_target_reset+0xa0/0xa0
6898 May  6 12:39:42 jerrie-pc kernel: [  116.264176]  ahci_error_handler+0x45/0x80 [libahci]
6899 May  6 12:39:42 jerrie-pc kernel: [  116.264179]  ata_scsi_port_error_handler+0x35e/0x790
6900 May  6 12:39:42 jerrie-pc kernel: [  116.264182]  ? ata_scsi_cmd_error_handler+0xe7/0x140
6901 May  6 12:39:42 jerrie-pc kernel: [  116.264185]  ? scsi_try_target_reset+0xa0/0xa0
6902 May  6 12:39:42 jerrie-pc kernel: [  116.264188]  ata_scsi_error+0x95/0xd0
6903 May  6 12:39:42 jerrie-pc kernel: [  116.264192]  scsi_error_handler+0xcd/0x5a0
6904 May  6 12:39:42 jerrie-pc kernel: [  116.264197]  kthread+0x120/0x140


Q3 : Scsi_Host看起來是以一個host adapter為單位, 他是在什麼時候被init的?
Ans:


Q2 : sense? 在scsi裡面的sense指的是什麼?
Ans:
启动程序首先向目标发送命令，然后目标解码命令并向启动程序请求数据，或将数据发送给启动程序。在这之后，目标将状态发送给启动程序。如果状态损坏，启动程序将向目标发送一个请求检测（sense）指令。目标将返回检测数据，告知启动程序哪里出错。

Q1 : sata driver 是甚麼時候會進到error handle的function裡面?
Ans:
ata_scsi_queuecmd --> __ata_scsi_queuecmd --> ata_scsi_translate (設定ata_scsi_qc_complete) --> ata_scsi_qc_complete
--> ata_qc_done --> scsi_done --> scsi_softirq_done --> scsi_eh_wakeup (wake_up_process(shost->ehandler))
--> scsi_eh_scmd_add --> scsi_error_handler --> ata_scsi_error?

** 在scsi_eh_scmd_add會把cmd加到host的error handle queue裡面

** 在__ata_scsi_queuecmd裡面會判斷進來的scsi command是否可以轉換為ata command, 若可以, 就會呼叫ata_get_xlat_func
進行轉換, 並呼叫ata_scsi_translate進行處理.
如果不是的話, 就會呼叫ata_scsi_simulate來進行模擬.

** scsi_decide_disposition會決定command的後續要怎麼處理.

這部分有一些handle的case不是很了解, 無奈啊.
一開始會判斷是不是需要sense (請求檢測), 會根據不同的case產生不同的sense,
像是pass through sense:
1. opcode 為 ATA_16 或 opcode 為 ATA_12另外還OK_COND不能被拉起來且need_sense要不等於0
(need_sense不等於0代表command有fail)
(OK_COND被拉起來代表已經有經過sense程序)
 

OK_COND:
When set the SATL should yield a sense buffer containing a ATA Result descriptor irrespective of whether the command succeeded or failed. 
When clear the SATL should only yield a sense buffer containing a ATA Result descriptor if the command failed.

ps1:
 * Libata driver 将ata_scsi_queuecmd作为hostt->queuecommand的回调函数.
 * scsi命令在libata driver里面分两部分执行，一种是真的转换为ata命令称作translate，一种是借用ata命令执行完的结果填充相应命令的返回参数称作simulate.
 * 对于simulate而言不会牵涉到qc的处理，而translate类型的命令，调用ata_qc_new_init()来分配qc，并且scsi命令会转换为qc，转换完成后，ata_qc_issue()函数会将qc发送到ata设备，当qc完成后qc->complete_fn()回调函数里qc->scsidone()会通知scsi middle layer。

";i:1;N;i:2;N;}i:2;i:7833;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:14429;}i:17;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:14429;}}