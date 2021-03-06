a:50:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"FAQ";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:161:"
Q2 : How to create repository?
Ans:

Q1 : How to checkout remote git tag?
Ans:
1. list all tags --> git tag
2. checkout remote tag --> git checkout <tag_name>

";i:1;N;i:2;N;}i:2;i:24;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:195;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"Repository (Private)";i:1;i:1;i:2;i:195;}i:2;i:195;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:195;}i:7;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:116:"
1. mkdir test_repo
2. cd test_repo && git init --bare
3. git clone root@172.17.22.179:/home/root/working/test_repo
";i:1;N;i:2;N;}i:2;i:235;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:361;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"git tool";i:1;i:1;i:2;i:361;}i:2;i:361;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:361;}i:11;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:188:"
# auto completion
source /etc/bash_completion.d/git
or
source /usr/share/bash-completion/completions/git

# tig
Reference : http://blog.kidwm.net/388
- Change the branch line format: ~


";i:1;N;i:2;N;}i:2;i:389;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:587;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Status";i:1;i:1;i:2;i:587;}i:2;i:587;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:587;}i:15;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:46:"
# git ignore untracked files
git status -uno
";i:1;N;i:2;N;}i:2;i:613;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:671;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Commit";i:1;i:1;i:2;i:671;}i:2;i:671;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:671;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:367:"
# difference for a commit
git diff $commit^ $commit

# list all files in a commit
git diff-tree --no-commit-id --name-only -r $commit

# add a file to last commit and do not change the commit message
git add $file
git commit --amend --no-edit

# modify commit message (before push)
git commit --amend

# modify commit message in cherry-pick
git cherry-pick -e $hash
";i:1;N;i:2;N;}i:2;i:697;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1074;}i:21;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"config related";i:1;i:1;i:2;i:1074;}i:2;i:1074;}i:22;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1074;}i:23;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:500:"
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

";i:1;N;i:2;N;}i:2;i:1108;}i:24;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1617;}i:25;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Merge";i:1;i:1;i:2;i:1617;}i:2;i:1617;}i:26;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1617;}i:27;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:291:"
# cherry-pick with new commit
git cherry-pick -n XXXX

# merge with commits
git checkout master
git merge hotfix # it will merge hotfix branch into master branch with commits.

# merge and write a new commit (discard commits in hotfix branch)
git checkout master
git merge hotfix --squash

";i:1;N;i:2;N;}i:2;i:1642;}i:28;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1942;}i:29;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"Difference";i:1;i:1;i:2;i:1942;}i:2;i:1942;}i:30;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1942;}i:31;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:602:"
# diff show name only
git diff --name-only

# ignore crlf
1. git diff --ignore-space-at-eol

# Visualize per-character differences diff file?
1. git diff --word-diff-regex=.
2. git diff --color-words=.

# Difference in file
git diff HEAD^^ HEAD main.c

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
";i:1;N;i:2;N;}i:2;i:1972;}i:32;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2583;}i:33;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Branch";i:1;i:1;i:2;i:2583;}i:2;i:2583;}i:34;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2583;}i:35;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:393:"
# checkout a remote branch
git pull
git checkout -b test origin/test

# create a local branch
git branch <new_branch_name>

# create a remote branch
git checkout -b <branch-name>
git push <remote-name> <branch-name> or git push <remote-name> <local-branch-name>:<remote-branch-name>

# remove local branch
git branch -d <branch>

# list all branches (include remote branches)
git branch -a


";i:1;N;i:2;N;}i:2;i:2609;}i:36;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3011;}i:37;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Recover";i:1;i:1;i:2;i:3011;}i:2;i:3011;}i:38;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:3011;}i:39;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:564:"
# reset a single file
git checkout HEAD -- my-file.txt

# Reset all files in current branch
git fetch --all  # git-fetch - Download objects and refs from another repository
git reset --hard origin/master

# Remove file in staging area
git reset <file>

# Reset last commit
git reset --hard HEAD~1 (不保留修改的檔案)
--> git reset --hard HEAD^
git reset --soft HEAD~1 (保留修改的檔案)
--> git reset --soft HEAD^

# Modify the last commit message
git commit --amend

# rollback
git revert $hash  # It will create a new commit automatically.
git push
";i:1;N;i:2;N;}i:2;i:3038;}i:40;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:3611;}i:41;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3611;}i:42;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3611;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:" Revert to a specific commit id";}i:2;i:3615;}i:44;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3646;}i:45;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3646;}i:46;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:3646;}i:47;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:59:"
git reset --hard 9bc9775a51432ae4a0ecc57423dd9791a22ea9c0
";i:1;N;i:2;N;}i:2;i:3652;}i:48;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3719;}i:49;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3719;}}