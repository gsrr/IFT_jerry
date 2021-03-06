a:10:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Basic";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:173:"
# related files (samba)
1. libnss_winbind.so

# version
ldd --version

# website
https://www.gnu.org/software/libc/sources.html

# source rpm
yumdownloader --source glibc

";i:1;N;i:2;N;}i:2;i:26;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:210;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"getent group";i:1;i:1;i:2;i:210;}i:2;i:210;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:210;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:4596:"
Q11: 
getent passwd/group, 照理說上次的資料沒要完時, timeout後再去下command還是會重新再要一次.
那什麼樣的狀況會沒有重新去要就直接回傳?
Ans:
看起來等了55秒後就結束了, 那這樣應該是winbind回傳已經結束.


Q10 : winbind在呼叫rpc要資料時, 是透過tevent傳給child去做事, 這時會需要先拿到一個child handle, 但若是child都在busy時, 會回傳一個NULL(find_idle_child)給 choose_domain_child, choose_domain_child會隨機選擇一個child來做事.
Ans:
ok.

Q9 : winbind 跟 AD要資料時, 是一次要到完, 還是一個一個接收?
Ans:
是一次要到完的.


Q8 : flow of winbindd?
(getent passwd)
winbindd_getpwent_send(from cmd, WINBINDD_GETPWENT) -> [wb_next_pwent_send --> winbindd_getpwent_done](loop, 一個user一次) --> wb_fill_pwent_send --> wb_sids2xids_send --> wb_fill_pwent_sid2uid_done

(getent group)
winbindd_getgrent_send(from cmd, WINBINDD_GETGRENT) -> wb_next_grent_send -> dcerpc_wbint_QueryGroupList_send 
--> wb_getgrsid_send --> choose_domain_child --> wb_next_grent_getgrsid_done

first time:
wb_next_pwent_send --> wb_query_user_list_send --> dcerpc_wbint_QueryUserList_send --> dom_child_handle (交給child來處理)
--> wb_next_pwent_send_do 
 

Q7 : 為什麼把getent的timeout調長(30 --> 300)就可以得到資料? 那就算是30秒, 只要retry次數多一點的話, 應該也是可以得到資料的吧?
1. 每一次重來的時候, next_user 與num_users都會是0, 所以這時候會執行 wb_query_user_list_send 這個function.
2. 但是雖然重來, winbind還是會在背景做, 只要有人得到資料回來, getent passwd就可以拿得到user.
Q7.3. 不過winbind也有300s的cache time, 所以有可能會等到300s到還要不到, 這時候會怎麼樣?
Ans:
3.1 整個流常大概是 : request user list from ad server --> get user information for individual user (250個一循環)
3.2 若winbind cache time還沒超過時, 不會重新要user list, 但會重新要user information
3.3 而若winbind cache time超過時, 會再重新要一次 user list
3.4 若要到user infor後, 後面就是看nscd 的設定, 看cache time多久再重新要資訊.
 

Q6: 為什麼getent group retry可以要得到資料, 照理說重新下一次的話, 整個都要重來不是嗎?
1. 不過其實每250筆後, 後面也是重新下一次再抓250筆. (但應該有類似一個page index的東西吧?)
2. 在 cli->pwent_state 裡面會存著next_user 與 num_users, next_user是指下一個要抓的user number, num_users則是全部的user數量.


Q5: getent每次會讀250筆, 印出來後再讀250筆, 那他如何知道有沒有讀完?
Ans:
他就是一直讀, 直到對方回傳null, 所以每次都是一回合30秒, 直到對方回傳null(包含對方close socket)才結束.

Q4 : 整個架構圖是?
Ans:
看起來是getent ----> wbclient, wbclient再透過pipe 傳command給winbindd, 由winbindd去跟AD要資料.
而此時wbclient會等待一段timeout時間, 若timeout時間沒有拿到資料的話就會fail.


Q3 : flow of winbind (nss function).
Ans:
1. getent group --> _nss_winbind_getgrent_r --> winbind_getgrent --> 
winbindd_request_response --> winbindd_send_request --> winbindd_get_response --> winbind_read_sock

==> _nss_winbind_getgrent_r 會送command給wbclient(command為WINBINDD_GETGRENT)
==> wbclient會包裝成winbind_request後再送給winbindd,
==> winbind_read_sock每次最多會讀250 entries, 送給getent後再繼續讀250筆


Q2 : flow of getent?
Ans:
1. read so file according to nsswitch.conf
2. call nss function from so file (libnss_winbind.so)

Q1 : How to set the timeout value?
Ans:
1. time out value 寫死在code裡面

----- source code -----

ret = poll(&pfd, 1, 5000);
if (ret == -1) {
        winbind_close_sock(ctx);
        return -1;                   /* poll error */
}

if (ret == 0) {
        /* Not ready for read yet... */
        if (total_time >= 30) {
                /* Timeout */
                winbind_close_sock(ctx);
                return -1;
        }
        total_time += 5;
        continue;
}

----- source code -----

----- strace -----

poll([{fd=5, events=POLLIN|POLLHUP}], 1, 5000) = 0 (Timeout)
poll([{fd=5, events=POLLIN|POLLHUP}], 1, 5000) = 0 (Timeout)
poll([{fd=5, events=POLLIN|POLLHUP}], 1, 5000) = 0 (Timeout)
poll([{fd=5, events=POLLIN|POLLHUP}], 1, 5000) = 0 (Timeout)
poll([{fd=5, events=POLLIN|POLLHUP}], 1, 5000) = 0 (Timeout)
poll([{fd=5, events=POLLIN|POLLHUP}], 1, 5000) = 0 (Timeout)
poll([{fd=5, events=POLLIN|POLLHUP}], 1, 5000) = 0 (Timeout)

----- strace -----
";i:1;N;i:2;N;}i:2;i:242;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4846;}i:9;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4846;}}