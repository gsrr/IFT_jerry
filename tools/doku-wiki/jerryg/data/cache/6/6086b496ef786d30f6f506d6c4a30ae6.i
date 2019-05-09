a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:3018:"
[20190513]
    1. Trace error handle flow of SATA driver.
    2. ULINK project implementation discussion.
       2.1 issue event to userspace and record the information in userspace.
       2.2 Netlink program test for multiple event from kernel space to user space at the same time.
       2.3 Confirm ULINK spec (detail of IOPS items, meaning of "Other Drive Failure")
       2.4 SATA drive ready status study.
         - ATA_DRDY bit.
       2.5 Read/Write Operation : "READ DMA EXT", "READ FPDMA QUEUED" and "READ DMA"
    
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
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}