a:26:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"seq write";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:3765:"
multibus round-robin 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=116k, BW=453MiB/s (475MB/s)(5120MiB/11308msec)
  mixed: IOPS=109k, BW=424MiB/s (445MB/s)(5120MiB/12063msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=37.2k, BW=145MiB/s (152MB/s)(5120MiB/35241msec)
  mixed: IOPS=35.9k, BW=140MiB/s (147MB/s)(5120MiB/36528msec)

multibus service-time 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=116k, BW=452MiB/s (474MB/s)(5120MiB/11324msec)
  mixed: IOPS=109k, BW=428MiB/s (448MB/s)(5120MiB/11976msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=41.7k, BW=163MiB/s (171MB/s)(5120MiB/31462msec)
  mixed: IOPS=40.2k, BW=157MiB/s (165MB/s)(5120MiB/32567msec)

multibus queue-length 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=116k, BW=454MiB/s (476MB/s)(5120MiB/11288msec)
  mixed: IOPS=109k, BW=425MiB/s (445MB/s)(5120MiB/12051msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=40.9k, BW=160MiB/s (167MB/s)(5120MiB/32076msec)
  mixed: IOPS=39.2k, BW=153MiB/s (161MB/s)(5120MiB/33436msec)

failover round-robin 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=115k, BW=451MiB/s (473MB/s)(5120MiB/11362msec)
  mixed: IOPS=110k, BW=428MiB/s (449MB/s)(5120MiB/11954msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=54.3k, BW=212MiB/s (222MB/s)(5120MiB/24150msec)
  mixed: IOPS=50.7k, BW=198MiB/s (207MB/s)(5120MiB/25875msec)

failover service-time 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=115k, BW=451MiB/s (473MB/s)(5120MiB/11350msec)
  mixed: IOPS=110k, BW=431MiB/s (451MB/s)(5120MiB/11891msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=54.1k, BW=211MiB/s (222MB/s)(5120MiB/24221msec)
  mixed: IOPS=50.8k, BW=198MiB/s (208MB/s)(5120MiB/25822msec)

failover queue-length 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=116k, BW=452MiB/s (474MB/s)(5120MiB/11315msec)
  mixed: IOPS=110k, BW=431MiB/s (452MB/s)(5120MiB/11880msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=54.1k, BW=211MiB/s (222MB/s)(5120MiB/24233msec)
  mixed: IOPS=50.9k, BW=199MiB/s (208MB/s)(5120MiB/25772msec)
without multipath
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=117k, BW=457MiB/s (479MB/s)(5120MiB/11215msec)
  mixed: IOPS=114k, BW=444MiB/s (466MB/s)(5120MiB/11524msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=write --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=53.4k, BW=209MiB/s (219MB/s)(5120MiB/24532msec)
  mixed: IOPS=51.4k, BW=201MiB/s (210MB/s)(5120MiB/25515msec)

";i:1;N;i:2;N;}i:2;i:31;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3805;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"Performance";i:1;i:1;i:2;i:3805;}i:2;i:3805;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:3805;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2977:"
multibus round-robin 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=108k, BW=422MiB/s (443MB/s)(5120MiB/12122msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=2146, BW=8586KiB/s (8792kB/s)(5120MiB/610653msec)

multibus service-time 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=36.6k, BW=143MiB/s (150MB/s)(5120MiB/35773msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=2258, BW=9034KiB/s (9251kB/s)(5120MiB/580336msec)

multibus queue-length 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=108k, BW=421MiB/s (442MB/s)(5120MiB/12155msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=2259, BW=9038KiB/s (9255kB/s)(5120MiB/580065msec)

failover round-robin 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=93.3k, BW=364MiB/s (382MB/s)(5120MiB/14055msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=2822, BW=11.0MiB/s (11.6MB/s)(5120MiB/464413msec)

failover service-time 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=36.4k, BW=142MiB/s (149MB/s)(5120MiB/35999msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=2803, BW=10.9MiB/s (11.5MB/s)(5120MiB/467584msec)

failover queue-length 0
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=93.2k, BW=364MiB/s (382MB/s)(5120MiB/14068msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=2859, BW=11.2MiB/s (11.7MB/s)(5120MiB/458407msec)
without multipath
fio --name=/mnt_ssd/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=101k, BW=394MiB/s (413MB/s)(5120MiB/12991msec)
fio --name=/mnt_sas/file --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=5G  --unified_rw_reporting=1 | grep mixed
  mixed: IOPS=2970, BW=11.6MiB/s (12.2MB/s)(5120MiB/441185msec)
";i:1;N;i:2;N;}i:2;i:3836;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6823;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"multipath.conf";i:1;i:1;i:2;i:6823;}i:2;i:6823;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6823;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:328:"
root@jerrie-pc:~# cat /etc/multipath.conf
defaults {
        path_grouping_policy "failover"
        uid_attribute "ID_SERIAL"
        find_multipaths no
        user_friendly_names no
    path_selector "round-robin 0"
    no_path_retry 3
    prio "weightedpath"
    prio_args "devname sdb 10 sde 5"
    failback "immediate"
}
";i:1;N;i:2;N;}i:2;i:6857;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7195;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"path_no_retry";i:1;i:1;i:2;i:7195;}i:2;i:7195;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:7195;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:18371:"
Apr 24 19:23:16 | uevent 'remove' from '/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/host0/port-0:17/expander-0:17/port-0:17:0/end_device-0:17:0/target0:0:51/0:0:51:0/block/sdb'
Apr 24 19:23:16 | Forwarding 1 uevents
Apr 24 19:23:16 | sdb: remove path (uevent)
Apr 24 19:23:16 | 35000c50041ed41c3: failback = "immediate" (setting: multipath.conf defaults/devices section)
Apr 24 19:23:16 | 35000c50041ed41c3: path_grouping_policy = failover (setting: multipath.conf defaults/devices section)
Apr 24 19:23:16 | 35000c50041ed41c3: path_selector = "round-robin 0" (setting: multipath.conf defaults/devices section)
Apr 24 19:23:16 | 35000c50041ed41c3: hardware_handler = "0" (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: no_path_retry = 3 (setting: multipath.conf defaults/devices section)
Apr 24 19:23:16 | 35000c50041ed41c3: retain_attached_hw_handler = yes (setting: implied in kernel >= 4.3.0)
Apr 24 19:23:16 | 35000c50041ed41c3: features = "0" (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: rr_weight = "uniform" (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: minio = 1 (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: fast_io_fail_tmo = 5 (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: deferred_remove = no (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: delay_watch_checks = "no" (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: delay_wait_checks = "no" (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: marginal_path_err_sample_time = "no" (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: marginal_path_err_rate_threshold = "no" (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: marginal_path_err_recheck_gap_time = "no" (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: marginal_path_double_failed_time = "no" (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: skip_kpartx = no (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: update dev_loss_tmo to 15
Apr 24 19:23:16 | sde: No SAS end device for 'end_device-0:18'
Apr 24 19:23:16 | 35000c50041ed41c3: assembled map [1 queue_if_no_path 0 1 1 round-robin 0 1 1 8:64 1
]
Apr 24 19:23:16 | 35000c50041ed41c3: load table [0 976773168 multipath 1 queue_if_no_path 0 1 1 round-robin 0 1 1 8:64 1
]
Apr 24 19:23:16 | 35000c50041ed41c3: disassemble map [1 queue_if_no_path 0 1 1 round-robin 0 1 1 8:64 1 ]
Apr 24 19:23:16 | 35000c50041ed41c3: disassemble status [2 1 0 0 1 1 E 0 1 0 8:64 A 0 ]
Apr 24 19:23:16 | 35000c50041ed41c3: discover
Apr 24 19:23:16 | 35000c50041ed41c3: searching paths for valid hwe
Apr 24 19:23:16 | sde: vendor = SEAGATE
Apr 24 19:23:16 | sde: product = ST500NM0001
Apr 24 19:23:16 | sde: rev = 0002
Apr 24 19:23:16 | searching hwtable
Apr 24 19:23:16 | 35000c50041ed41c3: no hardware entry found, using defaults
Apr 24 19:23:16 | 35000c50041ed41c3: rr_weight = "uniform" (setting: multipath internal)
Apr 24 19:23:16 | 35000c50041ed41c3: failback = "immediate" (setting: multipath.conf defaults/devices section)
Apr 24 19:23:16 | 35000c50041ed41c3: no_path_retry = 3 (setting: multipath.conf defaults/devices section)
Apr 24 19:23:16 | 35000c50041ed41c3: flush_on_last_del = no (setting: multipath internal)
Apr 24 19:23:16 | sdb [8:16]: path removed from map 35000c50041ed41c3
Apr 24 19:23:16 | tur checker refcount 6
Apr 24 19:23:16 | weightedpath prioritizer refcount 6
Apr 24 19:23:16 | uevent 'change' from '/devices/virtual/block/dm-1'
Apr 24 19:23:16 | uevent 'remove' from '/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/host0/port-0:17/expander-0:17/port-0:17:1/end_device-0:17:1/target0:0:52/0:0:52:0/block/sdc'
Apr 24 19:23:17 | pp->tick:12, tick:1
Apr 24 19:23:17 | pp->tick:12, tick:1
Apr 24 19:23:17 | pp->tick:12, tick:1
Apr 24 19:23:17 | pp->tick:12, tick:1
Apr 24 19:23:17 | pp->tick:12, tick:1
Apr 24 19:23:17 | Forwarding 2 uevents
Apr 24 19:23:17 | dm-1: add map (uevent)
Apr 24 19:23:17 | sdc: remove path (uevent)
Apr 24 19:23:17 | 35000c50041ed4ebf: failback = "immediate" (setting: multipath.conf defaults/devices section)
Apr 24 19:23:17 | 35000c50041ed4ebf: path_grouping_policy = failover (setting: multipath.conf defaults/devices section)
Apr 24 19:23:17 | 35000c50041ed4ebf: path_selector = "round-robin 0" (setting: multipath.conf defaults/devices section)
Apr 24 19:23:17 | 35000c50041ed4ebf: hardware_handler = "0" (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: no_path_retry = 3 (setting: multipath.conf defaults/devices section)
Apr 24 19:23:17 | 35000c50041ed4ebf: retain_attached_hw_handler = yes (setting: implied in kernel >= 4.3.0)
Apr 24 19:23:17 | 35000c50041ed4ebf: features = "0" (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: rr_weight = "uniform" (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: minio = 1 (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: fast_io_fail_tmo = 5 (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: deferred_remove = no (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: delay_watch_checks = "no" (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: delay_wait_checks = "no" (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: marginal_path_err_sample_time = "no" (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: marginal_path_err_rate_threshold = "no" (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: marginal_path_err_recheck_gap_time = "no" (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: marginal_path_double_failed_time = "no" (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: skip_kpartx = no (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: update dev_loss_tmo to 15
Apr 24 19:23:17 | sdd: No SAS end device for 'end_device-0:18'
Apr 24 19:23:17 | 35000c50041ed4ebf: assembled map [1 queue_if_no_path 0 1 1 round-robin 0 1 1 8:48 1
]
Apr 24 19:23:17 | 35000c50041ed4ebf: load table [0 976773168 multipath 1 queue_if_no_path 0 1 1 round-robin 0 1 1 8:48 1
]
Apr 24 19:23:17 | 35000c50041ed4ebf: disassemble map [1 queue_if_no_path 0 1 1 round-robin 0 1 1 8:48 1 ]
Apr 24 19:23:17 | 35000c50041ed4ebf: disassemble status [2 1 0 0 1 1 E 0 1 0 8:48 A 0 ]
Apr 24 19:23:17 | 35000c50041ed4ebf: discover
Apr 24 19:23:17 | 35000c50041ed4ebf: searching paths for valid hwe
Apr 24 19:23:17 | sdd: vendor = SEAGATE
Apr 24 19:23:17 | sdd: product = ST500NM0001
Apr 24 19:23:17 | sdd: rev = 0002
Apr 24 19:23:17 | searching hwtable
Apr 24 19:23:17 | 35000c50041ed4ebf: no hardware entry found, using defaults
Apr 24 19:23:17 | 35000c50041ed4ebf: rr_weight = "uniform" (setting: multipath internal)
Apr 24 19:23:17 | 35000c50041ed4ebf: failback = "immediate" (setting: multipath.conf defaults/devices section)
Apr 24 19:23:17 | 35000c50041ed4ebf: no_path_retry = 3 (setting: multipath.conf defaults/devices section)
Apr 24 19:23:17 | 35000c50041ed4ebf: flush_on_last_del = no (setting: multipath internal)
Apr 24 19:23:17 | sdc [8:32]: path removed from map 35000c50041ed4ebf
Apr 24 19:23:17 | tur checker refcount 5
Apr 24 19:23:17 | weightedpath prioritizer refcount 5
Apr 24 19:23:17 | uevent 'change' from '/devices/virtual/block/dm-2'
Apr 24 19:23:18 | pp->tick:11, tick:1
Apr 24 19:23:18 | pp->tick:11, tick:1
Apr 24 19:23:18 | pp->tick:11, tick:1
Apr 24 19:23:18 | pp->tick:11, tick:1
Apr 24 19:23:18 | uevent 'remove' from '/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/host0/port-0:18/expander-0:18/port-0:18:0/end_device-0:18:0/target0:0:54/0:0:54:0/block/sdd'
Apr 24 19:23:18 | Forwarding 2 uevents
Apr 24 19:23:18 | dm-2: add map (uevent)
Apr 24 19:23:18 | sdd: remove path (uevent)
Apr 24 19:23:18 | 35000c50041ed4ebf: devmap event #1
Apr 24 19:23:18 | uevent 'remove' from '/devices/virtual/block/dm-2'
Apr 24 19:23:18 | uevent 'remove' from '/devices/virtual/block/dm-2'
Apr 24 19:23:18 | 35000c50041ed4ebf: map flushed
Apr 24 19:23:18 | sdd: orphan path, map flushed
Apr 24 19:23:18 | weightedpath prioritizer refcount 4
Apr 24 19:23:18 | tur checker refcount 4
Apr 24 19:23:18 | 35000c50041ed4ebf: stop event checker thread (139825560049408)
Apr 24 19:23:18 | 35000c50041ed4ebf: removed map after removing all paths
Apr 24 19:23:18 | uevent 'remove' from '/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/host0/port-0:18/expander-0:18/port-0:18:1/end_device-0:18:1/target0:0:55/0:0:55:0/block/sde'
Apr 24 19:23:19 | pp->tick:10, tick:1
Apr 24 19:23:19 | pp->tick:10, tick:1
Apr 24 19:23:19 | pp->tick:10, tick:1
Apr 24 19:23:19 | Forwarding 3 uevents
Apr 24 19:23:19 | dm-2: remove map (uevent)
Apr 24 19:23:19 | dm-2: devmap not registered, can't remove
Apr 24 19:23:19 | dm-2: remove map (uevent)
Apr 24 19:23:19 | dm-2: No DM_NAME in uevent, ignoring
Apr 24 19:23:19 | sde: remove path (uevent)
Apr 24 19:23:19 | 35000c50041ed41c3-part1: map in use
Apr 24 19:23:19 | 35000c50041ed41c3: can't flush
Apr 24 19:23:19 | 35000c50041ed41c3: failback = "immediate" (setting: multipath.conf defaults/devices section)
Apr 24 19:23:19 | 35000c50041ed41c3: path_grouping_policy = failover (setting: multipath.conf defaults/devices section)
Apr 24 19:23:19 | 35000c50041ed41c3: path_selector = "round-robin 0" (setting: multipath.conf defaults/devices section)
Apr 24 19:23:19 | 35000c50041ed41c3: hardware_handler = "0" (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: no_path_retry = 3 (setting: multipath.conf defaults/devices section)
Apr 24 19:23:19 | 35000c50041ed41c3: retain_attached_hw_handler = yes (setting: implied in kernel >= 4.3.0)
Apr 24 19:23:19 | 35000c50041ed41c3: features = "0" (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: rr_weight = "uniform" (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: minio = 1 (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: fast_io_fail_tmo = 5 (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: deferred_remove = no (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: delay_watch_checks = "no" (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: delay_wait_checks = "no" (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: marginal_path_err_sample_time = "no" (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: marginal_path_err_rate_threshold = "no" (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: marginal_path_err_recheck_gap_time = "no" (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: marginal_path_double_failed_time = "no" (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: skip_kpartx = no (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: update dev_loss_tmo to 15
Apr 24 19:23:19 | 35000c50041ed41c3: assembled map [1 queue_if_no_path 0 0 0
]
Apr 24 19:23:19 | 35000c50041ed41c3: load table [0 976773168 multipath 1 queue_if_no_path 0 0 0
]
Apr 24 19:23:19 | 35000c50041ed41c3: no path for geometry
Apr 24 19:23:19 | 35000c50041ed41c3: disassemble map [1 queue_if_no_path 0 0 0 ]
Apr 24 19:23:19 | 35000c50041ed41c3: disassemble status [2 1 0 0 0 0 ]
Apr 24 19:23:19 | 35000c50041ed41c3: discover
Apr 24 19:23:19 | 35000c50041ed41c3: searching paths for valid hwe
Apr 24 19:23:19 | 35000c50041ed41c3: no hardware entry found, using defaults
Apr 24 19:23:19 | 35000c50041ed41c3: rr_weight = "uniform" (setting: multipath internal)
Apr 24 19:23:19 | 35000c50041ed41c3: failback = "immediate" (setting: multipath.conf defaults/devices section)
Apr 24 19:23:19 | 35000c50041ed41c3: no_path_retry = 3 (setting: multipath.conf defaults/devices section)
Apr 24 19:23:19 | 35000c50041ed41c3: Entering recovery mode: max_retries=3
Apr 24 19:23:19 | 35000c50041ed41c3: flush_on_last_del = no (setting: multipath internal)
Apr 24 19:23:19 | sde [8:64]: path removed from map 35000c50041ed41c3
Apr 24 19:23:19 | tur checker refcount 3
Apr 24 19:23:19 | weightedpath prioritizer refcount 3
Apr 24 19:23:19 | uevent 'change' from '/devices/virtual/block/dm-1'
Apr 24 19:23:20 | pp->tick:9, tick:1
Apr 24 19:23:20 | pp->tick:9, tick:1
Apr 24 19:23:20 | 35000c50041ed41c3: Retrying.. No active path : 15
Apr 24 19:23:20 | Forwarding 1 uevents
Apr 24 19:23:20 | dm-1: add map (uevent)
Apr 24 19:23:21 | pp->tick:8, tick:1
Apr 24 19:23:21 | pp->tick:8, tick:1
Apr 24 19:23:21 | 35000c50041ed41c3: Retrying.. No active path : 14
Apr 24 19:23:22 | pp->tick:7, tick:1
Apr 24 19:23:22 | pp->tick:7, tick:1
Apr 24 19:23:22 | 35000c50041ed41c3: Retrying.. No active path : 13
Apr 24 19:23:23 | pp->tick:6, tick:1
Apr 24 19:23:23 | pp->tick:6, tick:1
Apr 24 19:23:23 | 35000c50041ed41c3: Retrying.. No active path : 12
Apr 24 19:23:24 | pp->tick:5, tick:1
Apr 24 19:23:24 | pp->tick:5, tick:1
Apr 24 19:23:24 | 35000c50041ed41c3: Retrying.. No active path : 11
Apr 24 19:23:25 | pp->tick:4, tick:1
Apr 24 19:23:25 | pp->tick:4, tick:1
Apr 24 19:23:25 | 35000c50041ed41c3: Retrying.. No active path : 10
Apr 24 19:23:26 | pp->tick:3, tick:1
Apr 24 19:23:26 | pp->tick:3, tick:1
Apr 24 19:23:26 | 35000c50041ed41c3: Retrying.. No active path : 9
Apr 24 19:23:27 | pp->tick:2, tick:1
Apr 24 19:23:27 | pp->tick:2, tick:1
Apr 24 19:23:27 | 35000c50041ed41c3: Retrying.. No active path : 8
Apr 24 19:23:28 | pp->tick:1, tick:1
Apr 24 19:23:28 | pp->tick:1, tick:1
Apr 24 19:23:28 | 35000c50041ed41c3: Retrying.. No active path : 7
Apr 24 19:23:29 | pp->tick:0, tick:1
Apr 24 19:23:29 | pp->tick:0, tick:1, conf:5
Apr 24 19:23:29 | sdf: path state = running
Apr 24 19:23:29 | sdf: get_state
Apr 24 19:23:29 | 8:80: tur checker starting up
Apr 24 19:23:29 | 8:80: tur checker finished, state up
Apr 24 19:23:29 | sdf: tur state = up
Apr 24 19:23:29 | 360000000000000000e00000000010001: disassemble map [1 queue_if_no_path 0 2 1 round-robin 0 1 1 8:80 1 round-robin 0 1 1 8:96 1 ]
Apr 24 19:23:29 | 360000000000000000e00000000010001: disassemble status [2 0 0 0 2 1 A 0 1 0 8:80 A 0 E 0 1 0 8:96 A 0 ]
Apr 24 19:23:29 | sdf: udev property ID_WWN whitelisted
Apr 24 19:23:29 | sdf: mask = 0x8
Apr 24 19:23:29 | sdf: path state = running
Apr 24 19:23:29 | sdf: weightedpath prio = 0
Apr 24 19:23:29 | pp->tick:0, tick:1
Apr 24 19:23:29 | pp->tick:0, tick:1, conf:5
Apr 24 19:23:29 | sdg: path state = running
Apr 24 19:23:29 | sdg: get_state
Apr 24 19:23:29 | 8:96: tur checker starting up
Apr 24 19:23:29 | 8:96: tur checker finished, state up
Apr 24 19:23:29 | sdg: tur state = up
Apr 24 19:23:29 | 360000000000000000e00000000010001: disassemble map [1 queue_if_no_path 0 2 1 round-robin 0 1 1 8:80 1 round-robin 0 1 1 8:96 1 ]
Apr 24 19:23:29 | 360000000000000000e00000000010001: disassemble status [2 0 0 0 2 1 A 0 1 0 8:80 A 0 E 0 1 0 8:96 A 0 ]
Apr 24 19:23:29 | sdg: udev property ID_WWN whitelisted
Apr 24 19:23:29 | sdg: mask = 0x8
Apr 24 19:23:29 | sdg: path state = running
Apr 24 19:23:29 | sdg: weightedpath prio = 0
Apr 24 19:23:29 | 35000c50041ed41c3: Retrying.. No active path : 6
Apr 24 19:23:29 | checked 2 paths in 0.002293 secs
Apr 24 19:23:30 | pp->tick:19, tick:1
Apr 24 19:23:30 | pp->tick:19, tick:1
Apr 24 19:23:30 | 35000c50041ed41c3: Retrying.. No active path : 5
Apr 24 19:23:31 | pp->tick:18, tick:1
Apr 24 19:23:31 | pp->tick:18, tick:1
Apr 24 19:23:31 | 35000c50041ed41c3: Retrying.. No active path : 4
Apr 24 19:23:32 | pp->tick:17, tick:1
Apr 24 19:23:32 | pp->tick:17, tick:1
Apr 24 19:23:32 | 35000c50041ed41c3: Retrying.. No active path : 3
Apr 24 19:23:33 | pp->tick:16, tick:1
Apr 24 19:23:33 | pp->tick:16, tick:1
Apr 24 19:23:33 | 35000c50041ed41c3: Retrying.. No active path : 2
Apr 24 19:23:34 | pp->tick:15, tick:1
Apr 24 19:23:34 | pp->tick:15, tick:1
Apr 24 19:23:34 | 35000c50041ed41c3: Retrying.. No active path : 1
Apr 24 19:23:34 | 35000c50041ed41c3: Disable queueing
Apr 24 19:23:35 | pp->tick:14, tick:1
Apr 24 19:23:35 | pp->tick:14, tick:1
Apr 24 19:23:36 | pp->tick:13, tick:1
Apr 24 19:23:36 | pp->tick:13, tick:1
Apr 24 19:23:37 | pp->tick:12, tick:1
Apr 24 19:23:37 | pp->tick:12, tick:1
Apr 24 19:23:38 | pp->tick:11, tick:1
Apr 24 19:23:38 | pp->tick:11, tick:1






==============stack information=============================


Thread 6 "multipathd" hit Breakpoint 1, set_no_path_retry (conf=<optimized out>, mpp=0x55719680a8d0) at structs_vec.c:340
340             mpp->retry_tick = 0;
(gdb) bt
#0  set_no_path_retry (conf=<optimized out>, mpp=0x55719680a8d0) at structs_vec.c:340
#1  0x00007f2c157b2205 in __setup_multipath (vecs=<optimized out>, mpp=0x55719680a8d0, reset=<optimized out>, is_daemon=<optimized out>) at structs_vec.c:405
#2  0x00005571955bacc4 in ev_remove_path (pp=0x5571967fd220, vecs=0x557196787200, need_do_map=1) at main.c:965
#3  0x00005571955ba8ad in uev_remove_path (uev=0x7f2c0c002150, vecs=0x557196787200, need_do_map=1) at main.c:876
#4  0x00005571955bbbb3 in uev_trigger (uev=0x7f2c0c002150, trigger_data=0x557196787200) at main.c:1222
#5  0x00007f2c157a708a in service_uevq (tmpq=tmpq@entry=0x7f2c13797ac0) at uevent.c:345
#6  0x00007f2c157a715d in uevent_dispatch (uev_trigger=<optimized out>, trigger_data=<optimized out>) at uevent.c:401
#7  0x00005571955bbdc1 in uevqloop (ap=0x557196787200) at main.c:1253
#8  0x00007f2c1512f164 in start_thread (arg=<optimized out>) at pthread_create.c:486
#9  0x00007f2c14b17def in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95



Thread 9 "multipathd" hit Breakpoint 1, set_no_path_retry (conf=<optimized out>, mpp=0x557196811130) at structs_vec.c:340
340             mpp->retry_tick = 0;
(gdb) bt
#0  set_no_path_retry (conf=<optimized out>, mpp=0x557196811130) at structs_vec.c:340
#1  0x00007f2c157b2205 in __setup_multipath (vecs=vecs@entry=0x557196787200, mpp=mpp@entry=0x557196811130, reset=reset@entry=1, is_daemon=is_daemon@entry=1) at structs_vec.c:405
#2  0x00007f2c157b2a2f in update_multipath (vecs=0x557196787200, mapname=mapname@entry=0x557196837514 "35000c50041ed4ebf", reset=reset@entry=1) at structs_vec.c:557
#3  0x00007f2c157b47fd in waiteventloop (waiter=waiter@entry=0x557196837500) at waiter.c:143
#4  0x00007f2c157b49d1 in waitevent (et=0x557196837500) at waiter.c:174
#5  0x00007f2c1512f164 in start_thread (arg=<optimized out>) at pthread_create.c:486
#6  0x00007f2c14b17def in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

";i:1;N;i:2;N;}i:2;i:7228;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:25610;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"module functions";i:1;i:1;i:2;i:25610;}i:2;i:25610;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:25610;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:11097:"
Q11 : 在multipathd裡面的check_path做了一堆事情, 到底有甚麼好做的, 不就是check path的狀態而已嗎?
Ans :
  Q11-1 : 裡面還先呼叫到path_offline? 這個用意是?
  Ans :
    看起來path_offline是透過一些系統上的資訊來判斷path正不正常, 像是:
    1. udev能不能看到該device.
    2. 該device的state正常嗎? (/sys/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/host0/port-0:0/expander-0:0/port-0:0:0/end_device-0:0:0/target0:0:0/0:0:0:0/state)

  Q11-2 : 霧煞煞, 那path checker的地方到底在哪裡?
  Ans :
    終於找到了, 在get_state裡面, 名字是存在pp.checker.name這裡.


Q10 : 整個kernel request的機制到底怎麼走啊?
Ans :
目前看起來是mpath(request-based)拿到request後會將它clone and map給device driver的request queue.
然後driver再執行一次request_fn的機制.
所以我從driver那邊dump_stack, 並沒有辦法看到mpath的部分.
[ 2809.270597]  lo_write_bvec+0x58/0x113
[ 2809.270603]  loop_queue_work.cold.38+0xd2/0x27a
[ 2809.270610]  kthread_worker_fn+0x79/0x1c0
[ 2809.270616]  loop_kthread_worker_fn+0x1e/0x20
[ 2809.270621]  kthread+0x120/0x140
[ 2809.270625]  ? loop_get_status64+0xa0/0xa0
[ 2809.270630]  ? kthread_bind+0x40/0x40
[ 2809.270636]  ret_from_fork+0x35/0x40

Q9 : fail path後的path status是長怎樣?
Ans :
35000c50041ed41c3 dm-1 SEAGATE,ST500NM0001
size=466G features='0' hwhandler='0' wp=rw
|-+- policy='round-robin 0' prio=10 status=enabled
| `- 0:0:1:0 sdc 8:32 **failed** ready running
`-+- policy='round-robin 0' prio=5 status=active
  `- 0:0:3:0 sdd 8:48 active ready running

--> 會顯示"failed", 而且不會自動回復active. (除非有multipathd在背景運作)
--> 把兩條path都fail後, IO就會error, 但是把兩條path都回復後,  io也不會自動回來.
(因為沒有人將priority group 的狀態從enabled 變成active)
--> 我不知道怎麼把priority group從enabled --> active (可能需要看multipathd怎麼弄得)
--> priority group有三種狀況(disabled, enabled, active), pgpath有兩種狀態(failed, active)


=======
目前大概都確認清楚了, 每個部份所負責的行為(multipathd for pathcheck and failback, dm-mpath for reroutes and failover)
這些人所負責的部分是沒錯的, 也可以demo.
但有些部分不確定的是... 像是dm-mpath reroutes是呼叫到select_path來處理.
但是他的failover是怎麼處理的? (IO前或是IO後, 如果是IO後的話應該要有一個retry io的機制.)
另外就是multipathd的pathcheck是怎麼做的? (應該是polling, 但是多久一次? 而path_retry跟這個是綁在一起嗎?)
failback是跟pathcheck綁在一起的嗎? (failback會取priority高的path來進行failback.)
path_retry是由dm-mpath與multipathd所共同完成的.

=======

Q8 : path priority setting (weighted)
Ans :
prio "weightedpath"
prio_args "devname sdc 10 sdd 5"

Q7 : message command in multipath?
Ans :
1. dmsetup message test-multi 0 "fail_path" 7:2
2. dmsetup message test-multi 0 "reinstate_path" 7:2
3. dmsetup message test-multi 0 "fail_if_no_path"

Q6 : no_path_retry的機制?
Ans :
(In multipathd)
/*
 * mpp->no_path_retry:
 *   -2 (QUEUE) : queue_if_no_path enabled, never turned off
 *   -1 (FAIL)  : fail_if_no_path
 *    0 (UNDEF) : nothing
 *   >0         : queue_if_no_path enabled, turned off after polling n times
 */
這個參數的行為完全都是由multipathd來進行控制.
若設定為fail:
root@jerrie-pc:/mnt2# ./direct_io_write_file
write ./direct_io.data failed: Input/output error

若是queue的話:
則完全不會顯示fail.

而>0就像comment所敘述, 會等polling n times才轉為fail.


Q5 : dm-multipath 負責進行failover的動作, 那一條path的fail是怎麼處理的? (fail status是怎麼設定的?)
Ans :
看起來是會在從request queue拿出來時會進行檢查, 如果是"DM_MAPIO_DELAY_REQUEUE"的話就是會進行requeue的動作.
	case DM_MAPIO_DELAY_REQUEUE:
		/* The target wants to requeue the I/O after a delay */
		dm_requeue_original_request(tio, true);
		break;

其實這也合理, 因為multipath只有dm-mpath這一層才知道, 那當然是自己要進行retry, 總不可能會期待別人幫你retry.

stack information:
8746 Apr 22 11:06:50 jerrie-pc kernel: [315943.378391]  dump_stack+0x63/0x83
8747 Apr 22 11:06:50 jerrie-pc kernel: [315943.378402]  fail_path.cold.26+0x19/0x87 [dm_multipath]
8748 Apr 22 11:06:50 jerrie-pc kernel: [315943.378409]  pg_init_done+0x15b/0x180 [dm_multipath]
8749 Apr 22 11:06:50 jerrie-pc kernel: [315943.378415]  activate_or_offline_path+0x3d/0x60 [dm_multipath]
8750 Apr 22 11:06:50 jerrie-pc kernel: [315943.378421]  multipath_clone_and_map+0x1e9/0x1f0 [dm_multipath]
8751 Apr 22 11:06:50 jerrie-pc kernel: [315943.378429]  map_request+0x56/0x250
8752 Apr 22 11:06:50 jerrie-pc kernel: [315943.378435]  map_tio_request+0x16/0x30
8753 Apr 22 11:06:50 jerrie-pc kernel: [315943.378443]  kthread_worker_fn+0x79/0x1c0
8754 Apr 22 11:06:50 jerrie-pc kernel: [315943.378449]  kthread+0x120/0x140
8755 Apr 22 11:06:50 jerrie-pc kernel: [315943.378454]  ? kthread_park+0x80/0x80
8756 Apr 22 11:06:50 jerrie-pc kernel: [315943.378458]  ? kthread_bind+0x40/0x40
8757 Apr 22 11:06:50 jerrie-pc kernel: [315943.378465]  ret_from_fork+0x35/0x40

Q4 : multipath.conf裡面的參數, 那些是跟建立device mapper有所相關?
Ans :
[Kenrel]
1. features 
--> 但是設定上有點搞不清楚, 前面的number到底要填什麼?
  --> 終於搞懂了(看了source code), 前面的number指的是參數的數目.

2. path_selector
3. path_grouping_policy
4. rr_weight, rr_min_io, rr_min_io_rq
--> man page寫這三個只apply到round-robin selector, 但從kernel code看起來, round-robin 在select path並不會用到這些參數.
if (!list_empty(&s->valid_paths)) {
    pi = list_entry(s->valid_paths.next, struct path_info, list);
    list_move_tail(&pi->list, &s->valid_paths);
}
--> 看起來這三個參數在目前的kernel module都不支援, userspace的command是根據rr_min_io_rq將round-robin的request設為100,
但是實際建立出來的dm target還是只會設成1
dmsetup create test-multi --table '0 976773168 multipath 0 0 1 1 round-robin 0 2 1 8:32 100 8:48 100'
--> 
root@jerrie-pc:/home/jerrie/Build/linux-4.18/Documentation# dmsetup table
test-multi: 0 976773168 multipath 0 0 1 1 round-robin 0 2 1 8:32 1 8:48 1

5. no_path_retry
--> 這看起來像kernel在用的, 但是看不出來他怎麼去進行設定.

[Multipathd]
1. prio
--> 感覺是作為failback的依據, 會選擇較高priority group來進行failback.

2. prio_args
-->  跟prio進行搭配的參數.

3. path_checker
--> determine the paths state

4. failback
--> Tell multipathd how to manage path group failback.

5. queue_without_daemon
--> when multipathd stops, queueing will be turned off for all devices.

6. checker_timeout (跟path_checker一起使用, 但path_checker看起來也像是kernel在用的)
--> Specify the timeout to use for path checkers and prioritizers that issue SCSI commands with an explicit timeout, in seconds.

7. no_path_retry
--> 看起來是kernel跟multipathd同時都有在用. (若 > 0, 由multipathd 負責polling)
( >0 --> queue_if_no_path enabled, turned off after polling n times)

[Multipath]
1. reassign_maps
2. multipath_dir
3. uid_attrs
4. uid_attribute
5. alias_prefix
--> 用來指定map-device的prefix名稱
6. max_fds
--> Specify  the  maximum number of file descriptors that can be opened by multipath and multipathd.


Q3 : 我從dmsetup可以將loopback device 對映成multipath, 但看起來multipathd不可以, 這部分應該可以改code來進行模擬.
Ans :
是可以的, 但改了之後,  建出來的map-device跟multipath user space所提供的功能並不相容,  所以還是算了.


Q2 : 接下來應該要知道的事情是...
1. dm-multipath有兩種機制, bio-based與request-based, 是透過甚麼樣的資訊來決定要使用哪一種機制?
2. request-based有甚麼好處嗎? 為什麼不像dm-linear使用bio-based的方式?
3. ubuntu所編譯出來的built-in.a是什麼? 必須重新make -j 4 && make modules -j 4 && make modules_install && make install才可以使用.
4. built-in.a可以改成module的模式嗎?
5. 因為dm-multipath中間透過request機制(會初始化一個kernel worker來處理, 屬於非同步機制), 所以從trace-cmd無法看到這一部分的function or stack?
6. 依照我build好的kernel, 可以使用systemtrap嗎?
7. 為什麼我build好的kernel, 無法直接放到vm來使用?

接下來要做的事是...
1. 把東西整理一下, 作為第一階段的報告. (Mechanism of device mapper.)
2. 整理trace-cmd


Ans 1:
default是request-based, 但看起來可以從dmsetup設定queue mode為bio, 不過從multipath.conf看起來並無這個選項.


Q1 : 一開始進到map function的bio是指到device mapper出來的那一個block device嗎?
Ans :
這裡的答案是"Yes"

若是dm-linear的話, 的確是走bio的路(也就是generic_make_request --> dm_make_request, 然後再丟到io scheduler).
但是dm-multipath這裡會取決在一些flag會有不同行為, 
以我的例子, 他一開始走到generic_make_request後就會直接丟到request_queue裡面去,
後面再透過kernel處理request的機制來進行處理, 會呼叫request_fn來處理queue裡面的request.
--> 這裡卡了一段時間, 因為我不知道他怎麼進行path select.
  -->後來從dm-service-time去dump stack才知道他怎麼走過來.

# stack information
  707.886285]  st_select_path+0x2f/0x120 [dm_service_time]
[  707.886292]  choose_path_in_pg+0x31/0xa0 [dm_multipath]
[  707.886298]  choose_pgpath+0x48/0x1a0 [dm_multipath]
[  707.886305]  multipath_clone_and_map+0xd0/0x1f0 [dm_multipath]
[  707.886313]  map_request+0x56/0x250
[  707.886319]  map_tio_request+0x16/0x30
[  707.886325]  kthread_worker_fn+0x79/0x1c0
[  707.886331]  kthread+0x120/0x140
[  707.886336]  ? kthread_park+0x80/0x80
[  707.886341]  ? kthread_bind+0x40/0x40
[  707.886347]  ret_from_fork+0x35/0x40

# bio
struct bio is defined in blk_types.h

# multipath_ctr
command : 
dmsetup create test-multi --table '0 102400 multipath 0 0 2 1 service-time 0 1 2 7:0 1 1 service-time 0 1 2 7:1 1 1'

(0 0 2 1) (service-time 0 1 2 7:0 1 1) (service-time 0 1 2 7:1 1 1)
# (0 0 2 1)
0 --> feature的數量, 0 代表沒有feature.
0 --> 硬體處理程式(hw handler)引數的數量.
(硬體處理程式會在切換路徑群組或是處理 I/O 錯誤時指定一個用來執行硬體特屬之動作的模組)
2 --> 2 path groups
1 --> 下一個嘗試的路徑群組

# (service-time 0 1 2 7:0 1 1)
service-time --> path selector
0 --> #pathargs (always 0 now)
1 --> path number in this group
2 --> args for path (1 1 for this example, 也就是ioreqs引數)
7:0 --> Major:Minor number

(以下兩個是ioreqs, io requests)
--> 要切換至目前群組中的下個路徑前所需要用來 route 至此路徑的 I/O 請求數量。
1 --> ?
1 --> ?

input : 
  struct dm_target *ti, 
  unsigned argc, 
  char **argv

argc = 18
argv = "0 0 2 1 service-time 0 1 2 7:0 1 1 service-time 0 1 2 7:1 1 1"

output :

";i:1;N;i:2;N;}i:2;i:25647;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:36754;}i:21;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"MISC";i:1;i:1;i:2;i:36754;}i:2;i:36754;}i:22;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:36754;}i:23;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2509:"
[parameter for creating multipath]

# path_grouping_policy "multibus"
--> 0 976773168 multipath 0 0 1 1 service-time 0 2 2 8:16 1 1 8:64 1 1

# path_grouping_policy "failover"
--> 0 976773168 multipath 0 0 2 1 service-time 0 1 2 8:16 1 1 service-time 0 1 2 8:64 1 1

[Commands]
# remove all mapping
multipath -F

# show information
1. 
>> multipath -ll

2.
>> multipath -k  

[Related]
# create loopback device for testing
> dd if=/dev/zero of=loopbackfile.img bs=100M count=10
> losetup -fP loopbackfile.img
> losetup -fP loopbackfile.img # twice
> dmsetup create test-multi --table '0 976773168 multipath 0 0 2 1 service-time 0 1 2 8:16 1 1 service-time 0 1 2 8:64 1 1'


[Build]
# make command
>> make M=drivers/md

# reload kernel module
>> rmmod dm-multipath
>> insmod dm-multipath


[Issue]
Q1: cannot remove kernel module? 
Error Message : dm_multipath is in use by: dm_service_time)

Ans:
# 從lsmod可以看到dm_multipath被dm_service_time咬住.

>> lsmod
root@jerrie-pc:/tmp# lsmod
Module                  Size  Used by
dm_service_time        16384  6
ses                    20480  0
enclosure              16384  1 ses
dm_multipath           28672  4 dm_service_time

# 從dmsetup table可以看到全部的mapping, 將所有建立的mapping全部都remove掉.
root@jerrie-pc:/tmp# dmsetup table
35000c50041ed41c3-part9: 0 1 linear 253:1 41
35000c50041ed41c3-part8: 0 1 linear 253:1 40
35000c50041ed41c3-part7: 0 6291456 linear 253:1 18878464
35000c50041ed41c3-part6: 0 6291456 linear 253:1 12587008
35000c50041ed41c3-part5: 0 6291456 linear 253:1 6295552
35000c50041ed41c3-part4: 0 6291456 linear 253:1 4096
35000c50041ed41c3-part3: 0 949506056 linear 253:1 27267072
35000c50041ed41c3-part2: 0 2097152 linear 253:1 25169920
35000c50041ed41c3: 0 976773168 multipath 0 0 2 1 service-time 0 1 2 8:32 1 1 service-time 0 1 2 8:48 1 1
35000c50041ed41c3-part1: 0 2048 linear 253:1 2048
35000c50041ed4ebf: 0 976773168 multipath 0 0 2 1 service-time 0 1 2 8:16 1 1 service-time 0 1 2 8:64 1 1
test-multi: 0 976773168 multipath 0 0 2 1 service-time 0 1 2 8:16 1 1 service-time 0 1 2 8:64 1 1

root@jerrie-pc:/tmp# multipath -F
root@jerrie-pc:/tmp# dmsetup remove test-multi

# 此時從lsmod會看到dm-service-time "used"欄位為0, 但dm-multipath 的used欄位仍為1
# 所以就先將dm-service-time 移除, 再移除dm-multipath
>> rmmod dm-service-time
>> rmmod dm-multipath

# insert時則需先insert dm-multipath, 再insert dm-service-time
>> insmod dm-multipath.ko
>> insmod dm-service-time.ko
";i:1;N;i:2;N;}i:2;i:36779;}i:24;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:39296;}i:25;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:39296;}}