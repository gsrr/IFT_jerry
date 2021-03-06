a:62:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190826";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:837:"
1. ULINLK Project
    - Discussion with "Total number of bays of each NAS model"
        - The PCIe information is not necessary due to the PCIe drive is viewed as a expansion device.
        - Provide Mein with template data to confirm it.
    - Error handle mechanism (4.5.0 done, 4.4.x Wait for PM notification)

2. V2188
    - Marvell driver and AQC driver can work normally.
    - Summary the procedure in Jira.

3. Smart migration (4.5.0 done)
    - Collect test report for Jira task.

4. SAS trim functionality.
([Bug 226215] [Samsung MZILT960HAHQ][TVS-EC1680U-SAS] SSD的資訊顯示不支援 SSD Trim功能)
關於這個問題, 要先確認一下有哪些cases需要處理...
從code看起來, 入口點都統一是在pd_sys_getinfo,
看起來應該只要處理getinfo_pd_in_root_boot_enclosure 與 getinfo_pd_in_sas_expander

";i:1;N;i:2;N;}i:2;i:29;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:876;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190819";i:1;i:1;i:2;i:876;}i:2;i:876;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:876;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1486:"
1. ULINK Project:
    - sata template index error. (Done)
    - raid info template format error. (Done)

2. Others
    - [Bug 226031] [TS-2088XU] 開關機Reboot測試時,發生開機過程中卡住的情形(call trace)
    (It may be the memory HW issue, take over by Citizen)
    
    - jira (SIRT-7) Create a basic ubuntu 18.04 driver collection list for VIS-2888 ()
        - Marvell Code compile (In progress)
        - AQC code compile (Done)
        - Marvell driver test (In progress)
        - 10G port test (In progress)

    - [Bug 226215] [Samsung MZILT960HAHQ][TVS-EC1680U-SAS] SSD的資訊顯示不支援 SSD Trim功能
        - SCSI trim function study (Done)
            - Logical Block Provisioning VPD page (B2H)
            - PD_CAP_TRIM -- (B0H and B2H) and (LBPU or LBPWS or LBPWS10)
            - PD_CAP_DZAT -- LBPRZ
        - HAL Code study and implementation (In progress)

toDo:
    - ULINK, merge "error handle mechanism" to QTS_4.4.x and QTS_4.4.1
    - [Bug 226215] [Samsung MZILT960HAHQ][TVS-EC1680U-SAS] SSD的資訊顯示不支援 SSD Trim功能
    - jira (SIRT-7) Create a basic ubuntu 18.04 driver collection list for VIS-2888 ()
    - Discussion with "Total number of bays of each NAS model"
    - Systemtrap test in QTS image.

Pending:
    - Raid info template enhancement (wait for jira number from PM and Jmicro).
    - SATA/SAS enhancement (wait for jira number from PM)
    - API for communicating with ULINK (wait for jira number from PM)


";i:1;N;i:2;N;}i:2;i:904;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2399;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190812";i:1;i:1;i:2;i:2399;}i:2;i:2399;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2399;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2357:"
[Summary]
1. SSD life estimation in smart disk migration
    - Functionality implementation --> Done.
    - Event notification --> Wail for PM

2. ULINK
    - Ignore QDA disk --> Done
    - io-test integration with Storage-man API --> Done
    - da_util log mechanism --> Done
    - Fix Nvme self test log analysis --> In progress

3. [Bug 226031] [TS-2088XU] 開關機Reboot測試時,發生開機過程中卡住的情形(call trace)
    - Null pointer error in kernfs_put
    - Null pointer error in kernfs_iop_permission

4. ToDo
    - [Bug 226031] Analysis
    - Raid info template enhancement (wait for jira number from PM and Jmicro).
    - SATA/SAS enhancement (wait for jira number from PM)
    - API for communicating with ULINK (wait for jira number from PM)
    - Systemtrap test in QTS image.

- [Bug 226031] [TS-2088XU] 開關機Reboot測試時,發生開機過程中卡住的情形(call trace)
稍微看了一下, 從code trace可以發現:
1. 總共有兩次的開關機.
2. Bug是發生在第二次的關機.
3. unable to handle kernel NULL pointer. (在kernfs_put這個function)
   而這個function是由__kernfs_remove所觸發.
