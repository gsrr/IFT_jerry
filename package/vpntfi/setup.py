import traceback
import sys
import os
from distutils.core import setup


def walkall(rootdir):
    data = []
    for (dirpath, dirnames, filenames) in os.walk(rootdir):
        if len(filenames) != 0:
            data.append(("/" + dirpath.split("/", 1)[1], [dirpath + "/" + f for f in filenames]))
    return data

def walkall2(rootdir):
    data = []
    for (dirpath, dirnames, filenames) in os.walk(rootdir):
        print dirpath, dirnames, filenames
        if len(filenames) != 0:
            for f in filenames:
                data.append(dirpath.split("/", 1)[1] + "/" + f)
    return data
    

def callSetup():
    setup(
        name='vpntfi',
        version='0.1',
        packages=['vpnmodule', 'vpnmodule.lib'],
        package_data = {'vpnmodule' : walkall2('vpnmodule/conf') + walkall2('vpnmodule/data')},
        license='Creative Commons Attribution-Noncommercial-Share Alike license',
        long_description=open('README.txt').read(),
        data_files=[
            ('/usr/local/NAS/misc/HAAgent/Config', ['hapack/VPNConfig.py']),
            ('/usr/local/NAS/misc/HAAgent/Config', ['hapack/VPNConfig.xml']),
            ('/usr/local/NAS/misc/HAAgent/Lib/Service', ['hapack/vpnLib.py']),
            ('/usr/local/NAS/misc/Cmd/Exec/Service', ['hapack/vpn.py']),
        ] + walkall("buildroot"),
     )

def removefile(path):
    try:
        os.remove(path)
        print "remove ", path
    except:
        print traceback.format_exc()
        pass
    

# python setup.py install --record files.txt
# cat files.txt | xargs rm -rf
# use pip instead?
def uninstall():
    with open("files.txt", "r") as fr:
        lines = fr.readlines()
        for line in lines:
            line = line.strip()
            removefile(line)

def test():
    print walkall2('vpnmodule/conf')

def main():
    try:
        func = getattr(sys.modules[__name__], sys.argv[1])
        func()
    except:
        print "call setup"
        print traceback.format_exc()
        callSetup()

if __name__ == "__main__":
    main()
