a:10:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"module functions";i:1;i:1;i:2;i:2;}i:2;i:2;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:5993:"
Q6 : no_path_retry的機制?
Ans :

Q5 : dm-multipath 負責進行failover的動作, 那一條path的fail是怎麼處理的? (fail status是怎麼設定的?)
Ans :

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

";i:1;N;i:2;N;}i:2;i:39;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6042;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"MISC";i:1;i:1;i:2;i:6042;}i:2;i:6042;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6042;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2509:"
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
";i:1;N;i:2;N;}i:2;i:6067;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8584;}i:9;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:8584;}}