4. oops 為0000, 表示:
bit 0 == 0 means no page found, 1 means a protection fault
bit 1 == 0 means read, 1 means write
bit 2 == 0 means kernel, 1 means user-mode

* IP is the instruction pointer.
* RIP is the CPU register containing the address of the instruction that is getting executed.
* my_oops_init+0x12/0x21 is the <symbol> + the offset/length.
--> The first number is offset from the beginning of the function.
--> The second number is total length of the function.

Reference: (Analysis Kernel dump trace)
1. https://stackoverflow.com/questions/13468286/how-to-read-understand-analyze-and-debug-a-linux-kernel-panic
2. https://opensourceforu.com/2011/01/understanding-a-kernel-oops/
3. https://www.freebsd.org/doc/en/books/developers-handbook/kerneldebug.html

看起來似乎會有race condition的狀況, 如果同時有兩個人進來, 只是奇怪, 這居然沒有處理好.
如果同時有兩個人進到atomic_dec_and_test:
if (!kn || !atomic_dec_and_test(&kn->count))
    return;

這時第一個人先離開, 並且free掉了, 然後第二個人正準備要進去atomic_dec_and_test,
他去取出kn->count, 就會造成Null pointer的問題.

kernfs_remove_by_name_ns --> __kernfs_remove



";i:1;N;i:2;N;}i:2;i:2427;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4793;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190805";i:1;i:1;i:2;i:4793;}i:2;i:4793;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4793;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1520:"
[Summary]
1. ULINK project
    - Ignore TR disk --> Done.
    - Serial number missing in NVMe drive--> Done
    - file lock mechanism for SATA error cnt --> Done
    - Bug 226039 - [Disk Analysis] Apply the setting of "Share my disk analysis data with QNAP"，show error message . (Done)
    - Confirm with lack of "Rack number" and "Slot number" --> Done

2. SSD life estimation in smart disk migration
    - Function for getting ssd life percentage --> testing...
    - Event message enhancement --> in progress

3. ToDo
    - Ignore QDA disk
    - Raid info template enhancement (wait for jira number from PM and Jmicro).
    - SATA/SAS enhancement (wait for jira number from PM)
    - API for communicating with ULINK (wait for jira number from PM)
    - Systemtrap test in QTS image. 
    - da_util log mechanism

4. Personal
    - 將centos 上的git repo移到ubuntu
    - 將post-commit 與re_exec_patch連接起來

[20190802]
幾個事項大概都已經完成了:
1. Ignore TR disk.
2. file lock
3. Serial number problem of NVMe

另外就是遇到Ulink回報問題: lack of "No. of Records", "Rack number" and "Slot number"
最後是缺乏"Rack number" and "Slot number"的部分是Ulink的test data.

現在要準備處理smart disk migration, 應該今天可以完成.
還有Raid info template --> 需要修改structure.
SATA/SAS Template enhancement要等PM開Jira task.
還有剛剛Josphe 新增template control的功能.(定義好了, 但是要怎麼透過api溝通?)
QDA這個裝置也需要濾掉.



";i:1;N;i:2;N;}i:2;i:4821;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6350;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190729";i:1;i:1;i:2;i:6350;}i:2;i:6350;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6350;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2471:"
[Summary]
1. ULINK Project 
    - Merge SATA and SAS template into QTS 4.4.1 --> Done
    - Error handle mechanism for fail to upload. --> Testing...
      - Bug of cloud upload tool. --> Done
    - SAS and NVMe header data error --> Done
      - Add gen_header function in da_util. 
      - Modify header mechanism for SATA, SAS, NVMe
      (Bug 141364 - [Disk Failure Analysis][NVMe]disk data collection and upload to QNAP cloud 資料需要匿名收集)
    - Latency count enhancement --> Done.

2. Smart migration(add SSD life time for consideration) --> In progress
    - Work flow of smart migration --> Done
    - Event discussion with PM --> Done

3. ToDo
    - TR disk test for ULNK project
    - file lock for read/write statistic data.
    - Systemtrap test in QTS image. 
    - Raid info template enhancement.
    - SATA/SAS Template enhancement
    - Fetch serial number in NVMe

Q: How to implement module_init mechanism in C?
Ans:

Q: usb disk如何回報變成一個scsi disk?

[20190723]
目前已經將code merge到branch 4.4.x了.
雖然ULINK的部分還是有些bug (像換行問題, 與hash問題)
但目前可能要先花時間確認一下smart disk migration的功能

