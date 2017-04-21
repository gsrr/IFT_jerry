a:29:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"flow";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2:"

";i:1;N;i:2;N;}i:2;i:25;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:36;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Related commands";i:1;i:1;i:2;i:36;}i:2;i:36;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:36;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:819:"
# disk
python testHA.py 0 --> show disk information

# create docker volume
def create_docker(HA):
        paras = {}
        paras['operation'] = 'createDocker'
        paras['vgName'] = '0FD492E13BBD3FBE'
        paras['lunId'] = '7'
        paras['lvName'] = 'upload_packs'
        paras['size'] = 26843545600
        paras['controller'] = 'A'
        paras['serviceId'] = '0'
        ret = HA.callGetLocalFunc('folderOperation', paras)
        print ret
        
# destroy docker volume
nascli --> pool destroy 0FD492E13BBD3FBE -z a@0

def destroy_docker(HA):
        paras = {}
        paras['operation'] = 'deletePool'
        paras['poolname'] = '0FD492E13BBD3FBE'
        paras['controller'] = 'A'
        paras['serviceId'] = '0'
        ret = HA.callGetLocalFunc('folderOperation', paras)
        print ret

";i:1;N;i:2;N;}i:2;i:72;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:900;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"waiting to do";i:1;i:1;i:2;i:900;}i:2;i:900;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:900;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:448:"
App docker volume init  ---> Michael , 4/14
--> done in 2017/04/18 
--> Integrate with app cli --> JerryCheng, 4/19

container status , need to monitor and issue event. -->Jerry.Cheng
write config for app when enabling app function --> Jerry.Cheng

container API --> Yuan , 4/19

NVR and App GUI --> Hugh , 4/26

container-nvr (docker):
1. timezone問題 : map /etc/localtime 給 container使用.
2. container-net mode : host mode , nat mode.
3. 
";i:1;N;i:2;N;}i:2;i:933;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:933;}i:13;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1392;}i:14;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"spec";}i:2;i:1394;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:" issue";}i:2;i:1398;}i:16;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1404;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1406;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1412;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2128:"
#config_nvr
mount_point = /mp/E/config_nvr

[global]
serial_number=8576145 (4 bytes unsigned integer)
---------------------------------------


Q : share folder給app使用之後, 是否可以再給其他app使用?
Ans:
預設上先不用

Q : docker是跑在單片controller嗎?
Ans:
目前會跑在雙片的controller上, 所以會在兩邊的controller各建一個docker volume.
目前預設會以一個LV的方式, 由其中切出一塊來作為upload package的地方, 另外一塊作為docker使用.
(預設50G --> 20G / 30G)

Q : 那這個docker volume要給使用者看到嗎? (會由NASCLI這邊進行註記或是直接過濾)
1. 是給使用者看到, 但不給操作.
2. 或是不給使用者看到.
3. 過濾要給NASCLI做, 或是給UI做.

1 & 2
Ans:
這個”docker-volume”我認為它應該要讓使用者可以看得到, 但是不讓使用者可以透過file explorer進行操作. -- from Richard

3
Ans:
在Volume list上對這個volume進行標註, 讓UI進行防堵.


Q : 因為docker volume是建在pool上, 那如果pool re-assign的話, 這個volume可能就會沒辦法使用.
Ans:
pool不能夠被re-assign.

Q : 上傳的package已經安裝在NAS裡面的話, 應該要怎麼處理?
Ans:
不管新舊版本的問題, 對docker就是一整個覆蓋過去, 接下來的問題是原來的configuration能不能被新蓋上去的app所接受.
所以,
“2.2 上傳新版 --> NAS 裡面是舊版”, 這個比較沒有問題, 就是更新版本.
“2.1 上傳舊版 --> NAS 裡面是新版”, 這種降版的狀況就需要GUI幫忙做一些處理, 諸如發警告來確認是不是要降版.

Q : 若container fail的話, 要怎麼處理?
1. container fail --> Restart container.
Ans:
Event是一定要發的, 只是要不要自動restart container這件事要考慮一下,
因為如果故障原因不是可以透過restart來解決的話, 例如working folder不見了,
這樣幫使用者自動重開似乎沒有什麼意義.

2. docker volume fail --> Reinstall package and Restart container
Ans:
這個和前一個問題很類似, 我想還是先發event, 另外再考慮在GUI加recover的機制.
";i:1;N;i:2;N;}i:2;i:1412;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3550;}i:21;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"nascmd - app";i:1;i:1;i:2;i:3550;}i:2;i:3550;}i:22;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:3550;}i:23;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:3268:"
# upload package --> follow existed method


