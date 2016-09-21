import os
import sys

def readFile(path):
    data = []
    with open(path, "r") as fr:
        lines = fr.readlines()
        for line in lines:
            line = line.strip()
            if line.startswith("#"):
                continue
            if line == "":
                continue
            data.append(line)
    
    return data

def install():
    cmds = readFile(sys.argv[2])
    for cmd in cmds:
        #os.system(cmd)
        print cmd

def create_vim():
    packs = os.listdir("/root/.vim/bundle/")
    for p in packs:
        print p

def main():
    func = getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()

