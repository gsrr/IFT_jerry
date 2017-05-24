a:25:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"[Reference]";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12;}i:5;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:128:"https://www.puritys.me/docs-blog/article-71-%E4%BD%BF%E7%94%A8-RPM-Build-%EF%BC%8C%E5%9C%A8Linux-%E6%89%93%E5%8C%85-Package.html";i:1;N;}i:2;i:14;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:142;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"ift rpm package flow";i:1;i:1;i:2;i:144;}i:2;i:144;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:144;}i:9;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:634:"
#1 create rpmbuild environment
mkdir -p /root/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

#2 deploy the file to package
2.1 cd /root/rpmbuild/SOURCES
2.2 mkdir nvr-1.0
2.3 cp /root/vms-20170322.tar.gz ./nvr-1.0/
2.4 tar -zcvf nvr.tar.gz nvr-1.0
2.5 cp nvr.spec /root/rpmbuild/SPECS/
2.6 cp /root/rpmbuild/SPECS/ 
2.7 rpmbuild -bb nvr.spec
2.8
[root@CentOS7-Build SPECS]# ls -l /root/rpmbuild/RPMS/x86_64/
total 199284
-rw-r--r-- 1 root root 204062240 Mar 31 14:46 nvr-1.0-1.x86_64.rpm
-rw-r--r-- 1 root root      1684 Mar 31 14:46 nvr-debuginfo-1.0-1.x86_64.rpm

[installation]
rpm -ivh --prefix=/Pool-1/f1/rpms/ nvr-1.0-1.x86_64.rpm
";i:1;N;i:2;N;}i:2;i:184;}i:10;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:938:"
#將設定的RPM名稱、版號、路徑，以變數的方式指定
%define _topdir /root/rpmbuild/
%define Version 1.0
%define RPM_BUILD_ROOT _topdir
%define Name nvr
#RPM相關資料
Summary:        NVR App
Name:           %{Name}
Version:        %{Version}
Release:        1
Vendor:         Infortrend
Packager:       jerry.cheng <jerry.cheng@infortrend.com>
License:        GPL
Source :        nvr.tar.gz
Group:          develope
Prefix:         /tmp

%description
nvr package

%prep
%setup -q

%build

%install
#設定安裝的實際路徑與檔案
install -d %{buildroot}/tmp/
cp vms-20170322.tar.gz %{buildroot}/tmp/
#cp vms-20170322.tar.gz %{buildroot}/tmp/vms-20170322.tar.gz

%files
#安裝時:設定預設的檔案權限
%defattr(755,root,root)
%attr(755,root,root) /tmp/vms-20170322.tar.gz
#安裝時:設定檔案的屬性 chmod,chown,chgrp
#%attr(755,root,root) /tmp/vms-20170322.tar.gz

%clean
rm -rf %{buildroot}

%postun
";i:1;N;i:2;N;}i:2;i:833;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1782;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"example";i:1;i:1;i:2;i:1782;}i:2;i:1782;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1782;}i:14;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:67:"
/root/myrpm/SOURCES
tar -zcvf vms-1.0.tar.gz vms-20170322.tar.gz

";i:1;N;i:2;N;}i:2;i:1809;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1886;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"rpm usage";i:1;i:1;i:2;i:1886;}i:2;i:1886;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1886;}i:18;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:871:"
[pre-install]
# list information
rpm -qip mypackage-2.0-1.x86_64.rpm

[installed]
# list files in rpm package
[root@CentOS7-Build SPECS]# rpm -ql mypackage
/mnt/test/mytest
/mnt/test/test/mytest

# search rpm package
[root@CentOS7-Build SPECS]# rpm -qa mypackage
mypackage-3.0-1.x86_64

# create rpm package
[root@CentOS7-Build SPECS]# rpmbuild -bb example.spec

# remove rpm package
[root@CentOS7-Build SPECS]# rpm -e mypackage

# install rpm package
[root@CentOS7-Build SPECS]# rpm -ivh ../RPMS/x86_64/mypackage-3.0-1.x86_64.rpm
Preparing...                          ################################# [100%]
Updating / installing...
   1:mypackage-3.0-1                  ################################# [100%]

# list rpm package by vendor name
[root@CentOS7-Build SPECS]# rpm -qa --qf '%{NAME}-%{VERSION}::%{VENDOR}\n' | grep Infortrend
mypackage-3.0::Infortrend


";i:1;N;i:2;N;}i:2;i:1915;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2796;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"content of example.spec";i:1;i:1;i:2;i:2796;}i:2;i:2796;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2796;}i:22;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1016:"
[root@CentOS7-Build SPECS]# cat example.spec
#將設定的RPM名稱、版號、路徑，以變數的方式指定
%define _topdir /root/myrpm/
%define Version 3.0
%define RPM_BUILD_ROOT _topdir
%define Name mypackage
#RPM相關資料
Summary:        My First RPM Package
Name:           %{Name}
Version:        %{Version}
Release:        1
Vendor:         Infortrend
Packager:       myName <mail@gmail.com>
License:        GPL
Group:          develope
Source :        mypackage.tar.gz
Prefix:         /tmp

%description
其他相關說明

%prep
%setup -q

%build

%install
#設定安裝的實際路徑與檔案
install -d %{buildroot}/tmp/test/
install -d %{buildroot}/tmp/test/test
cp mytest %{buildroot}/tmp/test/
cp test/mytest %{buildroot}/tmp/test/test

%files
#安裝時:設定預設的檔案權限
%defattr(755,root,root)
#安裝時:設定檔案的屬性 chmod,chown,chgrp
%attr(755,root,root) /tmp/test/mytest
%attr(755,root,root) /tmp/test/test/mytest

%clean
rm -rf %{buildroot}

%postun
rm -rf /tmp/test
";i:1;N;i:2;N;}i:2;i:2840;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3864;}i:24;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3864;}}