[Smart Disk Migration]
Q4 : smart health predict會回傳一個smart id, 這個smart id的用意是?
Ans:
smart id如果是SATA的話會回傳abnormal的smart項目 id.
如果是SAS的話只會回傳-1
Nvme則會回傳0 (不做事情)

Q3 : 從文件看起來並不是透過polling, 是由一個HW monitor來通知, 這個monitor是...?
Ans:
靠, 是/sbin/hal_daemon ...
(static void *hal_hd_smart_monitor(void *thread_name))

目前看起來polling時間是6分鐘,  
(disk_smart_time = smart_interval_mins * 60;)
hal_hd_smart_monitor(7149):DISK S.M.A.R.T interval = 300 seconds


Q2 : 監控每一顆disk?
Ans:
看起來是要監控每一顆disk沒錯, 掃描過所有的enclosure與其中的所有disk.
每一個disk 都呼叫 SDM_device(dev_id)來進行處理.
那...
1. 在SDM_device裡面, 是抓取smart data來進行判斷嗎?然後抓取Raid info, 
然後抓取Raid info, 看看有沒有spare drive.
若從smart data得知disk快壞掉的話, 且是Raid5, spare drive也存在, 就進行migration?

Q1 : What is smart disk migration?
Ans : 
就是會自動判斷disk的狀態來進行migration.
一點疑問就是...
1. 所以要監控每一顆disk? (抓取smart data)
2. 從文件看起來並不是透過polling, 是由一個HW monitor來通知, 這個monitor是...?
";i:1;N;i:2;N;}i:2;i:6378;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8859;}i:21;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190722";i:1;i:1;i:2;i:8859;}i:2;i:8859;}i:22;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:8859;}i:23;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1903:"
1. ULINK Project 
    - Raid info template for SATA, SAS, Nvme --> Done.
    - Latency count improvement(Both Kernel and hal_util) --> Done.
        * Add a variable in scsi_cmnd to record jiffies.
        * Add transfer size for calculating latency.
        * Modify latency time to 300ms(SSD), 1000ms + (transfer_size/256)*2ms(HDD)
    - SAS template 334 --> Done.

2. Smart migration(add SSD life time for consideration) --> In progress
    - NasUtil/sdmd/sdmd.c

3. ToDo
    - Merge SATA and SAS template into QTS 4.4.1
    - TR disk test for ULNK project
    - Error handle mechanism for fail to upload.
    - file lock for read/write statistic data.
    - Systemtrap test in QTS image. 

[   31.142795] BUG: unable to handle kernel paging request at ffff88019c8d4780
[   31.149754] IP: 0xffff88019c8d4780
[   31.153148] PGD 28cb067 P4D 28cb067 PUD 28ce067 PMD 19d3d4063 PTE 800000019c8d4063
[   31.160712] Oops: 0011 [#1] SMP PTI
[   31.164195] Modules linked in: qm2_i2c(O) intel_ips drbd lru_cache flashcache(O) dm_tier_hro_algo dm_thin_pool dm_bio_prison dm_persistent_data hal_netlink(O) k10temp coretemp igb e1000e nvme(O) nvme_core(O) mlx_compat(O) mpt3sas scsi_transport_sas raid_class scsi_transport_fc usb_storage xhci_pci xhci_hcd usblp uhci_hcd ehci_pci ehci_hcd


Reference: https://blog.csdn.net/han_dawei/article/details/41846055

--> 這個問題在整個image進行重build後就解決了, 所以應該只是有些東西沒有build到, 造成kernel在refer memory時位置不正確?

* 目前已經把sas template 334 (standard inquiry data)實作完成了.
但是昨天透過repo clean, repo sync的方式要進行重新編譯會一直fail...?
(先試著把整個資料夾刪掉再build一次看看)

* latency 對於transfer length的部分要implement.
* SAS template跟SATA template要merge到QTS4.4.1
* 上傳data的error handle要處理(fail時要存起來)
* file lock




";i:1;N;i:2;N;}i:2;i:8887;}i:24;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10800;}i:25;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190715";i:1;i:1;i:2;i:10800;}i:2;i:10800;}i:26;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:10800;}i:27;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:788:"
1. ULINK project:
    1. Raid info template implementation --> In progress (testing...)
        1.1 Integrate with storage-man --> Done.
        1.2 Solve bug in Nvme segment(No. of Records and memory issue) --> Done.
        1.3 Ignore template 16, 201, 202 if default volume doesn't exist. --> Done.
        1.4 Adjust code flow and add Raidinfo into sata, sas, nvme data. --> Done.
        
    2. API for deleting all statistic data --> Done.
    3. Confirm latency count equation with ULINK --> Done.
    
