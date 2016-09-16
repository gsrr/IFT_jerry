import sys
import os
import configLoader

class PPP:
    def __init__(self, conf):
        self.conf = conf
        self.clobj = configLoader.ConfigLoader(cfg=self.conf + ".default")
        self.clobj.load()

    def getcfg(self):
        print self.clobj.cfg_dict
        print self.clobj.cfg_list

    def _add(self, *paras):
        key = paras[0]
        value = paras[1]
        self.clobj.add(key, value)
    
    def _remove(self, *paras):
        key = paras[0]
        self.clobj.remove(key)
    
    def cleanProtoAttr(self):
        self._remove("refuse-chap")
        self._remove("refuse-pap")
        self._remove("require-chap")
        self._remove("require-pap")
        self._remove("require-mschap-v2")
        
    def enableCHAP(self):
        self.cleanProtoAttr()
        self._add("refuse-pap", "")
        self._add("require-chap", "")
        self._add("require-mschap-v2", "")
    
    def enablePAP(self):
        self.cleanProtoAttr()
        self._add("refuse-chap", "")
        self._add("require-pap", "")
        
    def setDns(self, *paras):
        self._add("dns", paras[0])

    def removeDns(self):
        self._remove("dns")

    def unload(self):
        self.clobj.unload(self.conf)

    def showconf(self):
        os.system("cat %s"%self.conf)

def decor_test(func):
    def wrap_func():
        obj = PPP("/etc/ppp/options.xl2tpd")
        obj.getcfg()
        func(obj)
        obj.unload()
        obj.showconf()
        
    return wrap_func

@decor_test
def test_ppp_enablePAP(obj):
    obj.enablePAP()

def main():
    func=getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
