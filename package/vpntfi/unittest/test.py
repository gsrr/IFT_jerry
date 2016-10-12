import sys
import os

def test_case9():
    cmds = [
        "vpn config -z a@0 -p 10.10.10.0 -x 10 -a mschap -k psk111",
        "vpn act -a stop -z a@0",
        "vpn act -a start -z a@0",
    ]
    for cmd in cmds:
        rcmd = 'echo -e "' + cmd + '\\nexit\\n" | NASCLI'
        print rcmd
        os.system(rcmd)

def test_case2():
    cmds = [
        "vpn config -z a@0 -p 10.10.10.0 -x 10 -a mschap -k psk111",
        "vpn act -a stop -z a@0",
        "vpn act -a start -z a@0",
        "vpn config -z a@0 -p 10.10.10.0 -x 10 -a pap -k psk111",
        "vpn act -a restart -z a@0"
    ]
    for cmd in cmds:
        rcmd = 'echo -e "' + cmd + '\\nexit\\n" | NASCLI'
        print rcmd
        os.system(rcmd)

def test_case1():
    cmds = [
        "vpn config -z a@0 -p 10.10.10.0 -x 10 -a pap -k psk111 -d 192.168.99.14",
        "vpn act -a restart -z a@0"
    ]
    for cmd in cmds:
        rcmd = 'echo -e "' + cmd + '\\nexit\\n" | NASCLI'
        print rcmd
        os.system(rcmd)

def run():
    cmd = " ".join(sys.argv[2:])
    nascmd = 'echo "%s\nexit\n" | NASCLI'%(cmd) 
    os.system(nascmd)

def main():
    func = getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()