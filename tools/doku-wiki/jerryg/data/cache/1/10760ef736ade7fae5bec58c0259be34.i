a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"opengrok in windows";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:895:"
[Reference]
1. Opengrok部署 --> https://gtcsq.readthedocs.io/en/latest/openstack/opengrok_xp.html
2. 

[Installation]
== 安裝tomcat ==
1. yum install tomcat*

== 安裝ctags == 
1. wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
2. tar zxvf ctags-5.8.tar.gz
3. cd ctags-5.8
4. ./configure && make && make install

== 安裝opengrok ==
# 下载opengrok
wget https://github.com/OpenGrok/OpenGrok/files/213268/opengrok-0.12.1.5.tar.gz
tar -xvzf opengrok-0.12.1.5.tar.gz
# 拷贝web app源文件
cp opengrok-0.12.1.5/lib/source.war /opt/apache-tomcat-7.0.50/webapps/

# 啟動tomcat
systemctl start tomcat

# 生成代码索引
cd opengrok-0.12.1.5/bin
./OpenGrok index /opt/cecgw/csmp/nova

# 重新生成新代码索引
# 删除原索引，然后再生成！
rm -rf /var/opengrok
./OpenGrok index /opt/cecgw/csmp/nova

[開啟opengrok webpage]
http://172.27.122.95:8080/source
";i:1;N;i:2;N;}i:2;i:40;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:943;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:943;}}