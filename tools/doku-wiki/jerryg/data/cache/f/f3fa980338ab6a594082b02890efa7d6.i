a:51:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"config related";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:81:"
# login with escape password
http.proxy=http://userId:pwd%40123@ipaddress:port

";i:1;N;i:2;N;}i:2;i:35;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:125;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"see the change";i:1;i:1;i:2;i:125;}i:2;i:125;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:125;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:54:"
# see the change in a commit
git diff COMMIT^ COMMIT
";i:1;N;i:2;N;}i:2;i:159;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:222;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"list remote branch";i:1;i:1;i:2;i:222;}i:2;i:222;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:222;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:15:"
git branch -a
";i:1;N;i:2;N;}i:2;i:260;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:284;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"overwrite local files";i:1;i:1;i:2;i:284;}i:2;i:284;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:284;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:113:"
git fetch --all
git reset --hard origin/master

# git-fetch - Download objects and refs from another repository
";i:1;N;i:2;N;}i:2;i:325;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:447;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"create a remote Git branch";i:1;i:1;i:2;i:447;}i:2;i:447;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:447;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:135:"
git checkout -b <branch-name>
git push <remote-name> <branch-name> or git push <remote-name> <local-branch-name>:<remote-branch-name>
";i:1;N;i:2;N;}i:2;i:493;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:637;}i:21;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"compare two branches";i:1;i:1;i:2;i:637;}i:2;i:637;}i:22;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:637;}i:23;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:671;}i:24;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:671;}i:25;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:671;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:" git diff branch_1..branch_2";}i:2;i:675;}i:27;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:703;}i:28;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:703;}i:29;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:703;}i:30;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:704;}i:31;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"rollback";i:1;i:1;i:2;i:704;}i:2;i:704;}i:32;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:704;}i:33;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:727;}i:34;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:727;}i:35;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:727;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:" rollback push";}i:2;i:731;}i:37;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:745;}i:38;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:745;}i:39;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:745;}i:40;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:73:"
git revert $hash  # It will create a new commit automatically.
git push
";i:1;N;i:2;N;}i:2;i:751;}i:41;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:832;}i:42;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:832;}i:43;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:832;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:" Revert to a specific commit id";}i:2;i:836;}i:45;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:867;}i:46;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:867;}i:47;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:867;}i:48;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:59:"
git reset --hard 9bc9775a51432ae4a0ecc57423dd9791a22ea9c0
";i:1;N;i:2;N;}i:2;i:873;}i:49;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:940;}i:50;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:940;}}