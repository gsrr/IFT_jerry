a:10:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"route related";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:204:"
# add default route
route add default gw 192.168.0.1 

# set route rule:
ip route add default via 172.27.127.254 dev mgmt0

# delete routing rule
route del -net 169.254.0.0 netmask 255.255.0.0 dev eth0

";i:1;N;i:2;N;}i:2;i:34;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:247;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"set static ip";i:1;i:1;i:2;i:247;}i:2;i:247;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:247;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:418:"
# set config: /etc/sysconfig/network-scripts/ifcfg-mgmt0
DEVICE=mgmt0
TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=static
NM_CONTROLLED=no
IPADDR=172.27.112.183
NETMASK=255.255.240.0
GATEWAY=172.27.127.254
IPv6INIT=no
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_PEERDNS=yes
IPV6_PEERROUTES=yes
IPV6_FAILURE_FATAL=no
IPV6ADDR=
IPV6_DEFAULTGW=
NETWORKING_IPV6=no
MTU=1500
USERCTL=no  

# restart network
systemctl restart network


";i:1;N;i:2;N;}i:2;i:280;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:708;}i:9;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:708;}}