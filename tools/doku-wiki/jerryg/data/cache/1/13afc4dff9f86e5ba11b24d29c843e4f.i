a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:470:"
1. set a channel to block level.
2. Raid command:
  2.1 Debug0> f &show_lun  -->  get LunMapIdx

Debug0> f &show_lun
LunMapIdx:40 chl:2 id:0 lun:0 ss_drv->drvlun:7C0 -->
  Simple Map: LDPartIdx:7C0
  
  2.2 Debug0> f &_map 2 0 0 7c0 0  --> use _map([PhyChl], [Id], [Lun], [DriveUnit], 0) to map

Debug0> f &_map 2 0 0 7c0 0
000000001(rax) 0D801B270(rdx)
(將root所在的disk partition map 到channel 2)

3. discover and login by iscsi command.

4. mount vg_eonfs-root
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}