2. Set up Build server --> Done.

3. ToDo:
    1. file lock for read/write statistic data.
    2. Latency count in SCSI layer implementation.
    3. Systemtrap test in QTS image. 
    4. Error handle mechanism for fail to upload.
    5. SAS template --> standard inquiry data
";i:1;N;i:2;N;}i:2;i:10830;}i:28;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11627;}i:29;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190708";i:1;i:1;i:2;i:11627;}i:2;i:11627;}i:30;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:11627;}i:31;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:4795:"
[Summary]
1. AWS EBS volume performace test - Done, the result is summarized in jira.
(https://qnap-jira.qnap.com.tw/browse/CLDVCLD0-12)

2. Multipath in device mapper with Nvme
    - Group priority setting : No suitable hw parameter for Nvme.
    - Group id for identifying : Extended Unique Identifier(EUI64)

3. ULINK project:
    - Raid info template structure define ---> Done.
    - Update SAS template (Add template 333 and modify template 332) ---> Done
        * Add config mechanism for adjusting length dynamically.
    - Enable / Disable mechanism in hal layer. --> Done
    - API for deleting all files. --> In progress
    
4. Set up Build server environment --> In progress.

ToDo:
    1. file lock for read/write statistic data.
    2. Raid info template implementation
    3. Latency count in SCSI layer implementation.
    4. Systemtrap test in QTS image.   
    
目前手頭上交代的事情都弄得差不多了...

現在需要處理的應該是把一些ULINK要修改的部分處理完成.
1. Define Raid info template for storage-man
  --> 確認有無jira number?
2. Implement latency count in SCSI layer.
3. file lock for read/write statistic data.
4. API for deleting all files
5. Systemtrap test in QTS image.

Personal:
Implementation phrase:
1. 在自己的local git上進行修改, 改完後更新到build server進行編譯.
2. build server編譯完後, 將檔案更新到NAS, 進行驗證.
  - 這裡是不是應該要有個test script來進行測試.
  - 更新到NAS的動作可以自動化, 而且最好是可以編譯完->上傳到NAS->重開機->開完機後執行test script->顯示結果.

Alpha test phrase:
1. 建立新資料夾, 從repo下載最新的檔案.
2. 進入docker, 建立相關檔案.
3. 選擇model, 開始編譯
4. 將image更新到NAS, 重開機後進行驗證測試.



Attention:
1. 在branch回歸之前不可以pull, 否則會被remote server洗掉tag.

==================================================================
1. vQTS驗證
目前一開始接收到的訊息是要進行io performance(對五種aws所提供的volume)
從機器看, volume已經建好, 分別是:
1. /dev/sdb --> /dev/xvdb (274.8GB) --> general purpose SSD (gp2)
2. /dev/sdc --> /dev/xvdc (309.2GB) --> Provisioned IOPS SSD (io1) 
3. /dev/sdd --> /dev/xvdd (549.7GB) --> Cold HDD (sc1)
4. /dev/sde --> /dev/xvde (584.1GB) --> Throughtput optimized HDD (st1)
5. /dev/sdf --> /dev/xvdf (343.5GB) --> Magnetic (standard)

馬的, 複雜... 我總要先知道它們測試的基準是甚麼, 不然測出來的數據要怎麼比較?
gp2/io1 --> 16 KiB I/O size
st1/sc1 --> 1 MiB I/O size

AWS EBS--> 稱為AWS Elastic Block Store, 是Amazon提供的區塊儲存區.
這個block device主要分為兩種類型:
1. 大量交易的工作 --> 效能取決於IOPS, 適用SSD支援儲存. (io1 & gp2)
2. 輸送輛密集型的工作 --> 效能取決於每秒的MB, 適用於HDD支援儲存. (st1 & sc1)

所以io1 & gp2是使用16K IO大小來進行測試, 而st1 & sc1是使用1MB IO大小.


test command of AWS:
[iops]
fio --name=/dev/xvdc --direct=1 --rw=read --bs=16k --size=1G --numjobs=64 --time_based --runtime=10 --iodepth=64

[throughput]
fio --name=/dev/xvde --direct=1 --rw=write --randrepeat=0 --bs=1024k --time_based=1 --runtime=20 --iodepth=8


[Reference]
1. banchmark
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/benchmark_procedures.html

----AWS Summary ----
IOPS : The request number of IO operations per second.

gp2 調整到1000GB的原因: 3 IOPS per GB, 所以3000 IOPS為 1000GB

[Command]
1. io1 & gp2
sudo fio --name=/dev/xvdb  --direct=1 --rw=randread --bs=16k --size=1G --numjobs=16 --time_based --runtime=30  --norandommap --group_reporting

2. st1 & sc1
sudo fio --name=/dev/xvde --direct=1 --rw=write --randrepeat=0 --bs=1024k --time_based=1 --runtime=30 --iodepth=8 --size=100G --ioengine=libaio

[Test Result]
ubuntu(sc1) --> write:     io=1900.0MB, bw=64593KB/s, iops=63, runt= 30121msec
ubuntu(st1) --> write:     io=1900.0MB, bw=64584KB/s, iops=63, runt= 30125msec
ubuntu(gp2) --> randwrite: io=1482.4MB, bw=50588KB/s, iops=3161, runt= 30006msec
ubuntu(io1) --> randwrite: io=1892.6MB, bw=64590KB/s, iops=4036, runt= 30004msec

qts(sc1) --> write: 	 io=1899.0MB, bw=64570KB/s, iops=63, runt= 30116msec
qts(st1) --> write:      io=1899.0MB, bw=64574KB/s, iops=63, runt= 30114msec
qts(gp2) --> randwrite:  io=759280KB, bw=25308KB/s, iops=1581, runt= 30001msec
qts(io1) --> randwrite:  io=634048KB, bw=21134KB/s, iops=1320, runt= 30001msec
qts(magnetic) --> write: io=1842.0MB, bw=62602KB/s, iops=61, runt= 30130msec


[Reference]
1. benchmark
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/benchmark_procedures.html

2. Amazon EBS Volume Type
https://docs.aws.amazon.com/en_us/AWSEC2/latest/UserGuide/EBSVolumeTypes.html
";i:1;N;i:2;N;}i:2;i:11657;}i:32;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16462;}i:33;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190701";i:1;i:1;i:2;i:16462;}i:2;i:16462;}i:34;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:16462;}i:35;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2512:"
1. Enable/Disable mechanism.
    1.1 確認可以從User space發event下去.
    1.2 想寫一個外部程式來測試hal的netlink function.
    
