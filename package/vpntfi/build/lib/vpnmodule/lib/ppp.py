import sys
import os
import configLoader
import mcommon

class PPP:
    def __init__(self, conf = "/etc/ppp/options.xl2tpd"):
        self.conf = conf
        self.clobj = configLoader.ConfigLoader(cfg=self.conf + ".default")
        self.clobj.load()
    
    def log(self, msg):
        with open("/var/log/ppp.log", "a") as fw:
            fw.write(msg + "\n")

    def getcfg(self):
        return {'status' : 0, 'cfg' : [self.clobj.cfg_dict, self.clobj.cfg_list]}
    
    def reloadcfg(self):
        self.clobj.load()

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
        self._remove("refuse-mschap-v2")
        self._remove("require-chap")
        self._remove("require-pap")
        self._remove("require-mschap-v2")
        
    def enableMSCHAP(self):
        self.cleanProtoAttr()
        self._add("refuse-pap", "")
        self._add("refuse-chap", "")
        self._add("require-mschap-v2", "")
    
    def enablePAP(self):
        self.cleanProtoAttr()
        #self._remove("plugin")
        #self._remove("radius-config-file")
        self._add("refuse-chap", "")
        self._add("refuse-mschap-v2", "")
        self._add("require-pap", "")
        
    def setDns(self, *paras):
        if paras[0] == None or paras[0] == "None":
            self._add("ms-dns", "8.8.8.8")
        else:
            self._add("ms-dns", paras[0])

    def removeDns(self):
        self._remove("ms-dns")

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

@decor_test
def test_ppp_enableCHAP(obj):
    obj.enableCHAP()

def main():
    func=getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
