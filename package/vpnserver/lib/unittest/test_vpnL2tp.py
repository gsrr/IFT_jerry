import sys
import os
import filecmp
sys.path.append("../")
import vpnL2tp

def compareFile(src, dst):
    return filecmp.cmp(src,dst)

def decor_test(func):
    def wrap_func():
        vpnobj = vpnL2tp.VPNL2TP()
        vpnobj.getcfg()
        src, dst = func(vpnobj)
        vpnobj.unload()
        vpnobj.restart()
        vpnobj.showconf()
        assert True == compareFile(src, dst)
        
    return wrap_func

@decor_test
def test_setLocalip(vpnobj):
    vpnobj.setLocalip("20.0.0.0")
    src = "/etc/xl2tpd/xl2tpd.conf"
    dst = "exp_result/xl2tpd.conf.setLocalip"
    return src, dst

@decor_test
def test_enablePAP(vpnobj):
    vpnobj.enableRequireAttr()
    vpnobj.enablePAP()
    src = "/etc/xl2tpd/xl2tpd.conf"
    dst = "exp_result/xl2tpd.conf.enablepap"
    return src, dst
   
@decor_test
def test_enableCHAP(vpnobj):
    vpnobj.enableCHAP()
    src = "/etc/xl2tpd/xl2tpd.conf"
    dst = "exp_result/xl2tpd.conf.enablechap"
    return src, dst



def main():
    func=getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
