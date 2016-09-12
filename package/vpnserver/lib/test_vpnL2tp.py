import sys
import os
import vpnL2tp

def decor_test(func):
    def wrap_func():
        vpnobj = vpnL2tp.VPNL2TP()
        vpnobj.getcfg()
        #vpnobj.enableRequireAttr()
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
