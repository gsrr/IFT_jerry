a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:8:"graphviz";i:1;a:6:{s:5:"width";s:3:"800";s:6:"height";s:3:"400";s:6:"layout";s:3:"dot";s:5:"align";s:5:"right";s:7:"version";s:10:"2016-02-03";s:3:"md5";s:32:"41cea8a1f67735a5802b02269dfaffba";}i:2;i:5;i:3;s:531:"<graphviz dot right 800x400>
digraph ATN {
download[fontsize=11, label="DOWNLOAD::filepath::offset::size::", shape=rectangle, fixedsize=false];
crc[fontsize=11, label="crc32::length::", shape=rectangle, fixedsize=false];
data[fontsize=11, label="data", shape=rectangle, fixedsize=false];
next[fontsize=11, label="next", shape=rectangle, fixedsize=false];

download-> crc-> data-> next[label="0"];
crc-> download[fontname="Times-Italic", label="1(repeat)"];
data-> download[fontname="Times-Italic", label="1(repeat)"];
}
</graphviz>";}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:532;}i:4;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:532;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:532;}}