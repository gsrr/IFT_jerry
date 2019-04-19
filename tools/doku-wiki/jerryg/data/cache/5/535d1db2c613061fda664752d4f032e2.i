a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:653:"
[Reference]
1. https://gitpython.readthedocs.io/en/stable/

[Installation]
pip install gitpython


[usage]
# show remote branches
>>> import git
>>> repo = git.Repo("/root/github/HA.workspace/")
>>> repo.remotes.origin.refs

# show log of current branch
>>> import git
>>> repo = git.Repo("/root/github/HA.workspace/")
>>> repo.git.log(-10) # -10 means last ten log messages


# last diff of commit
>>> import git
>>> repo = git.Repo("/root/github/HA.workspace/")
>>> repo.git.diff('HEAD~1')

# diff of from commit hashcode
>>> import git
>>> repo = git.Repo("/root/github/HA.workspace/")
>>> repo.git.diff('f5d2a069a25a6d01432689cb973cf2358d1dccb5~')
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}