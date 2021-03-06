a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:4378:"

Q2 : Flow of HA heartbeat?
Ans :
看起來流程大概是這樣, 對方的HA會將我這邊的heartbeat設成1, 然後我會去檢查(時間?)這個heartbeat是否為1,
若是1的話, 就會改成0.
下一回合, 對方又會來改成1, 我這邊檢查後再設成0.
若是我檢查時, 發現heartbeat為0, 那就是代表對方有問題, 才會沒有過來將這個heartbeat設成1.

那下一個問題就是--> 
1. 檢查的時間為多久一次?
--> 在開始檢查heartbeat前會sleep --> sleepTime(CHECK_HEARTBEAT_TIMEOUT)
(CHECK_HEARTBEAT_TIMEOUT = 3)
--> 一樣也是3秒會去更新對方的heartbeat(設成1)

2. 為什麼heartbeat沒有被設成1呢?
--> 是command送不出去? 還是送出去了對方來不及處理?
--> 從封包看起來, Primary跟Slave都沒有收到對方updateHeartbeat的命令.
但從code看起來, 的確是有進行send動作, 那是不是有一種可能就是:
client認為自己已經送出去了, 所以在等recv, 但是在5秒內等不到, 所以就timeout掉.
這時候又會去將remoteHA重新connect, 導致對方的HA沒有收到封包, 因而沒有更新heartbeat.
  --> 那這樣說來, 為什麼會變慢呢? 是network太忙碌? 還是process太忙碌?
看起來並不是network太忙碌, 因為重開啟動HAServer之後就不會發生fail.
而thread也沒有很多, 那...?
那是HAServer佔用太多的memory所導致? (因為HAServer佔了400M, 但重開後只佔了97M)
(但是memory為什麼會導致送封包變慢?)
--> 看起來是Slave那邊沒有收到: (從26秒做完後, 下一個heartbeat是35秒才收到)
[2017_09_30_10_24_26] [HA] enter [updateHeartbeatFromClient] None
[2017_09_30_10_24_26] @@@@ => set Heartbeat 1
[2017_09_30_10_24_26] [HA] exit [updateHeartbeatFromClient]
[2017_09_30_10_24_26] [HA] send retData [updateHeartbeatFromClient] {'status': 0}
[2017_09_30_10_24_27] [HA][NASHAComm] start callGetLocalFunc(netOperation)
[2017_09_30_10_24_27] [HA] enter local [B] [netOperation] {'logLevel': 1, 'controller': 'B', 'op': 'getTrunkInfo'}
[2017_09_30_10_24_28] [HA][NASHAComm] start callGetLocalFunc(userOperation)
[2017_09_30_10_24_28] [HA] enter local [B] [userOperation.getNextUID] {'logLevel': 1, 'operation': 'getNextUID', 'serviceId': '8744965', 'controller': 'B'}
[2017_09_30_10_24_28] [HA] exit local [B] [netOperation] {}
[2017_09_30_10_24_35] [HA][NASHAComm] end callGetLocalFunc(netOperation)
[2017_09_30_10_24_35] [HA] exit local [B] [userOperation.getNextUID] {'status': 0, 'data': 104099}
[2017_09_30_10_24_35] [HA] enter [updateHeartbeatFromClient] None


Q1 : 在建立大量的user時, 在remote controller時會fail.
Ans : 
1. 看起來是HAServer heartbeat所產生的問題.
--> HAServer heartbeat判斷錯誤, 此時HAServer會重建remote controller的socket, 導致remote controller會回傳status : -1

2. Resource 狀況:

3. Error message:
[2017_09_29_10_42_33][critical] WARNING: recv pkg error !
[2017_09_29_10_42_35][critical] c_int(0), Account-User, superuser_privilege_assign, ['user7770']
[2017_09_29_10_42_40][critical] c_int(0), Account-User, user_create, ['user7770']
[2017_09_29_10_43_04][critical] c_int(0), Account-User, superuser_privilege_assign, ['user7771']
[2017_09_29_10_43_08][critical] c_int(0), Account-User, user_create, ['user7771']
[2017_09_29_10_43_14][critical] [HA][HbProc] WARNING: send heartbeat timeout !
[2017_09_29_10_43_14][critical] [HA][HbProc] connection established!
[2017_09_29_10_43_17][critical] [HA][HbProc] reconnect remote heartbeat!
[2017_09_29_10_45_25][critical] WARNING: recv pkg error !
[2017_09_29_10_45_28][critical] c_int(0), Account-User, superuser_privilege_assign, ['user7772']
[2017_09_29_10_45_33][critical] c_int(0), Account-User, user_create, ['user7772']
[2017_09_29_10_45_56][critical] c_int(0), Account-User, superuser_privilege_assign, ['user7773']
[2017_09_29_10_46_01][critical] c_int(0), Account-User, user_create, ['user7773']
[2017_09_29_10_46_07][critical] [HA][HbProc] WARNING: send heartbeat timeout !
[2017_09_29_10_46_07][critical] [HA][HbProc] connection established!
[2017_09_29_10_46_10][critical] [HA][HbProc] reconnect remote heartbeat!
[2017_09_29_10_48_18][critical] Traceback (most recent call last):
  File "/usr/local/NAS/misc/HAAgent/HAServer.py", line 2706, in __sendHACmd
    self.clientSocket.send(HAPkg)
error: [Errno 32] Broken pipe
# Memory:
HAServer的記憶體由97M --> 4xxM

";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}