2. multipath功能確認, 目前的QTS(linux 4.14是否有support?)
    2.1 目前已經架好環境(ubuntu with linux 4.14), 搭配Nvme測試後可以正常建立multipath of devmapper.
    2.2 接下來就是進行io test.
    2.3 另外好奇的一點是... Nvme在multipath是bio-based or request-based?
    (照理說應該不是request-based, 這部分應該可以使用ftrace來進行確認.)
    2.4 進行測試: failover and failback 與資料正確性 (fio可以檢查?).
    
4. 補充test report for sas template --> Done

ToDo:
1. io test program by python.
2. ubuntu - ssh with root login
3. multipath fio test error test (failover/failover in fio test)


整個netlink覺得怪怪的, 感覺不應該送不下去, 到底kernel有沒有跑起來阿?
機車, 又不太好確定.
只是奇怪的一點, 為什麼從userspace送下去的msg不用指定msghdr指定dst_addr (包含port id)?
Ans:
終於確定了, 原來netlink宣告的一些structure需要放在global area, 之前一直放在local area才會導致一直fail.
不過怎麼會這樣呢? 後面可能需要確認一下.
--> 原來不是這麼一回事, 是因為:
"it's on the stack, the memory for it isn't zeroed and you have garbage in some field."

- 檢查hal_netlink : lsmod|grep hal_netlink

不過今天大概要處理的事項是:
1. 將ulink enable/disable 的機制完成.
2. build linux 4.14, 為了trace multipath.
(還是先用4.18來看?)

============================================================
1. Ulink project:
    - Enable / Disable mechanism in Kernel. --> Done
    - Confirm latency setting with ULINK. --> In progress
    - Raid template implementation --> In progress.