=>> app init -v vvid -l lunid -z a@0
{"cliCode": [{"Return": "0x0000", "CLI": "Successful"}], "returnCode": [], "data": []}
1. create a volume for file system (50G)
=>> pool status -z a@0
{"cliCode": [{"Return": "0x0000", "CLI": "Successful"}], "returnCode": [], "data": [{"used": "33742848", "name": "447720D30A9CFC9D", "uuid": "fd4aa8f5-6b5a-4f78-8238-e68e4383183b", "free": "53627133952", "fstype": "xfs", "member": [{"driveName": "sdf", "used": "53660876800", "name": "d7", "free": "0", "state": "active", "useless": "26214400", "serial": "447720D30A9CFC9D"}], "cluster": false, "state": "active", "peSize": "4096", "folderNum": "1", "owner": "A", "type": "user", "utility": "1.00"}]}

2. pool destroy volume (clear volume)
=>> pool destroy "447720D30A9CFC9D" -z a@0
{"cliCode": [{"Return": "0x0000", "CLI": "Successful"}], "returnCode": [{"code": "0x051200A9", "Params": []}], "data": []}

3. create docker volume
=>> app init -v 447720D30A9CFC9D -l 7 -z a@0
{"cliCode": [{"Return": "0x0001", "CLI": "Failed (general)"}], "returnCode": [], "data": []}

4. lsblk
sdf                                                                                            8:80   0   50G  0 disk
└─79AB37B35236D591-upload_packs                                                              253:7    0   25G  0 lvm   /79AB37B35236D591/upload_packs


=>> app preinstall -z a@0 -n test-1.0-1.x86_64.rpm
=>> {"cliCode": [{"Return": "0x0000", "CLI": "Successful"}], "returnCode": [], "data": [{"Group": "develope", "Name": "nvr", "License": "GPL", "Relocations": "/tmp", "Install Date": "(not installed)", "Build Host": "CentOS7-Build", "Description": "", "Summary": "NVR App", "Source RPM": "nvr-1.0-1.src.rpm", "Version": "1.0", "Architecture": "x86_64", "Signature": "(none)", "Release": "1", "Vendor": "Infortrend", "Packager": "jerry.cheng <jerry.cheng@infortrend.com>", "Size": "840663552", "Build Date": "Fri 31 Mar 2017 06:06:58 AM GMT"}]}

=>> app install -n nvr-1.0-1.x86_64.rpm -z a@0
{"cliCode": [{"Return": "0x0000", "CLI": "Successful"}], "returnCode": [], "data": []}
 # rpm install # deploy file
 # call docker to import dockfile
 # remove installed file (nvr)

=>> app uninstall -n nvr -z a@0
{"cliCode": [{"Return": "0x0000", "CLI": "Successful"}], "returnCode": [], "data": []}
 # call docker to export docker file
 # rpm uninstall
 # no need to clean files in share folder

=>> app config -n nvr -p eyJmb2xkZXIiOiAiL1Bvb2wtMS9mMSJ9 -z a@0
{"cliCode": [{"Return": "0x0000", "CLI": "Successful"}], "returnCode": [], "data": []}
# set config for app

=>> app enable -n nvr -z a@0
{"cliCode": [{"Return": "0x0000", "CLI": "Successful"}], "returnCode": [], "data": []}
# call docker to run docker file

=>> app disable -n nvr -z a@0
{"cliCode": [{"Return": "0x0000", "CLI": "Successful"}], "returnCode": [], "data": []}
# call docker to kill docker process

=>> app list -z a@0
{"cliCode": [{"Return": "0x0000", "CLI": "Successful"}], "returnCode": [], "data": [{"installed": true, "version": "1.0", "config": {"enable": "True", "name": "nvr", "ctrl": "A", "package": "nvr-1.0-1.x86_64.rpm", "version": "1.0", "docker_vol": "/Pool-1/f1/rpms", "folder": "/Pool-1/f1"}, "name": "nvr", "package": "nvr-1.0-1.x86_64.rpm"}]}
";i:1;N;i:2;N;}i:2;i:3582;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3582;}i:25;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:8:"graphviz";i:1;a:6:{s:5:"width";s:3:"800";s:6:"height";s:3:"400";s:6:"layout";s:3:"dot";s:5:"align";s:5:"right";s:7:"version";s:10:"2016-02-03";s:3:"md5";s:32:"7f68a5aa1a195c0c481f90b3dcb42ff4";}i:2;i:5;i:3;s:1657:"<graphviz dot right 800x400>
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
</graphviz>";}i:2;i:6860;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8517;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8521;}i:28;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:8521;}}