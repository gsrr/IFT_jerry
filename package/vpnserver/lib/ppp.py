import sys
import os
import configLoader

class PPP:
    def __init__(self, conf):
        self.conf = conf
        self.clobj = configLoader.ConfigLoader(cfg=self.conf + ".default")
        self.clobj.load()

    def getcfg(self):
        print self.clobj.cfg

    def _add(self, *paras):
        key = paras[1]
        value = paras[2]
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
        obj = PPP("/etc/ppp/options.xl2tpd")
        obj.getcfg()
        obj.unload()
        
    return wrap_func

@decor_test
def test_ppp(obj):
    pass

def main():
    func=getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
