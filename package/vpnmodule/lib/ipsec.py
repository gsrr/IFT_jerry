import sys
import os
import configLoader
import mcommon


def make_replace_func(src, dst):
    def wrap_func(items):
        with open(src, "r") as fr:
            with open(dst, "w") as fw:
                for line in fr.readlines():
                    line = line.strip()
                    for key in items.keys():
                        if key in line:
                            line = line.replace(key, items[key])
                            break
                    fw.write(line + "\n")
    return wrap_func

class IPSec:
    def __init__(self, conf = "/etc/strongswan/ipsec.conf"):
        self.conf = conf
        self.clobj = configLoader.ConfigIPSec(cfg=self.conf + ".default")
        self.clobj.load()

    def getcfg(self):
        print self.clobj.cfg

    def _add(self, *paras):
        key = paras[0]
        value = paras[1]
        self.clobj.add(key, value)
    
    def _remove(self, *paras):
        key = paras[0]
        self.clobj.remove(key)

    def status(self):
        cmd = "systemctl is-active strongswan"
        output = mcommon.call_cmdstr(cmd)[0]
        return output
        
    def replacePSK(self, *paras):
        src = "/etc/strongswan/ipsec.secrets.default"
        dst = "/etc/strongswan/ipsec.secrets"
        items = {'[PSK]' : paras[0]}
        func = make_replace_func(src, dst)
        func(items) 

    def unload(self):
        self.clobj.unload(self.conf)

    def showconf(self):
        os.system("cat %s"%self.conf)

def decor_test(func):
    def wrap_func():
        obj = IPSec("/etc/strongswan/ipsec.conf")
        obj.getcfg()
        obj.unload()
        obj.showconf()
        
    return wrap_func

@decor_test
def test_ipsec(obj):
    pass

def main():
    func=getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
