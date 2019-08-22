a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"What is udev?";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:478:"
* /dev在linux用途是存放device node(file-like device nodes). 程式可以透過device node來與系統上的裝置溝通.
* udev根據寫好的rules,在/dev底下建立對應的device node. 而這些rules會根據裝置的屬性去撰寫相關設定條件, 針對符合規則的裝置做對應的處理
(kernel會把裝置相關的events(add/remove/etc.)傳送至udev(藉由netlink)


[Command]
# find driver for drive
udevadm info -a -n /dev/sda | egrep 'looking|DRIVER'
";i:1;N;i:2;N;}i:2;i:34;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:520;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:520;}}