import sys
import os
import configLoader

class IPSec:
    def __init__(self, conf):
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
