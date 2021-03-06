a:11:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Reference";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:151:"
# packet flow diagram
http://xkr47.outerspace.dyndns.org/netfilter/packet_flow/

# iptables log
https://websistent.com/linux-iptables-log-everything/
";i:1;N;i:2;N;}i:2;i:30;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:191;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"Commands";i:1;i:1;i:2;i:191;}i:2;i:191;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:191;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:310:"
# Add NASROUTING into PREROUTING
iptables -t nat -A PREROUTING -j NASROUTING -p all

# Show all information
iptables -t nat -L -vn # show all information

# edit rules of iptables
iptables-save > iptables.dump 
...
start to edit 
...
iptables-restore < iptables.dump 

# stop service
systemctl stop firewalld
";i:1;N;i:2;N;}i:2;i:219;}i:8;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1736:"
# Example:
Chain PREROUTING (policy ACCEPT 65670 packets, 9723K bytes)
 pkts bytes target     prot opt in     out     source               destination
84404   11M NASROUTING  all  --  *      *       0.0.0.0/0            0.0.0.0/0
20517 1071K DOCKER     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type LOCAL

Chain DOCKER (2 references)
 pkts bytes target     prot opt in     out     source               destination
    0     0 RETURN     all  --  docker0 *       0.0.0.0/0            0.0.0.0/0
18643  969K DNAT       tcp  --  mgmt0   *       0.0.0.0/0            0.0.0.0/0            tcp to:10.253.253.2

policy:
當您的封包不在您設定的規則之內時，則該封包的通過與否，以 Policy 的設定為準

target:
代表進行的動作， ACCEPT 是放行，而 REJECT 則是拒絕，此外，尚有 DROP (丟棄) 的項目！
RETURN -> 結束目前table, 回到上一層table.
DNAT 
-> stands for destination network address translation.
-> 註明要轉送封包的destination, 在此例子是將mgmt0進來的封包都轉送到10.253.253.2.
-> (防火牆會把這個封包的報頭改寫一次，將目標地址改寫成內網ip,然後再把這個封包發送到內網ip的服務器上)
SNAT:
-> stands for source network address translation.
-> 是把要出去的封包, 其source address進行轉換.
  example:
    iptables -t nat -A POSTROUTING -o iftnic3 -j SNAT --to-source 172.27.112.200
    就是將從iftnic3出去的封包, 其source address都轉成172.27.112.200

MASQUERADE:
iptables -t nat -A POSTROUTING -o iftnic3 -j MASQUERADE
跟SNAT類似, 也是將出去的封包轉換其source address, 差別是在SNAT需要指定to-source, 而MASQUERADE不需要.


";i:1;N;i:2;N;}i:2;i:543;}i:9;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2287;}i:10;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2287;}}