2. Multipath in devmapper 
    2.1 Confirm multipath function with Nvme in QTS image --> Done
        (multipath-tool - 0.4.9 & linux 4.14)
    2.2 Confirm multipath function with Nvme in ubuntu environment. --> Done
        (multipath-tool - 0.7.4 & linux 4.14)
        - Performance Evaluation ("multibus", "failover", and "no-multipath")
        - Failover / Failback test
        - Verify error handle function during failover/failback.
    
3. ToDo
    3.1. Raid template info implementation

    3.2. ULINK Enhancement:
        - adjust latency time implementation.
        - file lock for statistic data file.
        - API for deleting all files.
 
    3.3 Systemtap in QTS image

";i:1;N;i:2;N;}i:2;i:16492;}i:36;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:19014;}i:37;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190624";i:1;i:1;i:2;i:19014;}i:2;i:19014;}i:38;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:19014;}i:39;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1585:"
1. Ulink project:
    - SAS template implementation --> Done.
    - Change the file location and add check function for default volume. --> Done
    - Latency event issue in booting phase --> Done
      (The latency time will be adjust : HDD (100ms to 1000ms), SSD (10ms to 300ms))
    - Enable / Disable mechanism in Kernel. --> In progress

2. ToDo
    2.1. Multipath for Nvme.

    2.2. ULINK Enhancement:
        - file lock for statistic data file.
        - API for deleting all files.
 
    2.3 Systemtap in QTS image

====================================
1. Personal
    - documentation for Lecroy ()
    - syntastic for c language  --> Done. 
用vim plugin中的syntastic來進行檢查, 會有兩個checker, 一個是cppcheck, 一個是gcc

    - development environment setting

2. Ulink project
    - Change the file location. --> Done
  大概已經ok了 , 測試過後行為上符合預期.
  
    - SAS template implementation
    - SATA error count enable/disable

Q1: How to send hal event from user space?
NETLINK_EVT event;
if (UTIL_Test_PD_Flag(pd, DISK_IN_STANDBY))
    UTIL_Debug(TRACE_INFO, "%s(%d):PD still in standby mode,enc_id = %d,port_id = %d\n",__func__, __LINE__, enc->enc_id, pd->port_id);
    event.type = HAL_EVENT_GENERAL_DISK;
    event.arg.action = SET_PD_STANDBY;
    event.arg.param.netlink_pd.enc_id = enc->enc_id;
    memcpy(event.arg.param.netlink_pd.scsi_bus, pd->scsi_bus, sizeof(pd->scsi_bus));
    EVT_Send_To_Kernel(netlink_hd_fd, &event);

Q2: hal receive event是在nasdriver裡面, 這裡要如何獨立去build出這個module?
Ans:

";i:1;N;i:2;N;}i:2;i:19044;}i:40;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:20638;}i:41;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190617";i:1;i:1;i:2;i:20638;}i:2;i:20638;}i:42;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:20638;}i:43;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:738:"
1. ULINK project
    1.1 QTS can not boot completely (latency event issue) --> Done.
    1.2 SAS template 24-50 implementation --> In progress
      - APT for fetching data from SAS drive. --> Done
      - Head data for ulink --> In progress
      - Integration test --> In progress
    1.3 Latency event issue analysis in booting phrase. --> In progress
      - The latency time will be affected by io size.
    1.4 Enhancement
      - API for deleting all files.
      - file lock for read/write file. 
      - Confirm the location of statistic data file.

2. Systemtap study in QTS image.
  (http://spec.qnap.com.tw/projects/fault_injectiop/wiki/SystemTap_building_on_QTS)
  
3. Personal
  - vim environment set up.
  - 修改da_util
";i:1;N;i:2;N;}i:2;i:20668;}i:44;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:21415;}i:45;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190610";i:1;i:1;i:2;i:21415;}i:2;i:21415;}i:46;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:21415;}i:47;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:827:"
1. ULINK project 
    1.1 taskfile error counting for Marvell controller --> Done.
        - Confirm the report value if the item is not supported by hardware controller.(0 is fine.)  
        - Summary spec and implementation details for item 16,22,23.
    1.2 Confirm SATA drive in expander --> Done.
        --> Cannot get ATA event.(Scsi event is fine.)
    1.3 Test for QTS-4.5.0 --> Done.
    1.4 Issue analysis --> QTS cannot boot completely --> In progress
    
