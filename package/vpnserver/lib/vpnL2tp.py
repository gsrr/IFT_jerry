import sys
import os
import configLoader

class VPNL2TP:
    def __init__(self):
        self.clobj = configLoader.ConfigVPNL2TP(cfg="/etc/xl2tpd/xl2tpd.conf.default")
        self.clobj.load()
        self.sections = {
            'global' : '[global]',
            'lns' : '[lns default]'
        }

    def getcfg(self):
        print self.clobj.cfg

    def _add(self, *paras):
        section = self.sections[paras[0]]
        key = paras[1]
        value = paras[2]
        self.clobj.add(section, key, value)
    
    def _remove(self, *paras):
        section = self.sections[paras[0]]
        key = paras[1]
        self.clobj.remove(section, key)
    
    def _clearEncAttr(self):
        self._remove('lns', 'refuse pap')
        self._remove('lns', 'require pap')
        self._remove('lns', 'refuse chap')
        self._remove('lns', 'require chap')
        
    def enableRequireAttr(self):
        self._add('lns', 'unix authentication', 'yes')

    def enablePAP(self):
        self._clearEncAttr()
        self._add('lns', 'require pap', 'yes')
        self._add('lns', 'refuse chap', 'yes')

    def enableCHAP(self):
        self._clearEncAttr()
        self._add('lns', 'require chap', 'yes')
        self._add('lns', 'refuse pap', 'yes')

    def unload(self):
        self.clobj.unload("/etc/xl2tpd/xl2tpd.conf")

    def start(self):
        os.system("systemctl start xl2tpd")    
        os.system("systemctl start strongswan")    
    
    def stop(self):
        os.system("systemctl stop xl2tpd")    
        os.system("systemctl stop strongswan")    
        
    def restart(self):
        os.system("systemctl restart xl2tpd")    
        os.system("systemctl restart strongswan")    

    def showconf(self):
        os.system("cat /etc/xl2tpd/xl2tpd.conf")

def decor_test(func):
    def wrap_func():
        vpnobj = VPNL2TP()
        vpnobj.getcfg()
        func(vpnobj)
        vpnobj.unload()
        vpnobj.restart()
        vpnobj.showconf()
        
    return wrap_func

@decor_test
def test_enablePAP(vpnobj):
    vpnobj.enablePAP()
   
@decor_test
def test_enableCHAP(vpnobj):
    vpnobj.enableCHAP()

def main():
    func=getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
