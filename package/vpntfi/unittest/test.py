import sys
import os

def run():
    cmd = " ".join(sys.argv[2:])
    nascmd = 'echo "%s\nexit\n" | NASCLI'%(cmd) 
    os.system(nascmd)

def main():
    func = getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()