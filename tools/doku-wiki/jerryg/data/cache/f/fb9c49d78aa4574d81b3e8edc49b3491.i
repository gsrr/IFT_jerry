a:5:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:8:"graphviz";i:1;a:6:{s:5:"width";s:3:"800";s:6:"height";s:3:"400";s:6:"layout";s:3:"dot";s:5:"align";s:5:"right";s:7:"version";s:10:"2016-02-03";s:3:"md5";s:32:"7f68a5aa1a195c0c481f90b3dcb42ff4";}i:2;i:5;i:3;s:1657:"<graphviz dot right 800x400>
digraph ATN {
rankdir=LR;
user[fontsize=11, label="user", shape=rectangle, fixedsize=false];
set_folder[fontsize=11, label="set_folder", shape=rectangle, fixedsize=false];
download_rpm_package[fontsize=11, label="download_rpm_package", shape=rectangle, fixedsize=false];
upload_rpm_package[fontsize=11, label="upload_rpm_package", shape=rectangle, fixedsize=false];
exec_install[fontsize=11, label="exec_install", shape=rectangle, fixedsize=false];
rpm_install[fontsize=11, label="rpm_install", shape=rectangle, fixedsize=false];
docker_load[fontsize=11, label="docker_load", shape=rectangle, fixedsize=false];

set_folder-> download_rpm_package[fontname="Times-Italic", label=""];
download_rpm_package-> upload_rpm_package[fontname="Times-Italic", label=""];
upload_rpm_package-> exec_install[fontname="Times-Italic", label=""];
exec_install-> rpm_install[fontname="Times-Italic", label=""];
rpm_install-> docker_load[fontname="Times-Italic", label=""];

show_install_apps[fontsize=11, label="show_install_apps", shape=rectangle, fixedsize=false];
list_packages[fontsize=11, label="rpm -qa mypackage", shape=rectangle, fixedsize=false];
show_install_apps-> list_packages[fontname="Times-Italic", label=""];

uninstall[fontsize=11, label="uninstall", shape=rectangle, fixedsize=false];
remove_package[fontsize=11, label="rpm -e mypackage", shape=rectangle, fixedsize=false];
remove_docker_process[fontsize=11, label="remove_docker_process", shape=rectangle, fixedsize=false];
uninstall-> remove_package[fontname="Times-Italic", label=""];
remove_package-> remove_docker_process[fontname="Times-Italic", label=""];

}
</graphviz>";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1658;}i:4;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1658;}}