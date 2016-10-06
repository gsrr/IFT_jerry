import os
import sys


BASEDIR = "/cfpool/vpnserver/connection/" 

def main():
    if os.path.exists(BASEDIR) == False:
        os.system("mkdir -p %s"%BASEDIR)

    files = os.listdir(BASEDIR)
    for f in files:
        if sys.argv[1] in f:
            os.remove(BASEDIR + f)
            break
    os.system("touch /cfpool/vpnserver/connection/%s_%s"%(sys.argv[1], sys.argv[2]))

if __name__ == "__main__":
    main()