2. ToDo
    2.1 ULINK project 
        - SAS template 24-50 implementation.
        - Check hal latency event issue --> QTS cannot boot completely.
        - API for deleting all binary files.
        - file lock for read/write binary file. 
        - Confirm the location of statistic data.
    2.2 Systemtap study in QTS image.
    
3. Personal
    3.1

";i:1;N;i:2;N;}i:2;i:21445;}i:48;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:22282;}i:49;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190603";i:1;i:1;i:2;i:22282;}i:2;i:22282;}i:50;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:22282;}i:51;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:739:"
1. ULINK project implementation(item :16, 22, 23)
  1.1 ata link error count of ahci controller --> Done.
  1.2 iotest(item 22) --> Done.
    - da_util, da_util.sh and crontab content. 
    - Integrate with API of storage-man.
  1.3 Set drive latency value after booting.
  1.4 API for Burton. (Generate data buffer) --> Done.
  1.5 Code test in QTS-4.4.x
  1.6 Trace code for Marvell controller -- In progress
  
2. ToDo
  1. ata cmd/link error count implementation for Marvell controller.
  2. file lock for drive statistic data.
  3. code test in QTS-4.5.0 version
  4. Summary ulink spec.
  5. Add a flag to distinguish action between delete/none-delete

Reference:
1. https://www.seagate.com/support/disc/manuals/sata/sata_im.pdf
  
";i:1;N;i:2;N;}i:2;i:22312;}i:52;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:23061;}i:53;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190527";i:1;i:1;i:2;i:23061;}i:2;i:23061;}i:54;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:23061;}i:55;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:892:"
1. ULINK project implementation(item :16, 22, 23)
  1.1 item 16:
    - ata command error count(including "Drive not ready") --> Done
    - ata link error count --> It will be finished next week.

  1.2 item 22:
    - scsi command retry count --> Done
    - IOPS and MBPS --> Done
    - scsi command latency count --> Done
      -- Add a parameter in scsi_device
      -- Control the value by sysfs. (qnap_param_latency)
  
  1.3 item 23:
    - scsi command error count --> Done

2. ULINK project spec confirmation:
  2.1 Type of cell value --> unsigned integer.
  2.2 Confirm long latency count.

3. ToDo:
  2.1 ULINK project
    - item 16 : ata link error count.
    - Marvell controller code trace: Error handle for ata command failure and ata link failure.
    - file lock when read/write counting file.
    - drive partition confirmation with Nike.
    - Integration with Burton.
   
  
";i:1;N;i:2;N;}i:2;i:23091;}i:56;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:23992;}i:57;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"20190520";i:1;i:1;i:2;i:23992;}i:2;i:23992;}i:58;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:23992;}i:59;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:5646:"
[20190520]  
1. ULINK project (item :16, 22, 23)
  1. Code trace:
    1.1 Marvell controller
      --> Need time to trace code for Marvell controller
    1.2 Error handle: ata command(template 16), ata link(template 16) and scsi command (template 22, 23).
    
  2. Spec confirm:
    2.1 Value type : Little Endian now.
    2.2 template revision : 100 (decimal) now.
    2.3 cell size : 16 bytes. (8 bytes reserved)
    
  3. Implementation and discussion:
    3.1 Issue event from Kernel to HAL by netlink. 
      - Add event code and structure in hal_event.h (Both in Kernel and hal)
    3.2 Simulated function for error state. 
    3.3 Name of file : disk_data_$serial_$temp.
    
2. Build Kernel, hal and DOM recovery:
  2.1 Build QTS kernel and hal, hal_util(hal_daemon).
    - Upgrade QTS from GUI. (韌體更新)
    - Upgrade QTS from script. (/etc/init.d/update.sh $image_name)
    - Replace Kernel:
      a. Mount partition-2 and partition-3 in DOM.
      b. Replace bzImage and bzImage.chsum
    - Build command:
      a. Build QTS image : time make CPU_N=-j8 BUILD_OPT=pure 2>&1 | tee log 
      b. Build Kernel : time make CPU_N=-j4 BUILD_OPT=pure BASE KERNEL 2>&1 | tee log
      c. Build hal_util: time make CPU_N=-j4 BUILD_OPT=pure NAS_UTILITY 2>&1 | tee log
        
  2.2 DOM recovery: 
      a. dd full image: dd if=//172.17.21.5/pub/NAS_FULL_IMAGE/xxx/xx.image of=/dev/sdx
      b. mkdir /mnt/update
      c. mount -t tmpfs none -o size=1G /mnt/update
      d. update release image from daily build: /etc/init.d/update.sh //172.17.21.5/pub/daily_build/xxx/xxx.img
      
