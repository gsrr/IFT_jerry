a:33:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"how to check and install?";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:32;}i:4;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1:"
";i:1;N;i:2;N;}i:2;i:32;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:32;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"playbook for github";}i:2;i:42;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:67;}i:8;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:649:"
- hosts: 127.0.0.1
  roles:
    - davidkarban.git

  tasks:
    - name: clone project from git repo
      git: repo={{ project_git_repo }} dest={{ project_source_path }}

    - name: install prerequisite libs
      yum: name=openssl-devel state=installed

    - name: compile
      command: make
      args:
        chdir: "{{ project_source_path }}"
        creates: "{{ project_source_path }}/wrk"

    - name: install
      command: cp wrk /usr/local/bin
      args:
        chdir: "{{ project_source_path }}"
        creates: /usr/local/bin/wrk

  vars:
    - project_git_repo: https://github.com/wg/wrk.git
    - project_source_path: /tmp/wrk
";i:1;N;i:2;N;}i:2;i:67;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:67;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"playbook for yum install";}i:2;i:725;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:749;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:749;}i:13;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:47:"http://docs.ansible.com/ansible/yum_module.html";i:1;N;}i:2;i:751;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:802;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:808;}i:16;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1023:"
- name: install the latest version of Apache
  yum:
    name: httpd
    state: latest

- name: remove the Apache package
  yum:
    name: httpd
    state: absent

- name: install the latest version of Apache from the testing repo
  yum:
    name: httpd
    enablerepo: testing
    state: present

- name: install one specific version of Apache
  yum:
    name: httpd-2.2.29-1.4.amzn1
    state: present

- name: upgrade all packages
  yum:
    name: '*'
    state: latest

- name: install the nginx rpm from a remote repo
  yum:
    name: http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
    state: present

- name: install nginx rpm from a local file
  yum:
    name: /usr/local/src/nginx-release-centos-6-0.el6.ngx.noarch.rpm
    state: present

- name: install the 'Development tools' package group
  yum:
    name: "@Development tools"
    state: present

- name: install the 'Gnome desktop' environment group
  yum:
    name: "@^gnome-desktop-environment"
    state: present
";i:1;N;i:2;N;}i:2;i:808;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:808;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"Commands";}i:2;i:1841;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1855;}i:20;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:39:"
ansible-playbook playbook_sample.yml

";i:1;N;i:2;N;}i:2;i:1855;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1855;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"What is Ansible?";}i:2;i:1903;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1925;}i:24;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:539:"
Ansible is an open-source automation engine that automates cloud provisioning, 
configuration management, and application deployment.

[cloud provisioning]
cloud provisioning refers to the deployment of a company's cloud computing strategy, 
which typically involves selecting which applications and services will reside in the public cloud.

[role]
Role is a set of tasks and additional files to configure host to serve for a certain role.

[playbook]
Ansible playbooks are a way to send commands to remote computers in a scripted way. 
";i:1;N;i:2;N;}i:2;i:1925;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1925;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"example:";}i:2;i:2473;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2481;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2481;}i:29;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:56:"http://www.codedata.com.tw/social-coding/ansible-github/";i:1;N;}i:2;i:2483;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:2543;}i:31;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2543;}i:32;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2543;}}