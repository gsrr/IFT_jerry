a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:442:"
在/etc/profile裡面會設定umask of user.
(/etc/profile 是指全體使用者環境變數設定檔.)

if [ $UID -gt 199 ] && [ "`id -gn`" = "`id -un`" ]; then
    umask 002
else
    umask 022
fi

像022就代表group與other會遮掉r權限.

若輸入umask,會得到 0022
The first bit is used to set special permission.

0755  —- None of the special bits set
1755  —- Sticky bit set
2755  —- SGID bit set
4755  —- SUID bit set

";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}