3. ToDo
  3.1. Code trace:
    - Marvell controller code trace.
      --> Error handle for ata command failure and ata link failure.
    
  3.2. Implementation:
    - file(binary format) for ULINK template.
    - Error distinguish and counting in HAL layer.
    - Integration with Burton's code structure.
    - IOPS Read/Write and Latency Read/Write

[20190513]   
1. ULINK project (item :16, 22, 23)
        1.1 Implementation detail discussion.
            --> I will issue event from kernel space to user space , and the count will be accumulated in use space.)
        1.2 Netlink issue event test 
            --> Send 100 messages continuously and no message is lost.
        1.3 Trace code : SATA error handle flow
            --> Success and fail event : Be issued in SATA layer
            --> Retry event : Be issued in SCSI layer.
        1.4  IOPS spec confirmation
            --> fio test for different file-size (includs ssd and sata drive)
            --> iodepth = 32, test duration=10, direct block io for SWAP partition of disk.
        1.5 Distinguish SATA drive in SCSI layer. (Use driver name currently.)
        1.6 SATA drive ready status study. (ATA_DRDY )
        1.7 Read/Write Operation : "READ DMA EXT", "READ FPDMA QUEUED" and "READ DMA"
 
    2. ToDo
        2.1 A function for simulating error state in SATA driver.
        2.2 Implementation for issuing event to HAL, count recording (Success , Fail  and Retry event)
        2.3 IOPS data implementation and send data to ULINK website.
        2.4 marvell disk confirmation.  
  
[20190506]
    1. ULINK project 
        1.1 Confirm spec details (item :16, 22, 23)
        1.2 SATA code study for implementation
            a. Error handler of ATA command.
            b. The corresponding command/function for "Unit Not Ready".
            c. Trace code flow of plug/unplug drive (How to check "Unit Ready"?)

    2. SCSI framework study
        2.1 request_fn --> dispatch command --> queuecommand --> scsi_softirq_done

     ToDo:
        1. Confirm ULINK implementation details.
        2. SCSI framework, SATA code, SAS code study.

[20190426]
  [Multipath]
    1. Presentation for dm-multipath.
      1.1 Understanding the mechanism of no_path_retry and failover.
    2. Further study of dm-multipath:
      2.1 failback mechanism with plug/unplug SAS drive.
        --> Control by multipathd (unrelated to Kernel module)
      2.2 ioctl command(SMART check) in dm-multipath
        --> The ioctl command can be rerouted to real device.
      2.3 performance with dm-multipath (w/o dm-multipath) for SSD(SAS interface) and SAS dirve.  
        --> https://docs.google.com/spreadsheets/d/1Ztgpf-RQa4JaMTDYEljTI-UcYEnVUFpS9LOcyzcZGbg/edit?usp=sharing
  [Todo]
    1. SCSI and SAS driver
    
[20190419]
  [Study : Multipath of device mapper]
      1. Device mapper framework architecture.
      2. bio-base mpath and request-base mpath
      3. Responsibility for multipathd(path check and failback) and dm-mpath(reroute and failover).
      4. "alua is not supported"
    
  [Todo]
      1. no_path_retry mechanism.
      2. Deep understanding for failover mechanism.
      3. Presentation for multipath of device mapper.
      4. Study for SAS protocol.
      
[20190412]
1. 開發環境建置與認識
        1. Account creation : 
            - Redmine, Bugzilla, git
            - vpn, gmail, skype, notes
        2. opengrok, wiki (personal)
        3. daily build server
        4. build server for NAS image.
            - Build image (Doc: Build QTS Firmware) and upgrade from NAS GUI.

    2. 工作流程認識
        - Redmine, Bugzilla, Excel for Model information (commit code to which model).
        - Doc : NASWare Development Environment

    3. Multipath study
        - Build mulipath 0.7.4 
        - SAS environment creation.
        - Learning behavior of multipath:
            - failover and multibus for path grouping.
            - round-robin for path selector.

ToDo:
    1. Multipath and Device mapper study:
    2. SAS driver study
";i:1;N;i:2;N;}i:2;i:24019;}i:60;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:29673;}i:61;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:29673;}}