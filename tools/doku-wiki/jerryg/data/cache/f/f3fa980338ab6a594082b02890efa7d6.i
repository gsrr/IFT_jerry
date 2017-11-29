a:34:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"FAQ";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:124:"
Q1 : How to checkout remote git tag?
Ans:
1. list all tags --> git tag
2. checkout remote tag --> git checkout <tag_name>

";i:1;N;i:2;N;}i:2;i:24;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:158;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"config related";i:1;i:1;i:2;i:158;}i:2;i:158;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:158;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:500:"
# Reference
1. https://ihower.tw/git/basic.html#sec1

# Basic knowledge
Q1: git working tree裡面分為三個區域, working directory, staging area and repository.
Ans:
也就是說, 一開始修改檔案的地方, 叫做working directory.
當執行git add後, 修改後的檔案紀錄就會放到staging area.
當執行git commit後, 檔案紀錄就會被加進repository
(git push就是上傳到remote repository)

# login with escape password
http.proxy=http://userId:pwd%40123@ipaddress:port

";i:1;N;i:2;N;}i:2;i:192;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:701;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Merge";i:1;i:1;i:2;i:701;}i:2;i:701;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:701;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:291:"
# cherry-pick with new commit
git cherry-pick -n XXXX

# merge with commits
git checkout master
git merge hotfix # it will merge hotfix branch into master branch with commits.

# merge and write a new commit (discard commits in hotfix branch)
git checkout master
git merge hotfix --squash

";i:1;N;i:2;N;}i:2;i:726;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1026;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"Difference";i:1;i:1;i:2;i:1026;}i:2;i:1026;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1026;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:349:"
# Difference in commit 
git diff $commit $commit^

# Difference between two branches
        X
        |
        | T
        | |
        | |
        | |
        |/
        B
        |
        |
        S
        
git diff master..topic will show us the difference between X and T
git diff master...topic will show us the difference between B and T
";i:1;N;i:2;N;}i:2;i:1056;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1414;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Branch";i:1;i:1;i:2;i:1414;}i:2;i:1414;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1414;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:339:"
# checkout a remote branch
git pull
git checkout -b test origin/test

# create a remote branch
git checkout -b <branch-name>
git push <remote-name> <branch-name> or git push <remote-name> <local-branch-name>:<remote-branch-name>

# remove local branch
git branch -d <branch>

# list all branches (include remote branches)
git branch -a


";i:1;N;i:2;N;}i:2;i:1440;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1788;}i:21;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Recover";i:1;i:1;i:2;i:1788;}i:2;i:1788;}i:22;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1788;}i:23;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:334:"
# Reset all files in current branch
git fetch --all  # git-fetch - Download objects and refs from another repository
git reset --hard origin/master

# Remove file in staging area
git reset <file>

# Modify the last commit message
git commit --amend

# rollback
git revert $hash  # It will create a new commit automatically.
git push
";i:1;N;i:2;N;}i:2;i:1815;}i:24;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:2158;}i:25;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2158;}i:26;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2158;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:" Revert to a specific commit id";}i:2;i:2162;}i:28;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2193;}i:29;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2193;}i:30;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2193;}i:31;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:59:"
git reset --hard 9bc9775a51432ae4a0ecc57423dd9791a22ea9c0
";i:1;N;i:2;N;}i:2;i:2199;}i:32;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2266;}i:33;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2266;}}