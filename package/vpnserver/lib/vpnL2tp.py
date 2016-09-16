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
        self.services = ['xl2tpd', 'strongswan']

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

    def setLocalip(self, *paras):
        ip = paras[0]
        iphead = ip[::-1].split(".",1)[1][::-1]
        iprange = "%s.1-%s.254"%(iphead, iphead)
        self._add('lns', 'local ip', paras[0])
        self._add('lns', 'ip range', iprange)
        
    def unload(self):
        self.clobj.unload("/etc/xl2tpd/xl2tpd.conf")

    def start(self):
        for srv in self.services:
            os.system("systemctl start %s"%srv)    
    
    def stop(self):
        for srv in self.services:
            os.system("systemctl stop %s"%srv)    
        
    def restart(self):
        for srv in self.services:
            os.system("systemctl restart %s"%srv)    

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
