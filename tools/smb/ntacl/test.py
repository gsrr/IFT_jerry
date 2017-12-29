import os
import sys
import nascmd_client

def test_set_file():
    os.system("rm -rf /tmp/folder")
    os.system("mkdir /tmp/folder")
    os.system("touch /tmp/folder/file")
    os.system('echo -e "ntacl set -f /tmp/folder/file -a (0;0;2032031;100001):(0;0;1179785;WD) -z a@0\nexit\n" | NASCLI')
    os.system('echo -e "ntacl get -f /tmp/folder/file -z a@0\nexit\n" | NASCLI')

def test_get_file():
    os.system("rm -rf /tmp/folder")
    os.system("mkdir /tmp/folder")
    os.system("touch /tmp/folder/file")
    os.system('echo -e "ntacl get -f /tmp/folder/file -z a@0\nexit\n" | NASCLI')

def main():
    func = getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
