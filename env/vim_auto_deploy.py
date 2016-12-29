import os

def execcmds(cmds):
    for cmd in cmds:
        if type(cmd) == str:
            ret = os.system(cmd)
        else:
            cmd()
        print ret,

def vimrc_deploy():
    cmds = [
        "rm -rf ~/.vimrc",
        "cp vimrc ~/.vimrc",
    ]
    execcmds(cmds)

def pathogen_install():
    cmds = [
        "rm -rf ~/.vim/autoload",
        "rm -rf ~/.vim/bundle",
        "mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim",
    ]
    execcmds(cmds)

def powerline_install():
    def chdir_install():
        pwd = os.getcwd()
        os.chdir("/tmp/powerline")
        os.system("python setup.py install")
        os.chdir(pwd)

    cmds = [
    "rm -rf /tmp/powerline",
    "git clone https://github.com/Lokaltog/powerline /tmp/powerline",
    chdir_install,
    ]
    execcmds(cmds)
    
def monokai_install():
    cmds = [
    "rm -rf ~/.vim/bundle/powerline",
    "git clone https://github.com/sickill/vim-monokai ~/.vim/bundle/vim-monokai",
    "cp monokai.vim ~/.vim/bundle/vim-monokai/colors/monokai.vim"
    ]
    execcmds(cmds)

def nerdtree_install():
    cmds = [
    "rm -rf ~/.vim/bundle/nerdtree",
    "git clone https://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree",
    ]
    execcmds(cmds)

Procedure = [
    ('Deploy vimrc', vimrc_deploy),
    ('Install pathogen', pathogen_install),
    ('Install powerline', powerline_install),
    ('Install monokai', monokai_install),
    ('Install nerdtree', nerdtree_install),
]

def main():
    for p in Procedure:
        print p[0],
        p[1]()
        print
if __name__ == "__main__":
    main()