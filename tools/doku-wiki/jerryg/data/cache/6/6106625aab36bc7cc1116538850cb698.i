a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2724:"
Q7 : python exception type
Ans :
https://docs.python.org/2/library/exceptions.html

Q6 : wttr
Ans :
curl wttr.in/your_location
(https://askubuntu.com/questions/390329/weather-from-terminal)


Q5 : Drone (Continuous Delivery platform built on Docker)
Ans :


Q4 : 如何用c寫一個python module?
Ans :

Q3.1 : Synology的acl設定相當快, 到底是怎麼做的?
Ans :
1. 將所有的subfolder與file都設定過一次嗎?
--> 看起來不是, 因為用多檔(100000)與少檔來比較, 速度上都差不多.

2. 是getxattr的時候, 往上找資料夾的資料來更新自己的acl嗎?
--> 不確定, 但我建了1000層directory, 在get時速度與1層的directory看起來並沒有太大差異.

Q3 : [Work] Synology的acl 機制為?
Ans :
1. 在synology裡面, 可以設定no access, read/write, read only與custom.
custom裡面可以設定一些advanced acl.
2. 目前使用ftp進行測試, 失敗都是在system call, 像是:
open fail --> can not create file.
setgroup fail --> can not delete file.
因為這些system call都是取決在於file system的操作, 
從上層這裡我沒辦法知道file system是如何判斷該user沒有權限.

3. syno在xattr裡面存兩個attribute:
--> setxattr("aa1/test002", "system.syno_acl_self", "\x01\x00\x00\x00\x06\x00\x00\x00\x85]\x00\x00\x00\x00\x00\x00\x0c\x04\x00\x00\x00\x00\x00", 24, 0) = 0
Inheritance:
--> getxattr("aa1/test0011", "system.syno_acl_inherit", "\x01\x00\x00\x00\x06\x00\x00\x00\xcf7\x00\x00\x00\x00\x00\x00\x0c\x04\x00\x00\x02\x00\x00", 256) = 24
--> Create file in subfolder (subfolder has self acl)
getxattr("aa1/aa2/eeee.txt", "system.syno_acl_inherit", "\x01\x00\x00\x00\x06\x00\x00\x00\xcf\x7f\x00\x00\x00\x00\x00\x00\x0c\x04\x00\x00\x01\x00\x00\x00\x06\x00\x00\x00\xcf7\x00\x00\x00\x00\x00\x00\x0c\x04\x00\x00\x03\x00\x00", 256) = 44  


getxattr("aa1/aa2/eeee.txt", "system.syno_acl_inherit", "\x01\x00\x00\x00\x06\x00\x00\x00\xc3[\x00\x00\x00\x00\x00\x00\x0c\x04\x00\x00\x01\x00\x00\x00\x0     6\x00\x00\x00\xcf7\x00\x00\x00\x00\x00\x00\x0c\x04\x00\x00\x03\x00\x00", 256) = 44

getxattr("aa1/aa2", "system.syno_acl_inherit", "\x01\x00\x00\x00\x06\x00\x00\x00\xc3[\x00\x00\x06\x00\x00\x00\x0c\x04\x00\x00\x00\x00\x00\x00\x06\x00\x00     \x00\xcf7\x00\x00\x06\x00\x00\x00\x0c\x04\x00\x00\x02\x00\x00", 256) = 44

Q2 : [Algorithm] unrolled linked list:
Ans : 
1. 看起來是在linked list裡面放入array, 並記錄該array目前所存的數量.
Reference:
1. http://www.geeksforgeeks.org/unrolled-linked-list-set-1-introduction/
2. https://leetcode.com/problems/find-median-from-data-stream/description/

Q1 : [Linux] pam裡面的account module是用來幹嘛的? 從sftp登入的話, domain user會在那邊的krb module fail掉.
Ans :

";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}